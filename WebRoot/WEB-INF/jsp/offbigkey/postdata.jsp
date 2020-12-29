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
请访问下面地址查看<br>
<c:choose>
	<c:when test="${param.date!=''}">
		<a href="${_currConText}/offbigkey/view.shtm?ip=${param.ip}&port=${param.port}&date=${param.date}" target="_blank">点我查看历史</a>
	</c:when>
	<c:otherwise>
		<a href="${_currConText}/offbigkey/view.shtm?ip=${param.ip}&port=${param.port}" target="_blank">点我查看</a>
	</c:otherwise>
</c:choose>




