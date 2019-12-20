package com.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.entity.Factory;
import com.entity.Goods;
import com.entity.Store;
import com.service.FactoryService;
import com.service.GoodsService;

@Results({
	@Result(name="goodslist",location="/jsps/pages/goods-list.jsp"),
	@Result(name="storelist",location="/jsps/pages/store-list.jsp"),
	@Result(name="update",location="/jsps/pages/goods-update.jsp"),
	@Result(name="add",location="/jsps/pages/goods-add.jsp"),
	@Result(name="regoodslist",type="redirectAction",location="goodsList.action"),
})
public class GoodsAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	@Resource
	private GoodsService goodsService;
	@Resource
	private FactoryService factoryService;
	private Goods goods;
	
	//获取所有商品信息
	@Action("goodsList")
	public String goodslist(){
		List<Goods> goodses = goodsService.getGoodses();
		getRequest().put("goodses", goodses);
		return "goodslist";
	}
	
	//更新商品信息
	@Action("goodsUpdate")
	public String update(){
		if (getServletRequest().getParameter("type")==null) {//如果请求标记为空 则说明要更新数据
			goodsService.update(goods);
			return "regoodslist";
		}else {//否则为修改页面提供所有信息
			Goods result = goodsService.getGoods(goods);
			getRequest().put("goods", result);
			List<Factory> factories = factoryService.getFactorys();
			getRequest().put("factories", factories);
			return "update";
		}
	}
	
	//删除商品信息
	@Action("goodsDelete")
	public String delete(){
		goodsService.delete(goods);
		return "regoodslist";
	}

	//添加商品信息
	@Action("goodsAdd")
	public String add(){
		if (getServletRequest().getParameter("type")==null) {//如果请求标记为空 则说明要添加数据
			goodsService.add(goods);
			return "regoodslist";
		}else {//否则为添加页面提供所有信息
			List<Factory> factories = factoryService.getFactorys();
			getRequest().put("factories", factories);
			return "add";
		}
	}
	
	//获取所有商品库存信息
	@Action("goodsStorelist")
	public String storelist(){
		List<Store> stores = goodsService.getStores();
		getRequest().put("stores", stores);
		return "storelist";
	}
	
	

	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	
}
