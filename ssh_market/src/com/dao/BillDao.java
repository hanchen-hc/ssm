package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.Bill;

@Repository//注册spring管理bean
public class BillDao extends BaseDao{

	//获取账单记录列表
	public List<Bill> getBills(int card_id) {
		return getSession().createQuery("from Bill where card_id=?", Bill.class)
				.setParameter(0, card_id).list();
	}

	//获取账单记录
	public Bill getBill(Bill bill) {
		return getSession().get(Bill.class, bill.getId());
	}

}
