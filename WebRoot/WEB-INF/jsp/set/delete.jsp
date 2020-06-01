<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<% 
	response.setHeader("PRagma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<% 
	String id_str = request.getParameter("id");
	int id = Integer.parseInt(id_str);
	System.out.println("id========:"+id);
%>
<Sql:sqlSession.delete sqlMapId="demo_mysql" stmt="ns.devops.redis.deleteRedisData" param="<%=id%>"/>



