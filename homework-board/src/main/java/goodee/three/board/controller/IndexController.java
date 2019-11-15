package goodee.three.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	
	@GetMapping({"/", "index"})
	public String index() {
		System.out.println("인덱스 페이지 접근");
		return "index";
	}
}
