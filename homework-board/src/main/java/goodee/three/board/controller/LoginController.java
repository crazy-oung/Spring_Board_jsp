package goodee.three.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import goodee.three.board.service.MemberService;
import goodee.three.board.vo.LoginForm;
import goodee.three.board.vo.Member;

@Controller
public class LoginController {
	@Autowired private MemberService memberService;
	
	@GetMapping("login")
	public String login() {
		System.out.println("로그인창 으로!");
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
