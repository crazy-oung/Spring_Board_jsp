package goodee.three.board.service;

import java.util.Map;

import goodee.three.board.vo.Board;
import goodee.three.board.vo.Page;

public interface BoardService {	// 보드 서비스 인터페이스를 상속 받아서 추상 클래스를 오버라이딩 한다 
	public int addBoard(Board board);
	public int modifyBoard(Board board);
	public int removeBoard(Board board);
	public Map<String,Object> getBoardList(int currentPage, String searchWord, int rowPerPage);
	public Board getOneBoard(int boardNo);
}
