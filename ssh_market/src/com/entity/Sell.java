package com.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.springframework.stereotype.Component;

//出货单
@Entity//hibernate实体类
@Component//注册spring受管bean
public class Sell {
	
	@Id
	@GeneratedValue//自增地段
	private int id;
	private int amount;
	private Date date;
	private String remark;
	@ManyToOne
	@NotFound(action=NotFoundAction.IGNORE)
	private Goods goods;
	@ManyToOne
	@NotFound(action=NotFoundAction.IGNORE)
	private Emp emp;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public Emp getEmp() {
		return emp;
	}
	public void setEmp(Emp emp) {
		this.emp = emp;
	}
	
	
	
	
}
