<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<jsp:useBean id="generBean" class="java.util.HashMap" scope="page">
	<c:set target="${generBean}" property="phone" value="${param.phone}"></c:set>
	<c:set target="${generBean}" property="name" value="${param.name}"></c:set>
	<c:set target="${generBean}" property="age" value="${param.age}"></c:set>
	<c:set target="${generBean}" property="describe" value="${param.describe}"></c:set>
</jsp:useBean>
<Sql:sqlSession.insert sqlMapId="demo_mysql" stmt="ns.sns.demo.insertSnsDemo" param="${generBean}" var="demoId">
</Sql:sqlSession.insert>
<!-- ${abc } -->
<input type="text" id="data_id" name="data_id" value="${demoId }"/>
<c:if test="${not empty demoId }">
	<c:redirect url="/demo/sync/synclist.shtm">
	</c:redirect>
</c:if>