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
			<c:set target="${paramMap}" property="describe" value="${param.describe}"></c:set>			
			<c:set target="${paramMap}" property="type" value="${param.type}"></c:set>			
</jsp:useBean>
<dbm:statistics  var="result" param="${paramMap}"></dbm:statistics>

<div class="right;font-size:100px;">
<c:if test="${param.type=='ip'}">
=========The statistics of IP start==============<br>
${result }
=========The statistics of IP end==============
</c:if>

<c:if test="${param.type=='cmd'}">
=========The statistics of CMD start==============<br>
${result }
=========The statistics of CMD end==============
</c:if>
</div>