package kr.co.realstore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.realstore.dao.TradeDao;

import kr.co.realstore.model.Trade;

@Service
public class TradeServiceImpl implements TradeService{

	@Autowired
	private TradeDao td;


	@Override
	public List<Trade> tradelist(Trade tag) {
		
		return td.tradelist(tag);
	}

	@Override
	public void insert(Trade trade) {
		td.tradeInsert(trade);
	}


	@Override
	public int getTotal(Trade trade) {
	
		return td.getTotal(trade);
	}



	@Override
	public List<Trade> mytradeList(Trade trade) {
	
		return td.mytradeList(trade);
	}

	@Override
	public int mygetTotal(Trade trade) {
		
		return td.mygetTotal(trade);
	}

	@Override
	public void mylistdel(Trade trade) {
		td.mylistdel(trade);
		
	}
	


}
