package goodee.three.board.service;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import goodee.three.board.vo.MailForm;
 
@Service
public class MailService {
    @Autowired
    private JavaMailSender javaMailSender;
    
    public void sendMail(MailForm mailForm) {
        
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        
        simpleMailMessage.setTo(mailForm.getTo());
        simpleMailMessage.setFrom(mailForm.getFrom());
        simpleMailMessage.setSubject(mailForm.getSubject());
        simpleMailMessage.setText(mailForm.getContent());
        
        javaMailSender.send(simpleMailMessage);
    }
} 

