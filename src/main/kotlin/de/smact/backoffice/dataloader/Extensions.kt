package de.smact.backoffice.dataloader

import org.apache.poi.ss.usermodel.Cell
import org.apache.poi.ss.usermodel.DataFormatter

fun Cell.cellValueAsString(): String = DataFormatter().formatCellValue(this).replace("'", "")
