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
<dbm:redismonitor0 var="result" param="${paramMap}"></dbm:redismonitor0>
<div class="right;font-size:100px;">
	<c:if test="${result>0}">
		<script>
			sortIP();
			sortCMD();
		</script>
	</c:if>
</div>