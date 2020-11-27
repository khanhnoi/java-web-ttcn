package vn.edu.vinaenter.controller.auth;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("auth")
public class AuthController {
	
	
	@GetMapping("/login")
	public String index() {
		return "auth.login";
	}
	@GetMapping("/403")
	public String error403() {
		return "403";
	}
	@GetMapping("/404")
	public String error404() {
		return "404";
	}
	
}
