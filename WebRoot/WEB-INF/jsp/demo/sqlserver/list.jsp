<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<script src="${_currConText}${_jsURL}/jquery/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${_currConText}${_jsURL}/jquery/jquery.jeditable.js" type="text/javascript" charset="utf-8"></script>
<%
	response.setHeader("PRagma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<body>

<%@include file="/WEB-INF/jsp/common/dataope/pageparam.jsp"%>
<!-- 查询条件start -->
<c:set target="${pageScope.generBean}" property="id" value="${param.id}"></c:set>
<!-- 查询条件end -->
<%@include file="/WEB-INF/jsp/common/dataope/list.jsp"%>
<c:if test="${not empty demoList}">
	<%@include file="/WEB-INF/jsp/common/page0.jsp"%>
</c:if>
<table width="700" align="center" cellpadding="0" cellspacing="0"
	style="margin-top: 3px;" class="tikumore">
	<tr>
		<td style="font-size: 12px; padding: 5px;">ID</td>
		<td style="font-size: 12px; padding: 5px;">名字</td>
		<td style="font-size: 12px; padding: 5px;">年龄</td>
		<td style="font-size: 12px; padding: 5px;">手机号</td>
		<td style="font-size: 12px; padding: 5px;">操作</td>
	</tr>
	<c:forEach var="demo" items="${demoList}">
		<tr>
			<td style="font-size: 12px; padding: 5px;">${demo.id}</td>
			<td style="font-size: 12px; padding: 5px;">${demo.name}</td>
			<td style="font-size: 12px; padding: 5px;">${demo.age}</td>
			<td style="font-size: 12px; padding: 5px;" id="${demo.id}">
			${demo.phone}</td>
			<script type="text/javascript">    		
			$("#${demo.id}").editable("${_currConText}/demo/sqlserver/editable.shtm", { 
				id : 'id',
				name : 'phone',
			    indicator : "<img src='${_currConText}/images/jquery/indicator.gif'>",
			    type   : 'textarea',
			    submitdata: { _method: "post" },
			    select : true,
			    submit : 'OK',
			    cancel : 'cancel',
			    cssclass : "editable",
			    style  : "inherit"
			  
			}); 		
			</script>
			<td style="font-size: 12px; padding: 5px;"><a href="#"
				onclick="toEditDemo(${demo.id})">编辑</a> &nbsp; <a href="#"
				onclick="deleteDemo(${demo.id})">删除</a></td>
		</tr>
	</c:forEach>
</table>
<c:if test="${not empty demoList}">
<div style="position: relative;left: 180px;">
	<%@include file="/WEB-INF/jsp/common/page.jsp"%>
</div>
</c:if>
</body>
