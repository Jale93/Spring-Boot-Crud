package insurance.repository;

import org.springframework.data.repository.CrudRepository;

import insurance.model.Company;

public interface CompanyRepository extends CrudRepository<Company, Long> {
}
