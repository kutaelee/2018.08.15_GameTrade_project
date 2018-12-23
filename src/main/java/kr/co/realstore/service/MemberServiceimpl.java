package kr.co.realstore.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.realstore.dao.MemberDao;
import kr.co.realstore.model.Member;
@Service
public class MemberServiceimpl implements MemberService{
	@Autowired
	private MemberDao md;

	@Override
	public void meminsert(Member member) {
		md.join(member);
		
	}

	@Override
	public Member loginselect(Member member) {
		return md.login(member);
		
	}

	@Override
	public Member idChk(Member member) {
		return md.idChk(member);
		
	}

	@Override
	public Member findpw(Member member) {
		return md.findpw(member);
		
	}

	@Override
	public Member findid(Member member) {
		return md.findid(member);
		
	}

	@Override
	public void modifyinfo(Member member) {
		
		 md.modifyinfo(member);
	}
	

}
