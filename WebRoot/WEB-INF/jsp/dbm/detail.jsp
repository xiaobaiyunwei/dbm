<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags/dbm" prefix="dbm" %>
<head>
<title>The details of page.</title>
</head>
<body>
<jsp:useBean id="paramMap" class="java.util.HashMap" scope="page">					
			<c:set target="${paramMap}" property="describe" value="/bin/sh /opt/devops/cmd/detail.sh ${param.param}"></c:set>			
</jsp:useBean>


<dbm:detail var="result" param="${paramMap }"></dbm:detail>
${param}
${result }
</body>
</html>