package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.Goods;
import com.entity.Store;

@Repository//注册spring管理bean
public class GoodsDao extends BaseDao{

	//获取所有商品信息
	public List<Goods> getGoodses() {
		return getSession().createQuery("from Goods", Goods.class).list();
	}

	//获取商品信息
	public Goods getGoods(Goods goods) {
		return getSession().get(Goods.class, goods.getId());
	}

	//获取所有商品库存信息
	public List<Store> getStores() {
		return getSession().createQuery("from Store", Store.class).list();
	}

	//获取商品库存信息
	public Store getStore(int goods_id) {
		return getSession().createQuery("from Store where goods_id=?", Store.class)
				.setParameter(0, goods_id).uniqueResult();
	}

}
