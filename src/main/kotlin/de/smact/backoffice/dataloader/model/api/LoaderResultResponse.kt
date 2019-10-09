package de.smact.backoffice.dataloader.model.api

data class LoaderResultResponse(val filename: String,
                                val companiesExcelCount: Int? = 0,
                                val companiesImportedCount: Int? = 0,
                                val message: String?)
