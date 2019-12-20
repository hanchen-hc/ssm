<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
html, body{
	width: 100%;
	height: 100%;
	margin: 0px 0px;
	overflow: hidden;
}
dl,ul,li{list-style:none;}
a{color:#000;}
a:link,a:visited,a:active,a:hover{text-decoration:none;}
.meun_div{width:110px;height:auto;border-top:0;background:#fff;padding-top:10px;font-size:14px;}
.meun_top{width:80px;height:27px;line-height:27px;padding-left:20px;}
.meun_img{float:left;width:7px;height:27px;background:url(images/menu_1.gif) no-repeat;}
.meun_box ul{margin:0;padding:0 5px 0 19px;font-size:12px;}
.meun_box li{width:auto;height:20px;line-height:20px;margin:3px 0;padding-left:2px;}
.none_box {display:block;}
</style>
<script type="text/JavaScript"> 
var $=function(id) {
   return document.getElementById(id);
};

//显示子菜单
function show_menu_box(num){
	if($('box'+num)){   
		if($('box'+num).style.display=='none'){
			$('box'+num).style.display='block';
			$('img'+num).style.background='url(images/menu_2.gif)';
		}else {
			$('box'+num).style.display='none';
			$('img'+num).style.background='url(images/menu_1.gif)';
		}
	}
}

</script>
</head>

<body>
<table width="173" height="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed;">
  <tr>
    <td width="169" valign="top">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
			<td height="20" background="images/main_11.gif">&nbsp;</td>
		  </tr>
		  <tr>
			<td>
				<div class="meun_div" align="center">
				
					<s:if test="#session.emp.type==1">
										
						<div class="meun_top">
							<div id="img6" class="meun_img"></div>
							<a onclick="show_menu_box(6)" href="javascript:;">员工管理</a>
						</div>
						<div class="meun_box none_box" id="box6">
							<ul>
								<li><a href="empList.action"  target="rightFrame">&middot;员工管理</a></li>
								<li><a href="jsps/pages/emp-add.jsp"  target="rightFrame">&middot;员工添加</a></li>
							</ul>
						</div>
				
						<div class="meun_top">
							<div id="img1" class="meun_img"></div>
							<a onclick="show_menu_box(1)" href="javascript:;">商家管理</a>
						</div>
						<div class="meun_box none_box" id="box1">
							<ul>
								<li><a href="factoryList.action"  target="rightFrame">&middot;商家管理</a></li>
								<li><a href="jsps/pages/factory-add.jsp"  target="rightFrame">&middot;商家添加</a></li>
							</ul>
						</div>
					
					</s:if>
					
					<s:if test="#session.emp.type==1 || #session.emp.type==2 || #session.emp.type==3">
					
						<div class="meun_top">
							<div id="img2" class="meun_img"></div>
							<a onclick="show_menu_box(2)" href="javascript:;">商品管理</a>
						</div>
						<div class="meun_box none_box" id="box2">
							<ul>
								<s:if test="#session.emp.type==1">
									<li><a href="goodsList.action"  target="rightFrame">&middot;商品管理</a></li>
									<li><a href="goodsAdd.action?type='get'"  target="rightFrame">&middot;商品添加</a></li>
								</s:if>
								<li><a href="goodsStorelist.action"  target="rightFrame">&middot;商品库存</a></li>
							</ul>
						</div>
						
					</s:if>
					
					<s:if test="#session.emp.type==1 || #session.emp.type==2">
	
						<div class="meun_top">
							<div id="img4" class="meun_img"></div>
							<a onclick="show_menu_box(4)" href="javascript:;">进货管理</a>
						</div>
						<div class="meun_box none_box" id="box4">
							<ul>
								<li><a href="stockList.action"  target="rightFrame">&middot;进货管理</a></li>
								<li><a href="stockAdd.action?type='get'"  target="rightFrame"  target="rightFrame">&middot;进购商品</a></li>
							</ul>
						</div>
						
						<div class="meun_top">
							<div id="img5" class="meun_img"></div>
							<a onclick="show_menu_box(5)" href="javascript:;">出货管理</a>
						</div>
						<div class="meun_box none_box" id="box5">
							<ul>
								<li><a href="sellList.action"  target="rightFrame">&middot;出货管理</a></li>
								<li><a href="sellAdd.action?type='get'"  target="rightFrame">&middot;商品出库</a></li>
							</ul>
						</div>
					
					</s:if>
					
					<s:if test="#session.emp.type==1 || #session.emp.type==3">
					
						<div class="meun_top">
							<div id="img3" class="meun_img"></div>
							<a onclick="show_menu_box(3)" href="javascript:;">销售管理</a>
						</div>
						<div class="meun_box none_box" id="box3">
							<ul>
								<li><a href="cardList.action" target="rightFrame">&middot;账单管理</a></li>
								<li><a href="jsps/pages/card-add.jsp"  target="rightFrame">&middot;添加账单</a></li>
							</ul>
						</div>
						
						<div class="meun_top">
							<div id="img7" class="meun_img"></div>
							<a onclick="show_menu_box(7)" href="javascript:;">会员管理</a>
						</div>
						<div class="meun_box none_box" id="box7">
							<ul>
								<li><a href="vipList.action"  target="rightFrame">&middot;会员管理</a></li>
								<li><a href="jsps/pages/vip-add.jsp"  target="rightFrame">&middot;会员添加</a></li>
							</ul>
						</div>
						
					</s:if>
					
				</div>
			
			</td>
		  </tr>
		</table>
	</td>
  </tr>
</table>
</body>
</html>
