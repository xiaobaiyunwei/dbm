<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags/dbm" prefix="dbm" %>
<% 
	response.setHeader("PRagma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<jsp:useBean id="paramMap" class="java.util.HashMap" scope="page">		
			<c:set target="${paramMap}" property="ip" value="${param.ip}"></c:set>
			<c:set target="${paramMap}" property="describe" value="${param.describe}"></c:set>
			<c:set target="${paramMap}" property="linenum" value="${param.linenum}"></c:set>
</jsp:useBean>
<dbm:redismonitor var="result" param="${paramMap}"></dbm:redismonitor>
<div class="right;font-size:100px;">
${result }
${paramMap}
提交成功!
</div>