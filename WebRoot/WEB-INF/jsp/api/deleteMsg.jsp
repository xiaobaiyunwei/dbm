<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<%@ taglib prefix="Sql" tagdir="/WEB-INF/tags/sql"%>
<%@ taglib tagdir="/WEB-INF/tags/login" prefix="login" %>
<login:getLoginUser var="loginUser"></login:getLoginUser>
<%-- 判断是否登陆 --%>
<c:if test="${empty loginUser}">  
    <login:getParamToUrl var="gotoURL" params="${param}" />
     <%-- 重新登录页面 --%>
    <c:set value="${fn: replace(gotoURL,'&',',')}" var="gotoURL_" scope="page"></c:set>
 <c:redirect url="${_webSite}${_pubConText}/member/loginAgain.shtm?gotoURL=${gotoURL_ }" /> 
</c:if> 	
<% 
	response.setHeader("PRagma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<c:if test="${param.messegeID!=''}">
<jsp:useBean id="generBean" class="java.util.HashMap" scope="page">
		<c:set target="${generBean}" property="messegeID" value="${param.messegeID}"/>
		<c:if test="${param.isUsed!=''}">
		<c:set target="${generBean}" property="fromIsDel" value="${param.fromIsDel}"/>
		</c:if>
		<c:if test="${param.isUsed!=''}">
		<c:set target="${generBean}" property="toIsDel" value="${param.toIsDel}"/>
		</c:if>
		<c:if test="${param.isRead!=''}">
		<c:set target="${generBean}" property="isRead" value="${param.isRead}"/>
		</c:if>
		<c:if test="${param.isRead!=''}">
		<c:set target="${generBean}" property="fromUserType" value="${param.fromUserType}"/>
		</c:if>
		<c:if test="${param.isValid!=''}">
		<c:set target="${generBean}" property="isValid" value="${param.isValid}"/>
		</c:if>
		<c:set target="${generBean}" property="userID" value="${loginUser.uid}"/>
</jsp:useBean>
<Sql:sqlSession.update sqlMapId="messege_sqlserver" stmt="ns.sns.opPubMessegeInfo.updateMessege" param="${generBean}" var="result"/>
删除成功
</c:if>
<c:if test="${param.messegeID==''}">
删除失败
</c:if>