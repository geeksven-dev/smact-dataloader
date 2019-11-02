package de.smact.backoffice.dataloader.controller

import de.smact.backoffice.dataloader.service.DataLoaderService
import de.smact.backoffice.dataloader.service.FileService
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/v1/loader")
class DataLoaderController(private val dataLoaderService: DataLoaderService,
                           private val fileService: FileService) {

    @GetMapping("/run")
    fun loadFiles(@RequestParam(value = "truncateCompanies", required = false, defaultValue = "false") truncateCompanies: Boolean,
                  @RequestParam(value = "specificFile", required = false) specificFile: String?) = dataLoaderService.runDataLoading(truncateCompanies, specificFile)

    @GetMapping("/files")
    fun listFiles() = fileService.listFiles()

}
