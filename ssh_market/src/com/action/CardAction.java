package com.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.entity.Card;
import com.entity.Emp;
import com.service.CardService;
import com.service.VipService;

@Results({
	@Result(name="cardlist",location="/jsps/pages/card-list.jsp"),
	@Result(name="billlist",location="/jsps/pages/bill-list.jsp"),
	@Result(name="add",location="/jsps/pages/card-add.jsp"),
	@Result(name="recardlist",type="redirect",location="cardList.action"),
	@Result(name="rebilllist",type="redirect",location="billList.action"),
})
public class CardAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	@Resource
	private CardService cardService;
	@Resource
	private VipService vipService;
	private Card card;
	
	//获取所有销售单信息
	@Action("cardList")
	public String cardlist(){
		List<Card> cards = cardService.getCards();
		getRequest().put("cards", cards);
		return "cardlist";
	}
	
	//删除销售单信息
	@Action("cardDelete")
	public String delete(){
		cardService.delete(card);
		return "recardlist";
	}

	//添加销售单信息
	@Action("cardAdd")
	public String add(){
		String vip_id = getServletRequest().getParameter("vip_id");
		if (vip_id!=null && !vip_id.equals("")) {//如果是会员购物则记录会员信息
			card.setVip(vipService.getVip(Integer.parseInt(vip_id)));
		}else {
			card.setVip(null);
		}
		card.setEmp((Emp)getSession().get("emp"));//设置经手人
		cardService.add(card);	//创建销售单
		return "recardlist";
	}
	
	//添加账单记录
	@Action("cardAddbill")
	public String addbill(){
		return "rebilllist";
	}
	
	
	public Card getCard() {
		return card;
	}
	public void setCard(Card card) {
		this.card = card;
	}
	
}
