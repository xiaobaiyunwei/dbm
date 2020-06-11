<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags/wifi" prefix="wifi" %>
<% 
	response.setHeader("PRagma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<jsp:useBean id="paramMap" class="java.util.HashMap" scope="page">					
			<c:set target="${paramMap}" property="dns" value="${param.dns}"></c:set>
			<c:set target="${paramMap}" property="clientIp" value="${param.clientIp}"></c:set>
			<c:set target="${paramMap}" property="mac" value="${param.mac}"></c:set>
</jsp:useBean>

<wifi:reloadipbatles var="result" param="${paramMap}"></wifi:reloadipbatles>

<c:if test="${result=='0' }">失败</c:if>
<c:if test="${result!='0' }">${param.dns}设置成功!</c:if>


