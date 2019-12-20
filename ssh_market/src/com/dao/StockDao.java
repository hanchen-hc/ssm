package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.Stock;

@Repository//注册spring管理bean
public class StockDao extends BaseDao{

	//获取所有进货信息
	public List<Stock> getStocks() {
		return getSession().createQuery("from Stock", Stock.class).list();
	}

	//根据id获取进货信息
	public Stock getStock(Stock stock) {
		return getSession().get(Stock.class, stock.getId());
	}
	
}
