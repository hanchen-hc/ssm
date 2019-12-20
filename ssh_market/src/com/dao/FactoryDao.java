package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.Factory;

@Repository//注册spring管理bean
public class FactoryDao extends BaseDao{

	//获取所有供货商信息
	public List<Factory> getFactorys() {
		return getSession().createQuery("from Factory", Factory.class).list();
	}

	//根据id获取供货商信息
	public Factory getFactory(Factory factory) {
		return getSession().get(Factory.class, factory.getId());
	}

}
