package goodee.three.board.controller; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import goodee.three.board.service.MailService;
import goodee.three.board.vo.MailForm;
 
 
@Controller
public class MailController {
    @Autowired MailService mailService;
    
    @GetMapping("/sendMail")
    public String sendMail() {
        return "sendMail";
    }
    
    @PostMapping("/sendMail")
    public String senMail(MailForm mailForm) {
        mailService.sendMail(mailForm); 
        return "redirect:/";
    }
    
    @GetMapping("/")
    public String index() {
        return "index";
    }
} 

