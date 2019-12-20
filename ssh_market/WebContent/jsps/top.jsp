<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {
	font-size: 12px;
	color: #FFFFFF;
}
.STYLE2 {
	font-size: 12px;
	color: #333333;
}
-->
a:link {font-size:12px; color:#000000; text-decoration:none;}
a:visited {font-size:12px; color:#000000; text-decoration:none;}
a:hover {font-size:12px; color:#00CCFF;text-decoration:none;}
.STYLE4 {font-size: 12px}
</style></head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="36" background="images/main_07.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
             <td width="282" height="52" background="images/main_05.gif">
        	<span style="font-size:24px;font-weight:bolder;margin-left:60px;">
        		超市管理系统</span>
        </td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>
	            <span class="STYLE1">
	            <img src="images/home.gif" width="12" height="13"> 
	            </span>
	            <span class="STYLE4">
	            <a href="jsps/main.jsp"  target=_top>回首页</a>
	            </span>
	            <span class="STYLE1"> 
	            <img src="images/quit.gif" width="16" height="16"> 
	            </span>
	            <span class="STYLE4">
	            	<a href="login.jsp"  onclick="if (confirm('确定要退出吗？')) return true; else return false;" target=_top>
	            		退出系统</a>
	            </span>
	            <span class="STYLE1"> </span>
            </td>
          </tr>
        </table></td>
        <td width="247" background="images/main_08.gif">&nbsp;</td>
        <td width="283" background="images/main_09.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>
            	<img src="images/uesr.gif" width="14" height="14">
            	<span class="STYLE2"> 当前登录用户：<s:property value="#session.emp.name"></s:property>
					 角色：<s:if test="#session.emp.type==1">经理</s:if>
					<s:if test="#session.emp.type==2">库管</s:if>
					<s:if test="#session.emp.type==3">员工</s:if>
				</span>
            </td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
