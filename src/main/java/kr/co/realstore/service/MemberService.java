package kr.co.realstore.service;

import kr.co.realstore.model.Member;

public interface MemberService {

	void meminsert(Member member);
	Member loginselect(Member member);
	Member idChk(Member member);
	Member findpw(Member member);
	Member findid(Member member);
	void modifyinfo(Member member);
}
