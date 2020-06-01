<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util" %>	
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<jsp:useBean id="countBean" class="java.util.HashMap" scope="page">
	<c:set target="${countBean}" property="queryUserID" value="${will_session_uid}"/>
	<c:set target="${countBean}" property="queryMsgType" value="4"/>
</jsp:useBean>
	
<util:getCountUnReadNews var="count" param="${countBean}"></util:getCountUnReadNews>
${count}