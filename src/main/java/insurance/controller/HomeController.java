package insurance.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("/")
	public String home(HttpServletRequest request) {
		request.setAttribute("module", "home");
		request.setAttribute("mode", "MODE_HOME");
		return "index";
	}
}
