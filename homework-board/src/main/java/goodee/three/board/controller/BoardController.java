package goodee.three.board.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.three.board.service.BoardService;
import goodee.three.board.vo.Board;
import goodee.three.board.vo.Member; 

@Controller
public class BoardController {
	@Autowired BoardService boardService;
	
	// 보드 수정 접근
	@GetMapping("modifyBoard")
	public String modifyBoard(HttpSession session,Model model, @RequestParam("boardNo")int boardNo) {
		System.out.println("modifyBoard get! @ CONTROLLER");
		if(session.getAttribute("loginMember") == null) {
			System.out.println("Back to login");
			return "login";
		}
		model.addAttribute("board",boardService.getOneBoard(boardNo));
		return "modifyBoard";
	} 
	// 보드 수정 액션
	@PostMapping("modifyBoard")
	public String modifyBoard(HttpSession session,Model model, Board board) {
		System.out.println("modifyBoard POST! @ CONTROLLER");
		if(session.getAttribute("loginMember") == null) {
			System.out.println("Back to login");
			return "login";
		}
		System.out.println(board.toString());
		int result = boardService.modifyBoard(board);
		
		System.out.println("영향을 받은 행: "+result);
		
		model.addAttribute("board",boardService.getOneBoard(board.getBoardNo()));
		return "modifyBoard";
	}
	
	// 보드 정보 조회 접근 
	@GetMapping("boardDetail")
	public String boardDetail(HttpSession session,Model model, @RequestParam("boardNo")int boardNo) {
		System.out.println("boardDetail get! @ CONTROLLER");
		if(session.getAttribute("loginMember") == null) {
			System.out.println("Back to login");
			return "login";
		}
		model.addAttribute("board",boardService.getOneBoard(boardNo));
		return "boardDetail";
	}
	
	
	// 보드 삭제 접근
	@GetMapping("removeBoard")
	public String deleteBoard(HttpSession session,Model model, @RequestParam("boardNo")int boardNo) {
		System.out.println("deleteBoard  get! @ CONTROLLER");
		if(session.getAttribute("loginMember") == null) {
			System.out.println("Back to login");
			return "login";
		}
		// 보드 정보 출력을 위해 getOneBoard 로 정보 불러옴
		model.addAttribute("board",boardService.getOneBoard(boardNo));
		return "removeBoard";
	}
	// 보드 삭제 접근
	@PostMapping("removeBoard")
	public String deleteBoard(HttpSession session,Board board) {
		System.out.println("deleteBoard  get! @ CONTROLLER");
		if(session.getAttribute("loginMember") == null) {
			System.out.println("Back to login");
			return "login";
		}
		System.out.println(board.toString());
		int result = boardService.removeBoard(board);
		System.out.println("삭제 완료 한 행 개수 "+ result);
		return "redirect:/boardList";
	}
	
	
	// 보드 추가 접근
	@GetMapping("addBoard")
	public String addBoard(HttpSession session) {
		System.out.println("add Board get! @ CONTROLLER");
		if(session.getAttribute("loginMember") == null) {
			System.out.println("Back to login");
			return "login";
		}
		return "addBoard";
	}
	// 보드 추가 액션
	@PostMapping("addBoard")
	public String addBoard(HttpSession session,Board board) {
		System.out.println("addBoard post! @ CONTROLLER");
		if(session.getAttribute("loginMember") == null) {
			System.out.println("Back to login");
			return "login";
		}
		System.out.println(board.toString());
		
		int result = boardService.addBoard(board);
		
		System.out.println(result+"행 입력 성공.");
		return "redirect:/boardList";
	}
	
	// 보드 리스트 접근& 액션(검색)
	@RequestMapping({"/","boardList"})
	public String getBoardList(	HttpSession session, Model model, 
								@RequestParam(value="currentPage", defaultValue="1") int currentPage,
								@RequestParam(value="searchWord", required = false) String searchWord
							) {
		System.out.println("BoardList get! @ CONTROLLER");
		if(session.getAttribute("loginMember") == null) {
			System.out.println("Back to login");
			return "login";
		}
		int rowPerPage=10;
//		Page page = new Page();
//		page.setRowPerPage(10);
//		page.setSearchWord(searchWord);
//		page.setCurrentPage(currentPage);
// 		컨트롤러에서 new 연산자 사용 NO? 
		
		Map<String,Object> map = boardService.getBoardList(currentPage, searchWord, rowPerPage);
		
		model.addAttribute("map",map);
		return "boardList";
	}
	
	

}
