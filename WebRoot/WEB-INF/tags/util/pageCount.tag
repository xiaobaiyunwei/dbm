<%@ attribute
   	name="pageSize"
   	type="java.lang.String"
   	required="true"
   	description="一页条数"
%>
<%@ attribute
   	name="totalCount"
   	type="java.lang.String"
   	required="true"
   	description="总条数"
%>
<%@ attribute
   	name="var"
   	type="java.lang.String"
   	required="true"
   	description="返回值"
%>
<%@tag import="java.util.*"%>
<%@tag pageEncoding="UTF-8"%>
<%	
	String strVar = (String) jspContext.getAttribute("var");
	Integer pageSize = new Integer((String) jspContext.getAttribute("pageSize"));//每页条数;
	Integer totalCount = new Integer((String) jspContext.getAttribute("totalCount"));
	int pageCount=0;
	if(totalCount%pageSize==0){
		pageCount=totalCount/pageSize;
	}else{
		pageCount=totalCount/pageSize+1;
	}
	jspContext.setAttribute(strVar, pageCount, PageContext.REQUEST_SCOPE);
%>