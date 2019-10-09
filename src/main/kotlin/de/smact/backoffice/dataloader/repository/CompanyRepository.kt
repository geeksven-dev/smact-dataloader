package de.smact.backoffice.dataloader.repository

import de.smact.backoffice.dataloader.model.Company
import org.springframework.data.repository.CrudRepository

interface CompanyRepository: CrudRepository<Company, Int>
