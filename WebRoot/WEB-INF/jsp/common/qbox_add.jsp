<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="qbox"%>

<jsp:useBean id="generBean" class="java.util.HashMap" scope="page">
<c:choose >
<c:when test="${empty param.adviceType ||param.adviceType eq 'undefined'}">
	<c:set target="${generBean}" property="adviceType" value="0"></c:set>
</c:when>
<c:otherwise>
	<c:set target="${generBean}" property="adviceType" value="${param.adviceType }"></c:set>
</c:otherwise>
</c:choose>
	<c:set target="${generBean}" property="adviceContent" value="${param.adviceContent}"></c:set>
	<c:set target="${generBean}" property="userInfo" value="${param.userInfo}"></c:set>
</jsp:useBean>
<qbox:qbox param="${generBean}" var="id"></qbox:qbox>
${id}
