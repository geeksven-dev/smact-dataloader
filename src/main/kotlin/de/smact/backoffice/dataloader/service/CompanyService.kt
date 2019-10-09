package de.smact.backoffice.dataloader.service

import de.smact.backoffice.dataloader.model.Company
import de.smact.backoffice.dataloader.repository.CompanyRepository
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
class CompanyService(private val companyRepository: CompanyRepository) {

    @Transactional
    fun saveCompanies(companies: List<Company>): MutableIterable<Company> = companyRepository.saveAll(companies)

    @Transactional
    fun deleteAll() = companyRepository.deleteAll()
}
