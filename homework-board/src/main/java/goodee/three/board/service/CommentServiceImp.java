package goodee.three.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.three.board.mapper.CommentMapper;
import goodee.three.board.vo.Board;
import goodee.three.board.vo.Comment;

@Transactional
@Service
public class CommentServiceImp implements CommentService{
	@Autowired private CommentMapper commentMapper;
	
	public List<Comment> getCommentList(int boardNo) {
		return commentMapper.selectComments(boardNo);
	}
	
}
