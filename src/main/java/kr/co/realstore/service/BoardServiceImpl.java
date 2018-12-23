package kr.co.realstore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.realstore.dao.BoardDao;
import kr.co.realstore.model.Board;


@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao bd;

	@Override
	public List<Board> list(Board board) {
	
		return bd.list(board);
	}

	@Override
	public Board select(int no) {
		
		return bd.select(no);
	}

	@Override
	public List<Board> select(Board board) {
		
		return bd.select(board);
	}

	@Override
	public int getTotal(Board board) {
		
		return bd.getTotal(board);
	}

	@Override
	public void insert(Board board) {

		bd.insert(board);
	}

	@Override
	public void update(Board board) {
		bd.update(board);
		
	}

	@Override
	public void delete(Board board) {
		bd.delete(board);
	}

	
	


}
