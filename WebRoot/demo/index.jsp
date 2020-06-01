<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	Object obj = request.getSession().getAttribute("flag");
	if(obj!=null){
		String flag = obj.toString();
		if(!StringUtils.isEmpty(flag)&&"true".equals(flag)){
			out.print("<script type='text/javascript'>alert('发送成功');</script>");
		}
	}
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>测试UDP发送页面</title>
</head>
<body onload="javascript:document.getElementById('msg').focus()">
	<form action="${_currConText}/demo/send.jsp" style="padding: 30px; line-height: 30px;" method="post">
		<input type="hidden" value="s123" name="sendflag"/>
		IP：<input type="text" value="210.51.180.115" name="ip" /><br />
		端口：<input type="text" value="1935" name="port" /><br />
		消息：<input type="text" id="msg" name="message" />
		<input type="submit" value="发 送" />
	</form>
</body>
</html>