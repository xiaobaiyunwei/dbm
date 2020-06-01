<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.chinatet.demo.domain.UdpClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<%
	try{
		boolean flag = false;
		String msg = request.getParameter("message");
		String ip = request.getParameter("ip");
		String port = request.getParameter("port");
		String s = request.getParameter("sendflag");
		if(!StringUtils.isEmpty(msg)&&msg.length()>0&&!StringUtils.isEmpty(s)&&s.length()>0){
			UdpClient client = new UdpClient();
			flag = client.udpSendMessage(msg, ip, Integer.parseInt(port));
		}
		request.getSession().setAttribute("flag", flag);
		response.sendRedirect(request.getContextPath() + "/demo/index.jsp");
// 		request.getRequestDispatcher(request.getContextPath() + "/demo/index.jsp").forward(request, response);
	}catch(Exception e){
		e.printStackTrace();
	}
%>

