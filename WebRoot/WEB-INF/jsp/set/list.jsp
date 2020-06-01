<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>layuiAdmin 后台管理员</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="${_currConText}${_jsURL }/layuiadmin/layui/css/layui.css" media="all">
<link rel="stylesheet" href="" ${_currConText} ${_jsURL }/layuiadmin/style/admin.css" media="all">
<script src="${_currConText}${_jsURL }/jquery/jquery.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL }/jquery/jquery.validate.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL }/jquery/jquery.metadata.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL }/jquery/messages_cn.js" type="text/javascript"></script>	
<script src="${_currConText}${_jsURL }/common/dataope.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL }/common/dialog.js" type="text/javascript"></script>
</head>
	<util:page pageSize="10" var="pageInfo" />
	<jsp:useBean id="generBean" class="java.util.HashMap" scope="page">
		<c:set target="${pageScope.generBean}" property="pageNumStart" value="${pageInfo.pageNumStart }"></c:set>
		<c:set target="${pageScope.generBean}" property="pageSize" value="${pageInfo.pageSize}"></c:set>
	</jsp:useBean>
<util:getListForPage sqlMapId="demo_mysql" stmtCount="ns.devops.redis.getRedisDataListCount" stmt="ns.dbm.redis.getRedisDataList" varCount="totalCount"
		pageCount="${pageInfo.pageSize}" var="dataList" param="${generBean}" />
	<util:pageTurn pageNum="${pageInfo.pageNum}" totleCount="${totalCount}" pageCount="${pageInfo.pageSize}" var="pageObj" />
<%-- 	<c:if test="${not empty dataList}">
		<util:pageTurn pageNum="${pageInfo.pageNum}" totleCount="${totalCount}" pageCount="${pageInfo.pageSize}" var="pageObj" />
		<%@include file="/WEB-INF/jsp/common/page0.jsp"%>
	</c:if> --%>
<body >		
	<table class="layui-table">
		<thead>
			<tr>
				<th>ID</th>
				<th>IP</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>			
			<c:forEach var="data" items="${dataList}">
			<tr>
				<td>${data.id }</td>
				<td>${data.ip }</td>
				<td>${data.createtime }</td>
				<td><input type="button" onclick="deleteData(${data.id })" value="删除"></td>
			</tr>
			</c:forEach>			
		</tbody>
	</table>
		<div class="pagination solid" style="margin-left: 410px;">
		<div class="page-bottom">
			<c:if test="${not empty dataList}">
				<util:pageTurn pageNum="${pageInfo.pageNum}" totleCount="${totalCount}" pageCount="${pageInfo.pageSize}" var="pageObj" />
				<%@include file="/WEB-INF/jsp/common/page.jsp"%>
			</c:if>
		</div>
	</div>

</body>
<input type='hidden' id='pageNum' name="pageNum" value='1' />

<script src="${_currConText}${_jsURL }/layuiadmin/layui/layui.js"></script>  
 <script type="text/javascript">
$().ready(function() {
		$.metadata.setType("attr", "validate");
		demoList(1);
		//setTimeout("demoList()", 5000);
	});
	//分页跳转；
	function goPage(pageNum) {
		//分页用的函数
		demoList(pageNum);
	}


	
	//demoList;
	function demoList(page) {		
		$("#pageNum").val(page);
		$.get("${_currConText}/demo/mysql/list.shtm", {
			currPage : page
		}, function(data) {
			document.getElementById('demo_list').innerHTML = data;
		});
	}
	

	
	</script>  
</html>
