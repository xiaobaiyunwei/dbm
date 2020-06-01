<%@ attribute
	name="stmt"
	type="java.lang.String"
	required="true"
	description="(String) short for statment, 对应 iBatis 的 SELECT 标签名" %><%@ 
	
	attribute
	name="param"
	type="java.lang.Object"
	required="false"
	description="入参和出参对象" %><%@ 
	
	attribute
	name="sqlMapId"
	type="java.lang.String"
	required="false"
	description="(String) sql-map-config的id" %><%@ 
	
	tag 
    import="com.devops.rad3.ibatis2.SqlMapTemplate, javax.servlet.jsp.PageContext, java.util.*"
    dynamic-attributes="dynamicAttributes"
    description="执行存储过程" %><%
    
	String strStmt = (String)jspContext.getAttribute("stmt");
	Object objParameter = jspContext.getAttribute("param");

	String sqlMapId = (String)jspContext.getAttribute("sqlMapId");
	
	SqlMapTemplate.callProcedure(sqlMapId, strStmt, objParameter);
	
%>