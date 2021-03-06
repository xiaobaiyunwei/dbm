<%@ attribute
	name="stmt"
	type="java.lang.String"
	required="true"
	description="(String) short for statment, 对应 iBatis 的 SELECT 标签名" %><%@ 
	
	attribute
	name="param"
	type="java.lang.Object"
	required="false"
	description="(Object) short for parameter, 执行SQL的参数对象MAP，一般可直接传入JSTL的param对象" %><%@ 
	
	attribute
	name="var"
	type="java.lang.String"
	required="false"
	description="(String) 查询结果存放的变量名" %><%@ 
	
	attribute
	name="sqlMapId"
	type="java.lang.String"
	required="false"
	description="(String) sql-map-config的id" %><%@ 
	
	tag 
    import="com.devops.rad3.ibatis2.SqlMapTemplate,  javax.servlet.jsp.PageContext, java.util.*"
    dynamic-attributes="dynamicAttributes"
    description="查询单条结果." %><%
    
	String strStmt = (String)jspContext.getAttribute("stmt");
	Object objParameter = jspContext.getAttribute("param");
	String strVar = (String)jspContext.getAttribute("var");
	String sqlMapId = (String)jspContext.getAttribute("sqlMapId");
	if (strVar == null || strVar.trim().equals("")) {
		strVar = "rtSelectOne";
	}
	if("".equals(sqlMapId)) sqlMapId = null;
	
	Object objRtn = SqlMapTemplate.selectObject(sqlMapId, strStmt, objParameter);

	jspContext.setAttribute(strVar, objRtn, PageContext.REQUEST_SCOPE);
%>