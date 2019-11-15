package goodee.three.board.vo;

import lombok.Data;

@Data	// 자동으로 get set toString 메소드 생성 Lombok ♥
public class BoardFile {
	private int fileNo;
	private int boardNo;
	private String fileName;
	private String extension;
	private String contentType;
	private String size;
	private String originName;
}
