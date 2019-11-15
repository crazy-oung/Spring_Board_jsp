package goodee.three.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import goodee.three.board.vo.Board;
import goodee.three.board.vo.Page;

@Mapper
public interface BoardMapper{
	
	public int deleteBoard(Board board);
	public int updateBoard(Board board);
	
	public int insertBoard(Board board);
	
	public Board selectOneBoard(int no);
	public List<Board> selectBoardList(Page page);
	
	public int selectBoardCount(String searchWord);
	
}
