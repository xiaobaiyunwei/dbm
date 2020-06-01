<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<%
	response.setHeader("PRagma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
%>

<head>
<title>This is a view page!</title>
<script src="${_currConText}${_jsURL }/jquery/jquery.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL }/jquery/jquery.validate.js"
	type="text/javascript"></script>
<script src="${_currConText}${_jsURL }/jquery/jquery.metadata.js"
	type="text/javascript"></script>
<script src="${_currConText}${_jsURL }/jquery/messages_cn.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="${_currConText}${_cssURL }/jquery/screen.css" />
<style type="text/css">
td {
	text-align:left;
}
th {
	text-align:left;
}
</style>
</head>
<Sql:sqlSession.selectOne sqlMapId="demo_mysql"
	stmt="ns.sns.demo.getSnsDemo" param="${param}" var="SnsDemo" />
<table width="500" align="left" cellpadding="0" cellspacing="0"
	style="margin-top: 3px;" 
	style="border: solid thin red">
	<thead style='align:left'>
	<tr><th colspan='3'>This is view page!</th></tr></thead>
		<tr>
			<td style="font-size: 12px; padding: 5px;">ID:</td>
			<td style="font-size: 12px; padding: 5px;">${SnsDemo.id}</td>
		</tr>

		<tr>
			<td style="font-size: 12px; padding: 5px;">名字:</td>
			<td style="font-size: 12px; padding: 5px;">${SnsDemo.name}</td>
		</tr>

		<tr>
			<td style="font-size: 12px; padding: 5px;">年龄:</td>
			<td style="font-size: 12px; padding: 5px;">${SnsDemo.age}</td>
		</tr>

		<tr>
			<td style="font-size: 12px; padding: 5px;">手机号:</td>
			<td style="font-size: 12px; padding: 5px;">${SnsDemo.phone}</td>
		</tr>

		<tr>
			<td style="font-size: 12px; padding: 5px;">描述:</td>
			<td style="font-size: 12px; padding: 5px;">${SnsDemo.describe}</td>
		</tr>
</table>