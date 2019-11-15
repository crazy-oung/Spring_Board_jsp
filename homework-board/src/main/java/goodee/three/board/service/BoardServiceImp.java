package goodee.three.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.three.board.mapper.BoardFileMapper;
import goodee.three.board.mapper.BoardMapper;
import goodee.three.board.mapper.CommentMapper;
import goodee.three.board.vo.Board;
import goodee.three.board.vo.Page;

@Transactional
@Service
public class BoardServiceImp implements BoardService{
	@Autowired private BoardMapper boardMapper;
	@Autowired private CommentMapper commentMapper;
	@Autowired private BoardFileMapper boardFileMapper;

	@Override
	public int addBoard(Board board) {
		System.out.println("::: addBoard @ BOARD SERVICE :::");
		// TODO 
		// 보드 값 확인 입력 값 전달하기.
		System.out.println(board.toString());
		int result = boardMapper.insertBoard(board);
		System.out.println(result+"행 입력 후 리턴--");
		return result;
	}

	@Override
	public int modifyBoard(Board board) {
		System.out.println("::: modifyBoard @ BOARD SERVICE :::");
		// TODO 
		// 매퍼로 쿼리 실행하기..
		System.out.println(board.toString());
		int result = boardMapper.updateBoard(board);
		return result;
	}

	@Override
	public int removeBoard(Board board) {
		System.out.println("::: removeBoard @ BOARD SERVICE :::");
		// TODO 
		System.out.println(board.toString());
		//0. 입력한 패스워드가 맞는지 검사
		if(boardMapper.checkPassword(board) != 0){
			//1. 삭제 쿼리 실행 
			commentMapper.deleteAllComments(board);
			boardFileMapper.deleteBoardFile(board);
			boardMapper.deleteBoard(board);
			return 1;
		}
		
		System.out.println("삭제 하지 못함. 비밀번호가 틀림");
		return 0;
	}


	@Override
	public Board getOneBoard(int no) {
		System.out.println("::: getOneBoard @ BOARD SERVICE :::");
		// TODO 
		// 매퍼로부터 값 전달받기/
		System.out.println("선택한 보드 글의 번호 : "+no); 
		Board board = boardMapper.selectOneBoard(no);
		System.out.println("수행 끝` 리턴");
		return board;
	}

	@Override
	public Map<String,Object> getBoardList(int currentPage, String searchWord, int rowPerPage) {
		System.out.println("::: getBoardList @ BOARD SERVICE :::");
		// TODO 
		// 1. 페이지 객체에 값 넣기 
		Page page = new Page();
		page.setRowPerPage(rowPerPage);
		page.setSearchWord(searchWord);
		page.setBeginRow((currentPage-1)*rowPerPage);
		// 페이지 객체 값 확인 
		System.out.println(page.toString());
		
		// 2. 보드 리스트 가져오기
		List<Board> list = boardMapper.selectBoardList(page);
		// -. 페이징
		int totalRow = boardMapper.selectBoardCount(searchWord);
		int lastPage = totalRow / rowPerPage;
		if(totalRow % rowPerPage != 0 ) {
			lastPage++;
		}
		System.out.println("전체행: "+totalRow+" 마지막 페이지: "+lastPage);
		
		// 3. 맵 초기화 
		Map<String, Object> map = new HashMap<String, Object>();
		// 4. 맵에 전달값 저장. 
		// 리스트 
		map.put("list", list);
		// 현재 페이지 
		map.put("currentPage", currentPage);
		// 전체 행 값
		map.put("totalRow", totalRow); 
		// 마지막 페이지 
		map.put("lastPage", lastPage); 
		// 서치 워드 
		map.put("searchWord", searchWord);
		// 6. 리턴
		System.out.println("return");
		return map;
	}
 
	
}
