package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.Vip;

@Repository//注册spring管理bean
public class VipDao extends BaseDao{

	//获取所有会员信息
	public List<Vip> getVips() {
		return getSession().createQuery("from Vip", Vip.class).list();
	}

	//根据id获取会员信息
	public Vip getVip(Vip vip) {
		return getSession().get(Vip.class, vip.getId());
	}

	//根据id获取vip信息
	public Vip getVip(int id) {
		return getSession().get(Vip.class, id);
	}
	
}
