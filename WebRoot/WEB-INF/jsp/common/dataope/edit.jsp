<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<% 
	response.setHeader("PRagma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<Sql:sqlSession.update sqlMapId="${param.sqlMapId }" stmt="${param.stmt }" param="${param}"/>