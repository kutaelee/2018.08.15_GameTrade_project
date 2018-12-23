package kr.co.realstore.dao;

import java.util.List;

import kr.co.realstore.model.Board;


public interface BoardDao {

	List<Board> list(Board board);

	Board select(int no);

	List<Board> select(Board board);

	
	int getTotal(Board board);

	void insert(Board board);

	void update(Board board);
	
	void delete(Board board);
	
	
}
