<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<% 
	response.setHeader("PRagma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<jsp:useBean id="paramMap" class="java.util.HashMap" scope="page">					
			<c:set target="${paramMap}" property="ip" value="${param.ip}"></c:set>
</jsp:useBean>
<Sql:sqlSession.insert  var="dataId" stmt="ns.devops.redis.insertRedisData" param="${paramMap}"/>
<input type="text" id="data_id" name="data_id" value="${dataId }"/>
添加成功!


