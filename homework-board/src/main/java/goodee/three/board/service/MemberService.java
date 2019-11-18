package goodee.three.board.service;

import goodee.three.board.vo.LoginForm;
import goodee.three.board.vo.Member;

public interface MemberService {
	public Member getOneMemberInfo(LoginForm loginForm);
}
