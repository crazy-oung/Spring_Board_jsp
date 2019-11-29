package goodee.three.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.three.board.mapper.MemberMapper;
import goodee.three.board.vo.LoginForm;
import goodee.three.board.vo.Member;

@Transactional
@Service
public class MemberServiceImp implements MemberService{
	@Autowired MemberMapper memberMapper;
	
	@Override
	public Member getOneMemberInfo(LoginForm loginForm) {
		System.out.println("getOneMemberInfo @ MemberServiceImp");
		return memberMapper.selectOneMember(loginForm);
	}

	@Override
	public int addMember(Member member) { 
		System.out.println("-> addMemeber SERIVCE 진입");
		
		int rs = memberMapper.insertMember(member);
		System.out.println(" addMemeber SERIVCE 리턴 ->");		
		return rs;
	}
	
}
