package insurance.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import insurance.model.Department;
import insurance.repository.DepartmentRepository;

@Service
public class DepartmentService {
	@Autowired
	private DepartmentRepository departmentRepository;
	private CompanyService companyService;
	@Autowired
	public void setCompanyService(CompanyService companyService) {
		this.companyService = companyService;
	}
	public List<Department> getAllDepartments(){
		List<Department> departments = new ArrayList<>();
		for (Department department : departmentRepository.findAll()) {
			departments.add(department);
		}
		return departments;
	}
	public Department getDepartmentById(Long id) {
		Department department = new Department();
		department = departmentRepository.findById(id).get();
		return department;
	}
	
	public void save(Department department) {
		departmentRepository.save(department);
	}
	public void delete(Long id) {
		departmentRepository.deleteById(id);
	}
//	public Company getCompanyByDepartmentId(Long id) {
//		Department department = new Department();
//		department = departmentRepository.findById(id).get();
//		Company company = companyService.getCompanyById(department.getCompanyId());
//		return company;
//	}
}
