package com.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.entity.Emp;
import com.entity.Goods;
import com.entity.Sell;
import com.entity.Store;
import com.service.GoodsService;
import com.service.SellService;

@Results({
	@Result(name="selllist",location="/jsps/pages/sell-list.jsp"),
	@Result(name="update",location="/jsps/pages/sell-update.jsp"),
	@Result(name="add",location="/jsps/pages/sell-add.jsp"),
	@Result(name="reselllist",type="redirect",location="sellList.action"),
})
public class SellAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	@Resource
	private SellService sellService;
	@Resource
	private GoodsService goodsService;

	private Sell sell;
	
	
	//获取所有出货信息
	@Action("sellList")
	public String selllist(){
		List<Sell> sells = sellService.getSells();
		getRequest().put("sells", sells);
		return "selllist";
	}
	
	//更新出货信息
	@Action("sellUpdate")
	public String update(){
		if (getServletRequest().getParameter("type")==null) {//如果请求标记为空 则说明要更新数据
			sell.setEmp((Emp)(getSession().get("emp")));//设置经手人
			sellService.update(sell);
			return "reselllist";
		}else {//否则为修改页面提供所有信息
			Sell result = sellService.getSell(sell);
			List<Goods> goodses = goodsService.getGoodses();
			getRequest().put("sell", result);
			getRequest().put("goodses", goodses);
			return "update";
		}
	}
	
	//删除出货信息
	@Action("sellDelete")
	public String delete(){
		sellService.delete(sell);
		return "reselllist";
	}

	//添加出货信息
	@Action("sellAdd")
	public String add(){
		if (getServletRequest().getParameter("type")==null) {//如果请求标记为空 则说明要添加数据
			sell.setEmp((Emp)(getSession().get("emp")));//设置经手人
			Store store = goodsService.getStore(sell.getGoods().getId());
			if (store == null) {//如果库存表中没有该商品库存记录
				getRequest().put("msg", "没有该商品的库存信息!!");
				List<Goods> goodses = goodsService.getGoodses();
				getRequest().put("goodses", goodses);
				return "add";
			}else {
				if (store.getAmount()<=0) {
					getRequest().put("msg", "该商品库存不足!!");
					List<Goods> goodses = goodsService.getGoodses();
					getRequest().put("goodses", goodses);
					return "add";
				}
				if (sell.getAmount()>store.getAmount()) {
					getRequest().put("msg", "出货数量不得大于库存数量!!");
					List<Goods> goodses = goodsService.getGoodses();
					getRequest().put("goodses", goodses);
					return "add";
				}
				store.setAmount(store.getAmount()-sell.getAmount());//更新库存数量
				goodsService.updateStore(store);
			}
			sellService.add(sell);
			return "reselllist";
		}else {//否则为添加页面提供所有信息
			List<Goods> goodses = goodsService.getGoodses();
			getRequest().put("goodses", goodses);
			return "add";
		}
	}
	
	
	public Sell getSell() {
		return sell;
	}
	public void setSell(Sell sell) {
		this.sell = sell;
	}
	
	
}
