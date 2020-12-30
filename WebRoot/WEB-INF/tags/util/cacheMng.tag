
<%@tag import="java.rmi.Naming"%>
<%@tag import="com.****edu.rad3.rmi.Cache"%>

<%@ attribute
	name="var"
	type="java.lang.String"
	required="false"
	description="返回变量" 
%>
<%@ attribute
	name="server"
	type="java.lang.String"
	required="true"
	description="服务器IP或域名" 
%>

<%@ attribute
	name="port"
	type="java.lang.String"
	required="true"
	description="服务器IP或域名" 
%>
<%@ attribute
	name="dbID"
	type="java.lang.String"
	required="false"
	description="数据库ID" 
%>

<%@ attribute
	name="memCachID"
	type="java.lang.String"
	required="true"
	description=""
%>
<%@ include file="/WEB-INF/tags/sql/inc/taglibs.jsp" %>

<%
	boolean returnValue=false;
	String strVar = (String) jspContext.getAttribute("var");
	String server = (String) jspContext.getAttribute("server");
	String port   = (String) jspContext.getAttribute("port");
	String dbID   = (String) jspContext.getAttribute("dbID");
	String memCachID = (String) jspContext.getAttribute("memCachID");
	
	try{    
		Cache cache =  (Cache)Naming.lookup("//"+server+":"+port+"/cache");            
		cache.flushCache(dbID, memCachID);
		returnValue = true;   
	}    
	catch(Exception e){    
		e.printStackTrace();  
	}    
    
	jspContext.setAttribute(strVar, returnValue, PageContext.REQUEST_SCOPE);
%>