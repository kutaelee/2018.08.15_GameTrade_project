package kr.co.realstore.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kr.co.realstore.model.Trade;

@Repository
public class TardeDaoimpl implements TradeDao {
	@Autowired
	private SqlSessionTemplate sst;

	
	@Override
	public List<Trade> tradelist(Trade td) {
	
		return sst.selectList("tradens.tradelist",td);
	}

	@Override
	public void tradeInsert(Trade trade) {
	
		sst.insert("tradens.tradeinsert",trade);
		
	}

	
	@Override
	public int getTotal(Trade trade) {
		return sst.selectOne("tradens.getTotal", trade);
	}



	@Override
	public List<Trade> mytradeList(Trade trade) {
	
		return sst.selectList("tradens.mytradelist",trade);
	}

	@Override
	public int mygetTotal(Trade trade) {
	
		return sst.selectOne("tradens.mygettotal",trade);
	}

	@Override
	public void mylistdel(Trade trade) {
		sst.update("tradens.mylistdel",trade);
		
	}
	
}
