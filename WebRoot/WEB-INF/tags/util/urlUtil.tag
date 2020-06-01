<%@tag import="com.devops.common.StringUtil"%>
<%@tag import="java.net.URLDecoder"%>

<%@tag import="java.net.URLEncoder"%>
	
<%@ attribute
   	name="param"
   	type="java.lang.String"
   	required="true"
   	description="需处理的参数值"
%>
<%@ attribute
   	name="var"
   	type="java.lang.String"
   	required="true"
   	description="返回值"
%>
<%@ attribute
   	name="method"
   	type="java.lang.String"
   	required="true"
   	description="处理方法（decode，encode,sql,html）"
%>
<%@tag pageEncoding="UTF-8"%>
<%	
	String strVar = (String) jspContext.getAttribute("var");
	String param = (String) jspContext.getAttribute("param");
	//update by zhanglin 2012-07-27 10:10 过滤特殊字符
	param = param.replaceAll("<", "");
	param = param.replaceAll(">", "");
	param = param.replaceAll(";", "");
	param = param.replaceAll("'", "");
	param = param.replaceAll("\\(", "");
	param = param.replaceAll("\\)", "");
	param = param.replaceAll("(?i)"+"javascript", "");
	param = param.replaceAll("(?i)"+"style", "");
	param = param.replaceAll("\"", "");
	param = param.replaceAll("(?i)"+"src=", "");
	param = param.replaceAll("(?i)"+"href=", "");
	param = param.replaceAll("<|>|&lt;|&gt;|\"", ""); 
	param = param.replaceAll("(?i)"+"/script", "");
	param = param.replaceAll("(?i)"+"script", "");
	param = param.replaceAll("(?i)"+"alert", "");
	String method = (String) jspContext.getAttribute("method");
	String rtnVal="";
	if(method.equals("encode")){
	    rtnVal = URLEncoder.encode(param,"UTF-8");
	}
	else if(method.equals("decode")){
	    rtnVal = URLDecoder.decode(param,"UTF-8");
	}
	else if(method.equals("html")){
	    rtnVal=StringUtil.htmLEncode(param);
	}
	else if(method.equals("sql")){
	    rtnVal=StringUtil.sqlDealStr(param);
	}
	else{
		rtnVal="";
	}
	jspContext.setAttribute(strVar, rtnVal, PageContext.REQUEST_SCOPE);
%>