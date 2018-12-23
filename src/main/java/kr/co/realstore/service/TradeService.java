package kr.co.realstore.service;

import java.util.List;

import kr.co.realstore.model.Member;
import kr.co.realstore.model.Trade;

public interface TradeService {

	
	
	List<Trade> tradelist(Trade trade);

	void insert(Trade trade);
	
	
	
	public int getTotal(Trade trade);
	

	List<Trade> mytradeList(Trade trade);

	int mygetTotal(Trade trade);

	void mylistdel(Trade trade);
}
