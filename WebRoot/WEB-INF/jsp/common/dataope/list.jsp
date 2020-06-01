<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<util:getListForPage sqlMapId="${param.sqlMapId }"
	stmtCount="${param.stmtCount }" stmt="${param.stmt }"
	varCount="totalCount" pageCount="${pageInfo.pageSize}"
	var="${param.listResult }" param="${generBean}" />
<util:pageTurn pageNum="${pageInfo.pageNum}" totleCount="${totalCount}"
	pageCount="${pageInfo.pageSize}" var="pageObj" />
