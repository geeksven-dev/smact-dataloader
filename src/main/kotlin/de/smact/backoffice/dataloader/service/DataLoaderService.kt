package de.smact.backoffice.dataloader.service

import de.smact.backoffice.dataloader.cellValueAsString
import de.smact.backoffice.dataloader.model.Company
import de.smact.backoffice.dataloader.model.api.LoaderResultResponse
import mu.KotlinLogging
import org.apache.poi.hssf.usermodel.HSSFWorkbook
import org.apache.poi.ss.usermodel.Row
import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Service
import java.io.File
import java.io.FileInputStream

@Service
class DataLoaderService(private val companyService: CompanyService,
                        @Value("\${app.loader.input.dir}") private val inputDir: String) {

    private val logger = KotlinLogging.logger {}

    fun runDataLoading(truncateCompanies: Boolean, specificFile: String?): List<LoaderResultResponse> {
        logger.info { "input dir for excel files: $inputDir" }
        if(truncateCompanies) companyService.deleteAll().run { logger.info { "truncating companies" } }

        val corporateMappings = this::class.java.getResourceAsStream("/corporate.mapping").bufferedReader().readLines()
                .associate { line ->
                    val (left, right) = line.split("=")
                    left to right
                }

        var filtered = File(inputDir).listFiles()!!
                .filter { it.extension == "xls" }

        if(!specificFile.isNullOrBlank()) {
            filtered = filtered.filter { it.name == specificFile }
        }

        return filtered
                .map { it ->
                    val filename = it.name
                    try {
                        val defaultDbColumns = mutableMapOf("companyname" to "Unternehmen",
                                "zipcode" to "PLZ",
                                "street" to "Strasse",
                                "city" to "Ort",
                                "mainsector" to "NACE-Branche",
                                "corporatename" to "Rechtsform",
                                "established" to "Gründung",
                                "staffquantity" to "Mitarbeiter",
                                "backupnumber" to "Telefon",
                                "website" to "Website",
                                "annualsalesyear" to "Umsatzjahr",
                                "lastannualsales" to "Umsatz",
                                "subsidiaries" to "Niederlassungen",
                                "email" to "E-Mail",
                                "contact" to "Führung 1")

                        val absolutePath = it.absolutePath
                        lookupMappingFile(absolutePath, defaultDbColumns)

                        val excelFile = FileInputStream(File(absolutePath))
                        val workbook = HSSFWorkbook(excelFile)
                        val sheet = workbook.sheetIterator().next()
                        val rows = sheet.iterator()
                        val rowList = rows.asSequence().toList()
                        val columns = rowList[0].cellIterator().asSequence().toList()
                                .filter { cell -> cell.cellValueAsString().isNotEmpty() }
                                .associate { cell -> cell.columnIndex to cell.cellValueAsString() }
                        val subtract = defaultDbColumns.values.subtract(columns.values)
                        if(subtract.isNotEmpty()) logger.info { "file does not contain all default columns. Please add mapping file for $filename" }.let { return@map LoaderResultResponse(
                                filename = filename,
                                message = "Missing column mappings: ${subtract.map { missingColumn -> defaultDbColumns.filterValues { it == missingColumn }.keys.first() }}"
                        ) }
                        val companies = rowList.drop(1).map {
                            Company(
                                    companyname = getCellNullSafe(it, "companyname", columns, defaultDbColumns),
                                    zipcode = getCellNullSafe(it, "zipcode", columns, defaultDbColumns),
                                    street = getCellNullSafe(it, "street", columns, defaultDbColumns),
                                    city = getCellNullSafe(it, "city", columns, defaultDbColumns),
                                    mainsector = correctNaceNumber(getCellNullSafe(it, "mainsector", columns, defaultDbColumns)),
                                    corporatename = normalizeCorporate(getCellNullSafe(it, "corporatename", columns, defaultDbColumns), corporateMappings),
                                    established = getCellNullSafe(it, "established", columns, defaultDbColumns),
                                    staffquantity = getCellNullSafe(it, "staffquantity", columns, defaultDbColumns),
                                    telareacode = parseAreaCode(getCellNullSafe(it, "backupnumber", columns, defaultDbColumns)),
                                    telnumber = parseNumber(getCellNullSafe(it, "backupnumber", columns, defaultDbColumns)),
                                    backupnumber = getCellNullSafe(it, "backupnumber", columns, defaultDbColumns),
                                    website = correctWebsite(getCellNullSafe(it, "Website", columns, defaultDbColumns)),
                                    annualsalesyear = getCellNullSafe(it, "annualsalesyear", columns, defaultDbColumns),
                                    lastannualsales = getCellNullSafe(it, "lastannualsales", columns, defaultDbColumns),
                                    subsidiaries = getCellNullSafe(it, "subsidiaries", columns, defaultDbColumns),
                                    email = getCellNullSafe(it, "email", columns, defaultDbColumns),
                                    contact = getCellNullSafe(it, "contact", columns, defaultDbColumns)
                            )
                        }

                        logger.info { "inserting companies ($filename): ${companies.size}" }
                        logger.info { "using following mappings: $defaultDbColumns" }
                        companyService.saveCompanies(companies)
                        logger.info { "inserting companies finished" }
                        workbook.close()
                        excelFile.close()
                        return@map LoaderResultResponse(filename = filename,
                                companiesExcelCount = rowList.drop(1).size,
                                companiesImportedCount = companies.size,
                                message = "import successful")
                    } catch(e: Exception) {
                        return@map LoaderResultResponse(
                                filename = filename,
                                message = e.message
                        )
                    }
                }.toList()
    }

    private fun normalizeCorporate(corporate: String, corporateMappings: Map<String, String>): String {
        return if(corporateMappings.filterValues { it.contains(corporate) }.isEmpty()) corporate
        else corporateMappings.filterValues { it.contains(corporate) }.keys.first()
    }

    private fun lookupMappingFile(absolutePath: String, defaultDbColumns: MutableMap<String, String>) {
        val mappingFile = File(absolutePath.replace(".xls", ".mapping"))
        if(mappingFile.exists()) {
            logger.debug { "mapping file found: ${mappingFile.name}" }
            mappingFile.forEachLine { val (left, right) = it.split(":")
                logger.debug { "overriding column mapping: [$left] -> [$right]" }
                if(right == "<ignore>") {
                    logger.debug { "ignoring mapping for $left" }
                    defaultDbColumns.remove(left)
                    return@forEachLine
                } else {
                    defaultDbColumns[left] = right
                }
            }
        }
    }

    private fun correctWebsite(website: String) = website.replace("http//", "http://").replace("https//", "https://")
    private fun parseAreaCode(phoneNumber: String): String = replaceCommonParts(phoneNumber)[0].replace("(", "")
    private fun parseNumber(phoneNumber: String): String = if(replaceCommonParts(phoneNumber).size > 1) replaceCommonParts(phoneNumber)[1].replace("(", "") else ""
    private fun replaceCommonParts(phoneNumber: String) = phoneNumber.replace(" ", "").replace("-", "").split(")")

    private fun correctNaceNumber(naceNumber: String): String {
        return when {
            naceNumber.isEmpty() -> ""
            naceNumber.length < 5 -> {
                logger.debug { "corrected nace $naceNumber to ${naceNumber.padStart(5, '0')}" }
                naceNumber.padStart(5, '0')
            }
            else -> naceNumber
        }
    }

    private fun getCellNullSafe(currentRow: Row, mappingName: String, columns: Map<Int, String>, defaultDbColumns: MutableMap<String, String>): String {
        val columnName = defaultDbColumns[mappingName]
        return if (columnName == null || columns.filterValues { it == columnName }.keys.isEmpty()) ""
        else currentRow.getCell(columns.filterValues { it == columnName }.keys.first(), Row.MissingCellPolicy.CREATE_NULL_AS_BLANK).cellValueAsString()
    }
}
