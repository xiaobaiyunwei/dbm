<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<%@ page import="com.chinatet.operateLog.SaveOperateLog,java.net.URLDecoder,java.net.URLEncoder" %>
	<%
	    request.setCharacterEncoding("UTF-8");
		String operator = (String)request.getParameter("operator");
		String operateURL = (String)request.getParameter("operateURL");
		String operateParam = (String)URLDecoder.decode(request.getParameter("operateParam"),"utf-8");
		//String operateParam = (String)request.getParameter("operateParam");
		SaveOperateLog saveOperateLog = new SaveOperateLog();
		
		int re = saveOperateLog.insertOperateLog(operator,operateURL,operateParam);
		out.print(re);
	%>