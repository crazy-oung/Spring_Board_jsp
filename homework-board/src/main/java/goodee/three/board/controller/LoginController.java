package goodee.three.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import goodee.three.board.vo.LoginForm;

@Controller
public class LoginController {
	@GetMapping("login")
	public String login() {
		return "login";
	}
	
	@PostMapping("login")
	public String login(LoginForm loginForm) {
		
		return "redirect:/login";
	}
	
	@GetMapping("logout")
	public String logout() {
	
		return "redirect:/";
	}
	
}
