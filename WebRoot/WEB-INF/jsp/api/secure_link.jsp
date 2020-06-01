<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<%@ page import="com.chinatet.common.*,java.util.Date" %>
	<%
	String userIp = request.getHeader("x-forwarded-for");
	if(userIp == null || userIp.length() == 0 || "unknown".equalsIgnoreCase(userIp)) {
		userIp = request.getHeader("Proxy-Client-IP");
	}
	if(userIp == null || userIp.length() == 0 || "unknown".equalsIgnoreCase(userIp)) {
		userIp = request.getHeader("WL-Proxy-Client-IP");
	}
	if(userIp == null || userIp.length() == 0 || "unknown".equalsIgnoreCase(userIp)) {
		userIp = request.getRemoteAddr();
	}
	Date date = new Date();
	long time = date.getTime();
	int expire = (int)(time/1000+60);//一分钟后链接失效；
	String secret = "fuxuemin"; // To make the hash more difficult to reproduce.
	// At which point in time the file should expire. time() + x; would be the usual usage.	
	String md5 = "";//init param md5;1384392976
	byte bbt[] = MD5.getMD5EncodeByte(secret+expire+userIp);		
	String md5_64 = Base64Utils.getBASE64(bbt); // Using binary hashing.
	md5 = md5_64.replace("+", "-").replace("/", "_");// + and / are considered special characters in URLs.
	md5 = md5.replace("=", ""); // When used in query parameters the base64 padding character 	
	%>
e=<%=expire%>|st=<%=md5%>	