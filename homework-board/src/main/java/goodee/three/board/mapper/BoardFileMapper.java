package goodee.three.board.mapper;

import org.apache.ibatis.annotations.Mapper;

import goodee.three.board.vo.Board;

@Mapper
public interface BoardFileMapper {
	public int deleteBoardFile(Board board);
}
