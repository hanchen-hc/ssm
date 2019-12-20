package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.Emp;

@Repository//注册spring管理bean
public class EmpDao extends BaseDao{

	//根据用户名和密码查找用户
	public Emp CheckEmp(String name, String pass) {
		return getSession().createQuery("from Emp where name=? and pass=?", Emp.class)
				.setParameter(0, name).setParameter(1, pass).uniqueResult();
	}

	//获取所有会员信息
	public List<Emp> getEmps() {
		return getSession().createQuery("from Emp", Emp.class).list();
	}

	//根据id获取会员信息
	public Emp getEmp(Emp emp) {
		return getSession().get(Emp.class, emp.getId());
	}
	
}
