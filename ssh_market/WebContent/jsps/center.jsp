<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
html, body, iframe{
	width: 100%;
	height: 100%;
	margin: 0px 0px;
	overflow: hidden;
}
.navPoint {
	COLOR: white;
	CURSOR: hand;
	FONT-FAMILY: Webdings;
	FONT-SIZE: 9pt
}
</style>
</head>

<body>
	<table width="100%" height="100%" border="0" cellpadding="0"
		cellspacing="0" style="table-layout: fixed;">
		<tr>
			<td style="width:4px; background-image:url(images/main_16.gif)">&nbsp;</td>
			<td width="173" id="frmTitle" noWrap align="center" valign="top" height="100%">
				<iframe src="jsps/left.jsp" name="leftFrame" id="frame_left" height="500" width="180" frameborder="0" scrolling="no">
					浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe>
			</td>
			<td width="8" valign="middle" background="images/main_12.gif"></td>
			<td align="center" valign="top">
				<iframe src="jsps/right.jsp" name="rightFrame" id="frame_right" height="500" width="100%" frameborder="0">
					浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe>
			</td>
			<td width="4" align="center" valign="top" background="images/main_20.gif">
			</td>
		</tr>
	</table>
</body>
<script language="javascript">
// ifram高度100%
function iframeHeight() {
	 document.getElementById('frame_left').height="100%";
	 document.getElementById('frame_right').height="100%";
}
</script>
</html>