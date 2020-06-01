<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<% 
	response.setHeader("PRagma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
${param}
<jsp:useBean id="paramMap" class="java.util.HashMap" scope="page">		
			<c:set target="${paramMap}" property="name" value="${param.name}"></c:set>
			<c:set target="${paramMap}" property="age" value="${param.age}"></c:set>
			<c:set target="${paramMap}" property="phone" value="${param.phone}"></c:set>
			<c:set target="${paramMap}" property="describe" value="${param.describe}"></c:set>
</jsp:useBean>
<Sql:sqlSession.insert  var="demoId" stmt="ns.sns.demo.insertSnsDemo" param="${paramMap}"/>
<input type="text" id="data_id" name="data_id" value="${demoId }"/>
添加成功!


