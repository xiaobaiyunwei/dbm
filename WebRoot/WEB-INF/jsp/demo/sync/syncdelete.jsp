<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>	
<% 
	String id_str = request.getParameter("id");
	int id = Integer.parseInt(id_str);
%>
<Sql:sqlSession.delete sqlMapId="demo_sqlserver" stmt="ns.sns.demo.deleteSnsDemo" param="<%=id%>" var="delresult"/>

<c:redirect url="/demo/sync/synclist.shtm"></c:redirect>


