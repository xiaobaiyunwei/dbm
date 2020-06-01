<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<%@ taglib prefix="Sql" tagdir="/WEB-INF/tags/sql"%>	
<% 
	response.setHeader("PRagma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<% 
	String id_str = request.getParameter("messegeID");
	int messegeID = Integer.parseInt(id_str);
%>
<Sql:sqlSession.delete sqlMapId="${param.sqlMapId}" stmt="${param.stmt}" param="<%=messegeID%>"/>



