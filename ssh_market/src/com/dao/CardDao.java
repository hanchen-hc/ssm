package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.Card;

@Repository//注册spring管理bean
public class CardDao extends BaseDao{

	//获取所有销售单信息
	public List<Card> getCards() {
		return getSession().createQuery("from Card", Card.class).list();
	}

	//获取销售单信息
	public Card getCard(Card card) {
		return getSession().get(Card.class, card.getId());
	}

	//根据id获取该card的信息
	public Card getCard(int id) {
		return getSession().get(Card.class, id);
	}


}
