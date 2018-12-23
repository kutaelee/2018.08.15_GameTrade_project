package kr.co.realstore.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.realstore.model.Board;


@Repository
public class BoardDaoimpl implements BoardDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Board> list(Board board) {
		
		return sst.selectList("boardns.list",board);
	}

	@Override
	public Board select(int no) {
		
		return sst.selectOne("boardns.view",no);
	}

	@Override
	public List<Board> select(Board board) {

		return sst.selectList("boardns.boardlist",board);
	}

	

	@Override
	public int getTotal(Board board) {
		return sst.selectOne("boardns.getTotal", board);
	}

	@Override
	public void insert(Board board) {
		
		sst.insert("boardns.boardinsert",board);
	}

	@Override
	public void update(Board board) {
		sst.update("boardns.boardupdate",board);
		
	}

	@Override
	public void delete(Board board) {
		sst.update("boardns.boarddelete",board);
	}



	

	
	
}
