<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<c:choose>
  <c:when test="${not empty param.userID}">     
   <Sql:sqlSession.selectOne sqlMapId="fund" stmt="ns.will.member.member.selectByUid" param="${param.userID}" var="user" />	
	<c:if test="${not empty requestScope.user}">
 
	     <%-- 设置 session --%>
		<c:set var="will_session_uid" scope="session" value="${requestScope.user.userid}" /><%-- 用户id --%>
		<c:set var="will_session_userName" scope="session" value="${fn:trim(requestScope.user.username)}" /><%-- 用户名 --%>
		<c:set var="will_session_checkstatus" scope="session" value="${fn:trim(requestScope.user.checkstatus)}" /><%-- 用户实名认证状态 --%>		
		<%-- 设置 cookie --%>
		<util:writeCookie name="sid" value="${param.sid}" domain="${pageScope._domain }"></util:writeCookie>
		<util:writeCookie name="uid" value="${requestScope.user.userid}" domain="${pageScope._domain }"></util:writeCookie>
		<util:writeCookie name="username" value="${fn:trim(requestScope.user.username)}" domain="${pageScope._domain }"></util:writeCookie>
		<util:writeCookie name="checkstatus" value="${fn:trim(requestScope.user.checkstatus)}" domain="${pageScope._domain }"></util:writeCookie>
  	<c:out value="param.userID===update pub session success"></c:out>
	</c:if>
  </c:when>
  <c:otherwise>
      <c:set var="userID" value="${will_session_uid}"></c:set>
       <c:if test="${not empty userID}">
          <Sql:sqlSession.selectOne sqlMapId="fund" stmt="ns.will.member.member.selectByUid" param="${userID}" var="user" />	
		    <c:if test="${empty requestScope.user}">
		     <%-- 设置 session --%>
			<c:set var="will_session_uid" scope="session" value="${requestScope.user.userid}" /><%-- 用户id --%>
			<c:set var="will_session_userName" scope="session" value="${fn:trim(requestScope.user.username)}" /><%-- 用户名 --%>
			<c:set var="will_session_checkstatus" scope="session" value="${fn:trim(requestScope.user.checkstatus)}" /><%-- 用户实名认证状态 --%>		
			<%-- 设置 cookie --%>
			<util:writeCookie name="sid" value="${param.sid}" domain="${pageScope._domain }"></util:writeCookie>
			<util:writeCookie name="uid" value="${requestScope.user.userid}" domain="${pageScope._domain }"></util:writeCookie>
			<util:writeCookie name="username" value="${fn:trim(requestScope.user.username)}" domain="${pageScope._domain }"></util:writeCookie>
			<util:writeCookie name="checkstatus" value="${fn:trim(requestScope.user.checkstatus)}" domain="${pageScope._domain }"></util:writeCookie>
	        </c:if>
	        <c:out value="will_session_uid===update pub session success"></c:out>
       </c:if>  
  </c:otherwise>
 
</c:choose>


