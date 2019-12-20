package com.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.entity.Emp;
import com.entity.Goods;
import com.entity.Stock;
import com.entity.Store;
import com.service.GoodsService;
import com.service.StockService;

@Results({
	@Result(name="stocklist",location="/jsps/pages/stock-list.jsp"),
	@Result(name="update",location="/jsps/pages/stock-update.jsp"),
	@Result(name="add",location="/jsps/pages/stock-add.jsp"),
	@Result(name="restocklist",type="redirect",location="stockList.action"),
})
public class StockAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	@Resource
	private StockService stockService;
	@Resource
	private GoodsService goodsService;

	private Stock stock;
	
	//获取所有进货信息
	@Action("stockList")
	public String stocklist(){
		List<Stock> stocks = stockService.getStocks();
		getRequest().put("stocks", stocks);
		return "stocklist";
	}
	
	//更新进货信息
	@Action("stockUpdate")
	public String update(){
		if (getServletRequest().getParameter("type")==null) {//如果请求标记为空 则说明要更新数据
			stock.setEmp((Emp)(getSession().get("emp")));//设置经手人
			stockService.update(stock);
			return "restocklist";
		}else {//否则为修改页面提供所有信息
			Stock result = stockService.getStock(stock);
			List<Goods> goodses = goodsService.getGoodses();
			getRequest().put("stock", result);
			getRequest().put("goodses", goodses);
			return "update";
		}
	}
	
	//删除进货信息
	@Action("stockDelete")
	public String delete(){
		stockService.delete(stock);
		return "restocklist";
	}

	//添加进货信息
	@Action("stockAdd")
	public String add(){
		if (getServletRequest().getParameter("type")==null) {//如果请求标记为空 则说明要添加数据
			stock.setEmp((Emp)(getSession().get("emp")));//设置经手人
			Store store = goodsService.getStore(stock.getGoods().getId());
			if (store == null) {//如果库存表中没有该商品库存记录
				goodsService.addStore(stock.getGoods(),stock.getAmount());//添加库存记录
			}else {store.setAmount(store.getAmount()+stock.getAmount());//更新库存数量
				goodsService.updateStore(store);//更新库存记录
			}stockService.add(stock);
			return "restocklist";
		}else {//否则为添加页面提供所有信息
			List<Goods> goodses = goodsService.getGoodses();
			getRequest().put("goodses", goodses);
			return "add";
		}
	}
	
	
	public Stock getStock() {
		return stock;
	}
	public void setStock(Stock stock) {
		this.stock = stock;
	}

}
