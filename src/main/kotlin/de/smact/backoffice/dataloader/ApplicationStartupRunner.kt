package de.smact.backoffice.dataloader

import mu.KotlinLogging
import org.springframework.beans.factory.annotation.Value
import org.springframework.boot.ApplicationArguments
import org.springframework.boot.ApplicationRunner
import org.springframework.stereotype.Component

@Component
class ApplicationStartupRunner: ApplicationRunner {

    private val logger = KotlinLogging.logger {}

    @Value("\${info.build.version}")
    lateinit var appVersion: String

    override fun run(args: ApplicationArguments?) {
        logger.info { "App with version $appVersion started." }
    }
}
