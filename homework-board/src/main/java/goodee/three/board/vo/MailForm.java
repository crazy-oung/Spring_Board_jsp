package goodee.three.board.vo;
 
import lombok.Data;
 
@Data
public class MailForm {
    private String to;
    private String from;
    private String subject;
    private String content;
} 