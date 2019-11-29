package goodee.three.board.rest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import goodee.three.board.service.MailService;
import goodee.three.board.service.MemberService;
import goodee.three.board.vo.Member;

@RestController
public class RestMailController {
	@Autowired private MailService mailService;
	@Autowired private MemberService memberService;
	
	@PostMapping("/rest/sendEmailToConfirm")
    public String sendEmailToConfirm(HttpSession session, Member member) {
    	System.out.println("::: sendEmailToConfirm controller :::"); 
    	System.out.println(member);
    	String code = mailService.sendEmailToConfirm(member); 
    
    	session.setAttribute("code", code);
    	return "success";
    }
	
	@PostMapping("/rest/checkCode")
	public String checkCode(HttpSession session, Member member, String code) {
		System.out.println("::: checkCode controller :::"); 
		System.out.println(member+"code: "+code);
		System.out.println(session.getAttribute("code"));
		if(session.getAttribute("code").equals(code) != true) {
			return "false";
		}
		
		memberService.addMember(member);		
		return "success";
	}
	
	
}
