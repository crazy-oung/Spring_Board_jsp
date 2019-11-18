package goodee.three.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import goodee.three.board.vo.Board;
import goodee.three.board.vo.Comment;

@Mapper
public interface CommentMapper {
	public int deleteAllComments(Board board);
	public int deleteComment(Board board);
	public List<Comment> selectComments(int boardNo);
	public int insertComment(Comment comment);
}
