package kr.co.realstore.dao;



import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kr.co.realstore.model.Member;


@Repository
public class MemberDaoimpl implements MemberDao {
	@Autowired
	private SqlSessionTemplate sst;


	@Override
	public void join(Member member) {
		sst.insert("memberns.meminsert",member);
		
	}


	@Override
	public Member login(Member member) {
		return sst.selectOne("memberns.loginselect", member);
		
		
	}


	@Override
	public Member idChk(Member member) {
		return  sst.selectOne("memberns.idChk", member);
		
	}


	@Override
	public Member findpw(Member member) {

	return sst.selectOne("memberns.findpw",member);
	}


	@Override
	public Member findid(Member member) {
		return sst.selectOne("memberns.findid",member);
	}


	@Override
	public void modifyinfo(Member member) {
	
		 sst.update("memberns.modifyinfo",member);
	}
	
}
