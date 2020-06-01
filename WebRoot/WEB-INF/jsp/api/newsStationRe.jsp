<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags/login" prefix="login" %>
<login:getLoginUser var="loginUser"></login:getLoginUser>
<%@ taglib tagdir="/WEB-INF/tags/sql" prefix="sql" %>	
<%@ page import="java.util.*" %>
<c:set var="_uid"  value="${loginUser.uid}" scope="page"></c:set>
<c:set var="_userName"  value="${loginUser.userName}" scope="page"></c:set>
<c:set var="_realName"  value="${loginUser.realName}" scope="page"></c:set>
<c:set var="_nickName"  value="${loginUser.nickName}" scope="page"></c:set>

<c:set var="_checkstatus"  value="${loginUser.checkstatus}" scope="page"></c:set>
<%--  evaluResult:0为初始值，结果返回：1表示插入成功，-1表示存储过程异常，-2表示数据的转换异常，-1和-2都表示数据未成功 ，value需要传值，
标签中server参数需要传入
--%>
<c:if test="${not empty _uid }">
	 <jsp:useBean id="generBean" class="java.util.HashMap" scope="page">
	 	<c:set target="${generBean}" property="title" value="${param.title }"></c:set>
		<c:set target="${generBean}" property="userID" value="${param.userID }"></c:set>
		<c:set target="${generBean}" property="fromUserID" value="${param.fromUserID }"></c:set>
		<c:set target="${generBean}" property="messageID" value="${param.messageID }"></c:set>
		<c:set target="${generBean}" property="content" value="${param.content }"></c:set>
		<c:set target="${generBean}" property="isRead" value="1"></c:set>
		<c:set target="${generBean}" property="isValid" value="1"></c:set>
		<c:set target="${generBean}" property="isreply" value="1"></c:set>
		<c:set target="${generBean}" property="toIsDel" value="0"></c:set>
		<c:set target="${generBean}" property="fromIsDel" value="0"></c:set>
	</jsp:useBean>
	<c:catch var="mesExp">
	<sql:sqlSession.insert sqlMapId="messege_sqlserver" stmt="ns.sns.OpPubNewsInfo.insertOpPubNewsInfo" param="${generBean}" var="msgback"></sql:sqlSession.insert>
	</c:catch>
	${msgback }
	
</c:if>
<c:if test="${ empty _uid }">
  nolog 
</c:if>