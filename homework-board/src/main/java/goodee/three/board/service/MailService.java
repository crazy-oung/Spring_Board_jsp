package goodee.three.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import goodee.three.board.vo.MailForm;
import goodee.three.board.vo.Member;
 
@Service
public class MailService {
    @Autowired
    private JavaMailSender javaMailSender;
    
    public void sendMail(MailForm mailForm) {
        
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        
        simpleMailMessage.setTo(mailForm.getTo()); 
        simpleMailMessage.setSubject(mailForm.getSubject());
        simpleMailMessage.setText(mailForm.getContent());
        
        javaMailSender.send(simpleMailMessage);
    }
    
    public String sendEmailToConfirm(Member member) {
    	System.out.println("-> sendEmailToConfirm SERVICE 진입 ");
    	SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
    	String str = "";
    	System.out.println("메일 컨텐츠 설정"); 
    	simpleMailMessage.setTo(member.getMemberId()); 
    	simpleMailMessage.setSubject("회원가입 인증메일입니다.");
    	int[] code = new int[6];
    	for(int i =0;i<6;i++) {
    		code[i] = (int) (Math.random()*9)+1;
    	}
    	str += code[0];
    	str += code[1];
    	str += code[2];
    	str += code[3];
    	str += code[4];
    	str += code[5];
    	
    	System.out.println(str); 
    	String text= member.getMemberName()+"님! 회원가입 인증 코드는 [ "+str+" ]입니다."; 
    	simpleMailMessage.setText(text); 
    	
    	System.out.println("메일 전송");
    	
    	javaMailSender.send(simpleMailMessage);
    	
    	System.out.println("sendEmailToConfirm SERVICE 리턴 -> ");
    	 
    	return str;
    }
} 

