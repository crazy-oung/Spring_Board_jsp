package goodee.three.board.rest;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.three.board.service.CommentService;
import goodee.three.board.vo.Board;
import goodee.three.board.vo.Comment;
import goodee.three.board.vo.Member;

@RestController 
public class RestCommentController {
	@Autowired private CommentService commentService;
	
	@GetMapping("/rest/getCommentList")
	public List<Comment> getCommentList(@RequestParam(value="boardNo")int boardNo) { 
		System.out.println("/rest/getCommentList 진입");
		System.out.println(boardNo);
		return commentService.getCommentList(boardNo);
	}
	
	@PostMapping("/rest/addComment")
	public int addComment(Comment comment) { 
		System.out.println("/rest/addComment 진입");
		System.out.println(comment);
		
		return commentService.addComment(comment);
	}
	 
}
