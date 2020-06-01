<%@ attribute
   	name="pageSize"
   	type="java.lang.String"
   	required="true"
   	description="一页条数"
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
	String pageNum = request.getParameter("currPage");//当前处于第几页；
	int pageNumStart = 0, pageNumEnd = 0;//数据开始位置，结束位置；
	if (pageNum == null || pageNum.equals("")) {
		pageNumStart = 1;
	} else {
		pageNumStart = ((Integer.valueOf(pageNum).intValue() - 1) * pageSize + 1);
	}
	if (pageNum == null || pageNum.equals("")) {
		pageNumEnd = pageSize;
	} else {
		pageNumEnd = (Integer.valueOf(pageNum).intValue() * pageSize);
	}
	if (pageNum == null || pageNum.equals("")) {
		pageNum = "1";
	}
	pageNumStart=pageNumStart-1;
	pageNumEnd=pageNumEnd-1;
	Map pageMap = new HashMap();	
	pageMap.put("pageNum",pageNum);
	pageMap.put("pageNumStart",pageNumStart);
	pageMap.put("pageNumEnd",pageNumEnd);
	pageMap.put("pageSize",pageSize);	
	jspContext.setAttribute(strVar, pageMap, PageContext.REQUEST_SCOPE);
%>