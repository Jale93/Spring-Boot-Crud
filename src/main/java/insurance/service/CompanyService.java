package insurance.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import insurance.model.Company;

import insurance.repository.CompanyRepository;

@Service
@Transactional
public class CompanyService {
	@Autowired
	private CompanyRepository companyRepository;
	private DepartmentService departmentService;
	@Autowired
    public void setDepartmentService(DepartmentService departmentService) {
        this.departmentService = departmentService;
    }
	public List<Company> getAllCompanies() {
		List<Company> companies = new ArrayList<>();
		for(Company company:companyRepository.findAll()) {
			companies.add(company);
		}
		return companies;
	}
	public Company getCompanyById(Long id) {
		Company company = new Company();
		company = companyRepository.findById(id).get();
		return company;
	}
	public void save(Company company) {
		companyRepository.save(company);
	}
	public void delete(Long id) {
		companyRepository.deleteById(id);
	}
	
	
}
