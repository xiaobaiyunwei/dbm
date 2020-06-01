	
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

<%@tag pageEncoding="UTF-8"%>
<%	
	String strVar = (String) jspContext.getAttribute("var");
	String param = (String) jspContext.getAttribute("param");
	
	String rtnVal="";

	if(param.equals("1")){
	    rtnVal="一";
	}
	else if(param.equals("2")){
	    rtnVal="二";
	}
	else if(param.equals("3")){
	    rtnVal="三";
	}
	else if(param.equals("4")){
	    rtnVal="四";
	}
	else if(param.equals("5")){
	    rtnVal="五";
	}
	else if(param.equals("6")){
	    rtnVal="六";
	}
	else if(param.equals("7")){
	    rtnVal="七";
	}
	else if(param.equals("8")){
	    rtnVal="八";
	}
	else if(param.equals("9")){
	    rtnVal="九";
	}
	else if(param.equals("10")){
	    rtnVal="十";
	}
	else {
	    rtnVal="";
	}
	jspContext.setAttribute(strVar, rtnVal, PageContext.REQUEST_SCOPE);
%>