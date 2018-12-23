package kr.co.realstore.dao;


import kr.co.realstore.model.Member;

public interface MemberDao {
	void join(Member member);
	Member login(Member member);
	Member idChk(Member member);
	Member findpw(Member member);
	Member findid(Member member);
	void modifyinfo(Member member);
}
