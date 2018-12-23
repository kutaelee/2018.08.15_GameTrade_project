package kr.co.realstore.dao;

import java.util.List;


import kr.co.realstore.model.Trade;

public interface TradeDao {

	List<Trade> tradelist(Trade tag);

	void tradeInsert(Trade trade);
	int getTotal(Trade trade);

	List<Trade> mytradeList(Trade trade);

	int mygetTotal(Trade trade);

	void mylistdel(Trade trade);
	
}
