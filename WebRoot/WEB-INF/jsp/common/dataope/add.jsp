<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<script type="text/javascript" src="${_currConText}/theme/js/cdel-jq-1.4.2.js"></script>
<% 
	response.setHeader("PRagma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<jsp:useBean id="vcontestMap" class="java.util.HashMap" scope="page">
	<c:set target="${vcontestMap}" property="name"  value="${param.name}"/>
	<c:set target="${vcontestMap}" property="age"  value="${param.age}"/>
	<c:set target="${vcontestMap}" property="phone"  value="${param.phone}"/>
</jsp:useBean>
<Sql:sqlSession.insert sqlMapId="${param.sqlMapId}" stmt="${param.stmt}" param="${vcontestMap}" var="obj"/>



