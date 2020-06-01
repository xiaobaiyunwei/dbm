
<%@tag import="com.devops.rad3.ibatis2.SqlMapTemplate"%>
<%@tag import="com.devops.common.CompareMap" %>
<%@ attribute
	name="stmtCount"
	type="java.lang.String"
	required="true"
	description="(String) short for statment, 对应 iBatis 的 SELECT 标签名" %>
	
<%@ attribute
	name="stmt"
	type="java.lang.String"
	required="true"
	description="(String) short for statment, 对应 iBatis 的 SELECT 标签名" %>
	
<%@ attribute
	name="pageCount"
	type="java.lang.String"
	required="false"
	description="(String) short for statment" %>
	
<%@ attribute
	name="param"
	type="java.lang.Object"
	required="false"
	description="(Object) short for parameter, 执行SQL的参数对象MAP，一般可直接传入JSTL的param对象" %>
	
<%@ attribute
	name="var"
	type="java.lang.String"
	required="false"
	description="(String) 查询结果存放的变量名" %>
	
<%@ attribute
	name="varCount"
	type="java.lang.String"
	required="false"
	description="(String) 查询结果存放的变量名" %>

<%@ attribute
	name="sqlMapId"
	type="java.lang.String"
	required="false"
	description="(String) sql-map-config的id" %>
	
<%@ include file="/WEB-INF/tags/sql/inc/taglibs.jsp" %>

<%@ tag 
    import="javax.servlet.jsp.PageContext, java.util.*,com.devops.common.*"
    dynamic-attributes="dynamicAttributes"
    description="查询多条结果." %>

<%
	String strStmtCount = (String)jspContext.getAttribute("stmtCount");
	String strStmt = (String)jspContext.getAttribute("stmt");
	String pageCount = (String)jspContext.getAttribute("pageCount");
	Object objParameter = jspContext.getAttribute("param");
	String strVar = (String)jspContext.getAttribute("var");
	String strVarCount = (String)jspContext.getAttribute("varCount");
	Map aMap = new HashMap();
	aMap = (HashMap) objParameter;
	
	if (strVar == null || strVar.trim().equals("")) {
		strVar = "rtSelectList";
	}
	
	Object objRtn = null;
	List listRtn = null;
	Integer getsessionCount = (Integer) request.getSession(true).getAttribute("sess_pagination_count");
	String getsessionStmtCount = (String) request.getSession(true).getAttribute("sess_pagination_stmtcount");
	Map getsessionMap = new HashMap();
	getsessionMap = (HashMap) request.getSession(true).getAttribute("sess_pagination_map");
	
	Integer count;
	if ("stmtCount".equals(getsessionStmtCount) && CompareMap.equalsMap(getsessionMap,aMap)){
		count = getsessionCount;
	} else {
		if (objParameter == null) {
			objRtn = SqlMapTemplate.selectObject(sqlMapId,strStmtCount,null);
		} else {
			objRtn = SqlMapTemplate.selectObject(sqlMapId,strStmtCount, objParameter);
		}
		count =  (Integer)objRtn;//总个数
		request.getSession(true).setAttribute("sess_pagination_count",count);
	}
	
	PageUtil pageUtil = null;
	if(count.intValue() > 0){
		if (objParameter == null) {
			listRtn = SqlMapTemplate.selectList(sqlMapId,strStmt,null);
		} else {
			listRtn = SqlMapTemplate.selectList(sqlMapId,strStmt, objParameter);
		}
	}
    jspContext.setAttribute(strVarCount, objRtn, PageContext.REQUEST_SCOPE);
    jspContext.setAttribute(strVar, listRtn, PageContext.REQUEST_SCOPE);
%>


