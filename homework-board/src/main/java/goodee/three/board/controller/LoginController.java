package goodee.three.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.three.board.service.MemberService;
import goodee.three.board.vo.LoginForm;
import goodee.three.board.vo.Member;

@Controller
public class LoginController {
	@Autowired private MemberService memberService;
	
	// 회원가입 접근
	@GetMapping("addMember")
	public String addMember(HttpSession session) {
		System.out.println("addMember GET @ CONTROLLER");
		if(session.getAttribute("loginMember") != null) {
			System.out.println("Back to index");
			return "/";
		} 
		return "join";
	} 
	
	// 회원가입 액션
	@PostMapping("addMember")
	public void addMember(Member member) {
		System.out.println("addMember POST @ CONTROLLER"); 
		System.out.println(member); 
		int code = 1111;
		confirmCode(member, code);
	} 
	 
	public String confirmCode() {
		System.out.println("확인 코드 입력창으로 이동...");
		return "confirmCode";
	}
	
	// 확인 코드 입력창에서 코드 입력 받음.
	@PostMapping("confirmCode")
	public String confirmCode(Member member,@RequestParam(value = "code")int code) {
		confirmCode();
		
		int good =0 ;
		if(code != good) {
			return "confirmCode";
		}
		memberService.addMember(member); 
		
		return "login";
	}
	
	@GetMapping("login")
	public String login(HttpSession session) {
		if(session.getAttribute("loginMember") != null) {
			System.out.println("이미 로그인 된 회원.");
			return "/";
		}
		System.out.println("로그인창 으로!");
		return "login";
	}
	
	@PostMapping("login")
	public String login(HttpSession session, LoginForm loginForm) {
		System.out.println(loginForm);
		Member member = memberService.getOneMemberInfo(loginForm);
		session.setAttribute("loginMember", member);
		return "redirect:/";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) { 
		session.invalidate();
		return "redirect:/login";
	}
	
}
