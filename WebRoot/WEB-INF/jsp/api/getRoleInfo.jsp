<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="../common/common.jsp" %>
<%@ page import="java.util.Date"%>
<c:set var="msg" value=""></c:set>
<util:md5 var="outKey" value="${param.userId}${param.time}${pageScope._SSOPrivateKey}" />
<c:choose>
	<c:when test="${outKey ne param.pkey}">
		<c:set var="msg" value="-1"></c:set>
	</c:when>	
	<c:otherwise>
		<Sql:sqlSession.selectOne sqlMapId="fund" stmt="ns.usertype.sql.getRoleInfoByUserId"  var="roleId" param="${param.userId }"></Sql:sqlSession.selectOne>
	</c:otherwise>
</c:choose>		

<c:choose>
	<c:when test="${msg eq '-1'}">
	    <?xml version="1.0" encoding="UTF-8" ?> 
		<res>
			<code>0</code>
			<description>param is error</description>
			<roleId />
		</res>
	</c:when>
	<c:otherwise>
	    <?xml version="1.0" encoding="UTF-8" ?> 
		<res>
			<c:if test="${empty roleId }">
			<code>2</code>
			<description>not data</description>
			<roleId>${roleId }</roleId>
			</c:if>
			<c:if test="${not empty roleId }">
			<code>1</code>
			<description>success</description>
			<roleId>${roleId }</roleId>
			</c:if>
		</res>
	</c:otherwise>
</c:choose>