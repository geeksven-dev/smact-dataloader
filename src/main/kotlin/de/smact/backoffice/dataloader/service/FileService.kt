package de.smact.backoffice.dataloader.service

import de.smact.backoffice.dataloader.model.api.FileResponse
import de.smact.backoffice.dataloader.model.api.MappingFileResponse
import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Service
import java.io.File

@Service
class FileService(@Value("\${app.loader.input.dir}") private val inputDir: String) {

    fun listFiles() : List<FileResponse> {
        val file = File(inputDir)
        return if(file.exists()) file.listFiles()
                ?.filter { it.extension == "xls" }
                ?.map { FileResponse(filename = it.name, mappingFileResponse = getMappingFile(it)) } ?: emptyList()
            else emptyList()
    }

    private fun getMappingFile(xlsFile: File): MappingFileResponse? {
        val mappingFile = File(xlsFile.absolutePath.replace("xls", "mapping"))
        return if(mappingFile.exists()) MappingFileResponse(mappingFile.readLines().map { val (left, right) = it.split(":")
            return@map Pair(left, right)
        })
        else null
    }
}
