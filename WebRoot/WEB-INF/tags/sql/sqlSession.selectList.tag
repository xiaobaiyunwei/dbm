<%@ tag 
    import="com.devops.rad3.ibatis2.SqlMapTemplate, javax.servlet.jsp.PageContext, java.util.*"
    dynamic-attributes="dynamicAttributes"
    description="查询多条结果." %><%@ attribute
    
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
	description="(String) sql-map-config的id" %><%

	if (var == null || var.trim().equals("")) {
		var = "rtSelectList";
	}

	List listRtn = SqlMapTemplate.selectList(sqlMapId, stmt, param);
	
    jspContext.setAttribute(var, listRtn, PageContext.REQUEST_SCOPE);
%>