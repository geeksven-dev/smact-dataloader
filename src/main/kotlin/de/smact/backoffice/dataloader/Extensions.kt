package de.smact.backoffice.dataloader

import org.apache.poi.ss.usermodel.Cell
import org.apache.poi.ss.usermodel.DataFormatter

fun Cell.cellValueAsString(): String = DataFormatter().formatCellValue(this).replace("'", "")
inline fun <T> configure(receiver: T, block: T.() -> Unit) = receiver.block()
