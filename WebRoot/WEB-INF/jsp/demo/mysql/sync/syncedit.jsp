<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<Sql:sqlSession.update sqlMapId="demo_sqlserver" stmt="ns.sns.demo.updateSnsDemo" param="${param}" var="ediresult"/>
<c:if test="${not empty ediresult }">
	<c:redirect url="/demo/sync/synclist.shtm"></c:redirect>
</c:if>