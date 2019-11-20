package goodee.three.board.mapper;

import org.apache.ibatis.annotations.Mapper;

import goodee.three.board.vo.LoginForm;
import goodee.three.board.vo.Member;

@Mapper
public interface MemberMapper {
	public Member selectOneMember(LoginForm loginForm);
	public int insertMember(Member member);
}
