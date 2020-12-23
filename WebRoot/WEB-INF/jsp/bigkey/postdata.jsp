<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags/dbm" prefix="dbm"%>
<%
	response.setHeader("PRagma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<script src="${_currConText}${_jsURL }/jquery/jquery.js" type="text/javascript"></script>
<script src="${_currConText}/js/dbm/dataope.js" type="text/javascript"></script>
<jsp:useBean id="paramMap" class="java.util.HashMap" scope="page">
	<c:set target="${paramMap}" property="ip" value="${param.ip}"></c:set>
	<c:set target="${paramMap}" property="port" value="${param.port}"></c:set>
	<c:set target="${paramMap}" property="linenum" value="${param.linenum}"></c:set>
</jsp:useBean>
<dbm:findbigkey var="result" param="${paramMap}"></dbm:findbigkey>
<c:choose>
	<c:when test="${fn:length(result)==0}">
		不存在大KEY或连接Redis失败!
	</c:when>
	<c:otherwise>
		${result}
	</c:otherwise>
</c:choose>


