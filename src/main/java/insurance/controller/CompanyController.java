package insurance.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import insurance.model.Company;
import insurance.service.CompanyService;

@Controller
public class CompanyController {
	@Autowired
	private CompanyService companyService;
	
	@GetMapping("/companies")
	public String getAllCompanies(HttpServletRequest request) {
		request.setAttribute("module", "company");
		request.setAttribute("mode", "page");
		request.setAttribute("companies", companyService.getAllCompanies());
		return "index";
	}
	@RequestMapping("/new-company")
	public String newTask(HttpServletRequest request) {
		request.setAttribute("module", "company");
		request.setAttribute("mode", "crud");
		return "index";
	}
	@PostMapping("/save-company")
	public String saveCompany(@ModelAttribute Company company,BindingResult bindingResult,HttpServletRequest request,RedirectAttributes redirectAttributes) {
		company.setCreationDate(new Date());
		companyService.save(company);
		request.setAttribute("module", "company");
		request.setAttribute("mode", "page");
		redirectAttributes.addFlashAttribute("message", "Company Added Successfully");
	    redirectAttributes.addFlashAttribute("classname", "success");
		return "redirect:/companies";
	}
	
	@RequestMapping("/delete-company")
	public String deleteCompany(@RequestParam Long id,HttpServletRequest request) {
		companyService.delete(id);
		request.setAttribute("module", "company");
		request.setAttribute("mode", "page");
		return "redirect:/companies";
	}
	@RequestMapping("/update-company")
	public String updateCompany(@RequestParam Long id,HttpServletRequest request) {
		request.setAttribute("company", companyService.getCompanyById(id));
		request.setAttribute("module", "company");
		request.setAttribute("mode", "crud");
		return "index";
	}
	//Ajax example
	/*@RequestMapping("/get-company")
	public ResponseEntity<Object> getCompany(@RequestParam Long id,HttpServletRequest request) {
		Company company = companyService.getCompanyById(id);
		return new ResponseEntity<>(company,HttpStatus.OK);
	}*/
	
	
}
