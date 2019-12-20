package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.Sell;

@Repository//注册spring管理bean
public class SellDao extends BaseDao{

	//获取所有出货信息
	public List<Sell> getSells() {
		return getSession().createQuery("from Sell", Sell.class).list();
	}

	//根据id获取出货信息
	public Sell getSell(Sell sell) {
		return getSession().get(Sell.class, sell.getId());
	}
	
}
