package goodee.three.board.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.three.board.service.CommentService;
import goodee.three.board.vo.Board;
import goodee.three.board.vo.Comment;

@RestController 
public class CommentController {
	@Autowired private CommentService commentService;
	
	@GetMapping("/rest/commentList")
	public List<Comment> getCommentList(@RequestParam(value="boardNo")int boardNo) { 
		System.out.println(boardNo);
		return commentService.getCommentList(boardNo);
	}
}
