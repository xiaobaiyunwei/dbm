<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<jsp:useBean id="generBean" class="java.util.HashMap" scope="page">
	<c:set target="${generBean}" property="phone" value="${param.phone}"></c:set>
	<c:set target="${generBean}" property="name" value="${param.name}"></c:set>
	<c:set target="${generBean}" property="age" value="${param.age}"></c:set>
	<c:set target="${generBean}" property="describe" value="${param.describe}"></c:set>
</jsp:useBean>
<Sql:sqlSession.insert sqlMapId="${param.sqlMapId }" stmt="${param.stmt }" param="${generBean}" var="demoId">
</Sql:sqlSession.insert>
<!-- ${abc } -->
<input type="text" id="data_id" name="data_id" value="${demoId }"/>
添加成功！
<input type="button" onclick='hiddenDiv("add_result");' value="确定">