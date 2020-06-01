
<%@ attribute
	name="pageNum"
	type="java.lang.String"
	required="true"
	description="(String) short for statment, 第几页" %>
	
<%@ attribute
	name="totleCount"
	type="java.lang.String"
	required="true"
	description="(String) short for statment, 查询的总个数" %>
	
<%@ attribute
	name="pageCount"
	type="java.lang.String"
	required="false"
	description="(String) short for statment" %>
	
<%@ attribute
	name="var"
	type="java.lang.String"
	required="false"
	description="(String) 查询结果存放的变量名" %>


<%@ include file="/WEB-INF/tags/sql/inc/taglibs.jsp" %>

<%@ tag 
    import="javax.servlet.jsp.PageContext, java.util.*,com.devops.common.*"
    dynamic-attributes="dynamicAttributes"
    description="分页情况" %>

<%
	String pageNum = (String)jspContext.getAttribute("pageNum");
	String totleCount = (String)jspContext.getAttribute("totleCount");
	String pageCount = (String)jspContext.getAttribute("pageCount");
	String strVar = (String)jspContext.getAttribute("var");
	
	PageUtil pageUtil = null;
	int pCount = Integer.valueOf(pageCount).intValue();
	Integer strPage = Integer.valueOf(pageNum);
	Integer count = Integer.valueOf(totleCount);
	if(count.intValue() > 0){
	    pageUtil = new PageUtil();
        pageUtil.setCurrentpage(strPage);
        pageUtil.setTotlecount(count);
        pageUtil.setTotlepage(Integer.valueOf((count.intValue()+pCount-1)/pCount ));
        pageUtil.setFirstpage(Integer.valueOf(1));
        pageUtil.setPrepage(strPage.intValue());
        pageUtil.setNextpage(strPage,Integer.valueOf((count.intValue()+pCount-1)/pCount ));
        pageUtil.setLastpage(Integer.valueOf((count.intValue()+pCount-1)/pCount ));
        pageUtil.setPagecount(Integer.valueOf(pageCount));
	}
    jspContext.setAttribute(strVar, pageUtil, PageContext.REQUEST_SCOPE);
%>


