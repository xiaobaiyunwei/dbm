<%@tag import="javax.servlet.jsp.tagext.TagSupport"%>
<%@tag import="org.apache.log4j.Logger"%>
<%@tag import="java.security.MessageDigest"%><%@ attribute
   	name="msg"
   	type="java.lang.String"
   	required="true"
   	description="LOG的信息"
%><%@ attribute
   	name="level"
   	type="java.lang.String"
   	required="false"
   	description="LOG等级"
%><%	
	Logger log = Logger.getLogger(TagSupport.class);
	
	if("info".equals(level)){
		log.info(msg);
	}else if("error".equals(level)){
		log.error(msg);
	}else{
		log.debug(msg);
	}
%>
 
