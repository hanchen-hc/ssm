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
<script type="text/javascript">
function checkForm(){
	var goods=document.getElementsByName("stock.goods.id")[0].value;
	var amount=document.getElementsByName("stock.amount")[0].value;
	if(goods==null||goods==""){alert("商品选择不能为空!");return false;}
	if(amount==null||amount==""){alert("数量不能为空!");return false;}
	return true;
}
</script>
<body>

	<form action="stockAdd.action" method="post" onsubmit="return checkForm()">
	商品：<select name="stock.goods.id" style="width: 155px">
				<s:iterator value="#request.goodses">
					<option value=<s:property value="id"/>><s:property value="name"/></option>
				</s:iterator>
			</select><font color="red">*</font><br>
	数量：<input type="text" name="stock.amount" placeholder="请输入数字"/><font color="red">*</font><br>
	备注：<input type="text" name="stock.remark"/><br>
	<input type="submit" value="确认添加"/>
	</form>
	
</body>
</html>
