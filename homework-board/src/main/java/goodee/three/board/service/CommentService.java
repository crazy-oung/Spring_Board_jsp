package goodee.three.board.service;

import java.util.List;

import goodee.three.board.vo.Board;
import goodee.three.board.vo.Comment;

public interface CommentService {

	public List<Comment> getCommentList(int boardNo);
	public int addComment(Comment comment);
}
