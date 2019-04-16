package insurance.repository;

import org.springframework.data.repository.CrudRepository;

import insurance.model.Department;

public interface DepartmentRepository extends CrudRepository<Department, Long> {
}
