<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<c:set var="curPageSize" value="${param.pageSize}"></c:set>
<c:if test="${empty param.pageSize}">
	<c:set var="curPageSize" value="10"></c:set>
	<c:if test="${not empty pageSize}">
		<c:set var="curPageSize" value="${pageSize}"></c:set>
	</c:if>
</c:if>
<util:page_sqlserver pageSize="${curPageSize }" var="pageInfo" />
<jsp:useBean id="generBean" class="java.util.HashMap" scope="page">
	<c:set target="${pageScope.generBean}" property="pageNumStart"
		value="${pageInfo.pageNumStart }"></c:set>
	<c:set target="${pageScope.generBean}" property="pageNumEnd"
		value="${pageInfo.pageNumEnd}"></c:set>
	<c:set target="${pageScope.generBean}" property="pageSize"
		value="${pageInfo.pageSize}"></c:set>
</jsp:useBean>