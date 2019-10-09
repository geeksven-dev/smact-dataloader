package de.smact.backoffice.dataloader.model

import org.springframework.data.annotation.Id
import org.springframework.data.relational.core.mapping.Table

@Table("company_global")
data class Company(
        @Id val id: Int? = null,
        val companyname: String,
        val zipcode: String,
        val street: String,
        val city: String,
        val country: String = "50",
        val mainsector: String,
        val corporatename: String,
        val established: String,
        val staffquantity: String,
        val telareacode: String,
        val telnumber: String,
        val backupnumber: String,
        val website: String,
        val annualsalesyear: String,
        val lastannualsales: String,
        val subsidiaries: String,
        val email: String,
        val contact: String
)

//fun List<Company>.toBatchInserStatement() = "INSERT INTO company_global (companyname, zipcode, street, city, country, mainsector, corporatename, established, staffquantity, telareacode, telnumber, backupnumber, website, annualsalesyear, lastannualsales, subsidiaries, email, contact) VALUES " + this.joinToString(separator = ", \n") { "('${it.companyname}',  '${it.zipcode}', '${it.street}', '${it.city}', '${it.country}', '${it.mainsector}', '${it.corporatename}', '${it.established}', '${it.staffquantity}', '${it.telareacode}', '${it.telnumber}', '${it.backupnumber}', '${it.website}', '${it.annualsalesyear}', '${it.lastannualsales}', '${it.subsidiaries}', '${it.email}', '${it.contact}')" } + ";\n"
