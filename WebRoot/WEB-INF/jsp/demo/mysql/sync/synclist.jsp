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
<head><title>this is mysql synclist</title></head>
<body>
<c:set var="pageSize" value="3"></c:set>
<util:page_sqlserver pageSize="${pageSize }" var="pageInfo" />
<jsp:useBean id="generBean" class="java.util.HashMap" scope="page">
	<c:set target="${pageScope.generBean}" property="pageNumStart" value="${pageInfo.pageNumStart }"></c:set>
	<c:set target="${pageScope.generBean}" property="pageNumEnd" value="${pageInfo.pageNumEnd}"></c:set>
	<c:set target="${pageScope.generBean}" property="pageSize" value="${pageInfo.pageSize}"></c:set>
</jsp:useBean>
<!-- 查询条件start -->
<c:set target="${pageScope.generBean}" property="id" value="${param.id}"></c:set>
<!-- 查询条件end -->
<util:getListForPage sqlMapId="demo_mysql" stmtCount="ns.sns.demo.getSnsDemoListCount" stmt="ns.sns.demo.getSnsDemoList" varCount="totalCount" pageCount="${pageInfo.pageSize}"
	var="demoList" param="${generBean}" />
<util:pageTurn pageNum="${pageInfo.pageNum}" totleCount="${totalCount}" pageCount="${pageInfo.pageSize}" var="pageObj" />

<c:if test="${not empty demoList}">
	<%@include file="/WEB-INF/jsp/common/page0.jsp"%>
</c:if>
<a href="${_currConText}/demo/sync/synctoadd.shtm">添加</a>

<form id="form1" name="form1" action="${_currConText}/demo/sync/synclist.shtm" method="post">
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
			$("#${demo.id}").editable("${_currConText}/demo/sync/synceditable.shtm", { 
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
			<td style="font-size: 12px; padding: 5px;">
				<a href="${_currConText}/demo/sync/synctoedit.shtm?id=${demo.id}" >编辑</a> &nbsp; 
				<a href="${_currConText}/demo/sync/syncdelete.shtm?id=${demo.id}" >删除</a>
			</td>
		</tr>
	</c:forEach>
</table>
</form>

<c:if test="${not empty demoList}">
<div style="position:relative;left:170px;">
	<%@include file="/WEB-INF/jsp/common/page.jsp"%>
</div>
</c:if>
</body>
<script type="text/javascript">
function goPage(pageNum){//分页用的函数
	try {
        document.form1.action = document.form1.action + "?currPage=" + parseInt(pageNum);
        document.form1.target = '_self';
        document.form1.submit();
     } catch(e) {
         alert("页码输入错误！");
     }    
}
</script>
