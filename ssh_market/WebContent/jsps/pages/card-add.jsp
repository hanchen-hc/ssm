<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%><%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath %>"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body><br><br>

	<form action="cardAdd.action" method="post">
	会员编号：<input type="text" name="vip_id" placeholder="输入会员编号" required="required"/><font color="red">*</font>
	<input type="submit" value="创建会员账单"/>
	</form><br><br><br>
	
	<form action="cardAdd.action" method="post">
	普通顾客：<input type="text" name="card.remark" placeholder="输入内容存入备注"/>
	<input type="submit" value="创建普通账单"/>
	</form>
	
</body>
</html>
