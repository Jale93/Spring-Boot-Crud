package insurance.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import insurance.SpringUtil;
import insurance.model.Department;
import insurance.service.CompanyService;
import insurance.service.DepartmentService;

@Controller
public class DepartmentController {
	@Autowired
	private DepartmentService departmentService;
	CompanyService companyService = SpringUtil.getBean(CompanyService.class);
	@RequestMapping("/departments")
	public String getAllDepartments(HttpServletRequest request) {
		request.setAttribute("module", "department");
		request.setAttribute("mode", "page");
		request.setAttribute("departments", departmentService.getAllDepartments());
		request.setAttribute("companies", companyService.getAllCompanies());
		return "index";
	}
	
	@RequestMapping("/new-department")
	public String newTask(HttpServletRequest request) {
		request.setAttribute("module", "department");
		request.setAttribute("mode", "crud");
		return "index";
	}
	@PostMapping("/save-department")
	public String saveCompany(@ModelAttribute Department department,BindingResult bindingResult,HttpServletRequest request) {
		department.setCreationDate(new Date());
		departmentService.save(department);
		request.setAttribute("module", "department");
		request.setAttribute("mode", "page");
		return "redirect:/departments";
	}
	
	@RequestMapping("/delete-department")
	public String deleteDepartment(@RequestParam Long id,HttpServletRequest request) {
		departmentService.delete(id);
		request.setAttribute("module", "department");
		request.setAttribute("mode", "page");
		return "redirect:/departments";
	}
	@RequestMapping("/update-department")
	public String updateCompany(@RequestParam Long id,HttpServletRequest request) {
		request.setAttribute("department", departmentService.getDepartmentById(id));
		request.setAttribute("cmpns", companyService.getAllCompanies());
		request.setAttribute("module", "department");
		request.setAttribute("mode", "crud");
		return "index";
	}
}
