package goodee.three.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	
	@GetMapping("index")
	public String index(HttpSession session) {
		System.out.println("인덱스 페이지 접근");
		if(session.getAttribute("loginMember") == null) {
			System.out.println("Back to login");
			return "login";
		}
		
		System.out.println(session.getAttribute("loginMember"));
		return "index";
	}
}
