package de.smact.backoffice.dataloader

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.data.jdbc.repository.config.EnableJdbcRepositories

@SpringBootApplication
@EnableJdbcRepositories
class DataLoaderApplication

fun main(args: Array<String>) {
    runApplication<DataLoaderApplication>(*args)
}
