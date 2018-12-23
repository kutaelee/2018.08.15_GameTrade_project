package kr.co.realstore.service;

import java.util.List;

import kr.co.realstore.model.Board;

public interface BoardService {

	List<Board> list(Board board);

	Board select(int no);

	List<Board> select(Board board);
	
	
	public int getTotal(Board board);

	void insert(Board board);

	void update(Board board);

	void delete(Board board);
	
	

}
