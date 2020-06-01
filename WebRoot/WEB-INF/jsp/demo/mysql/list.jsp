<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<script src="${_currConText}${_jsURL }/jquery/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${_currConText}${_jsURL }/jquery/jquery.jeditable.js" type="text/javascript" charset="utf-8"></script>
<%
	response.setHeader("PRagma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<style>
tr.odd_ {
	color: #ffffff;
	background-color: #A7C942;
}

tr.even {
	background-color: #EAF2D3;
}
</style>
<body>
	<util:page pageSize="5" var="pageInfo" />
	<jsp:useBean id="generBean" class="java.util.HashMap" scope="page">
		<c:set target="${pageScope.generBean}" property="pageNumStart" value="${pageInfo.pageNumStart }"></c:set>
		<c:set target="${pageScope.generBean}" property="pageSize" value="${pageInfo.pageSize}"></c:set>
	</jsp:useBean>

	<util:getListForPage sqlMapId="demo_mysql" stmtCount="ns.sns.demo.getSnsDemoListCount" stmt="ns.sns.demo.getSnsDemoList" varCount="totalCount"
		pageCount="${pageInfo.pageSize}" var="demoList" param="${generBean}" />
	<util:pageTurn pageNum="${pageInfo.pageNum}" totleCount="${totalCount}" pageCount="${pageInfo.pageSize}" var="pageObj" />
	<c:if test="${not empty demoList}">
		<util:pageTurn pageNum="${pageInfo.pageNum}" totleCount="${totalCount}" pageCount="${pageInfo.pageSize}" var="pageObj" />
		<%@include file="/WEB-INF/jsp/common/page0.jsp"%>
	</c:if>
	<table width="700" align="center" cellpadding="0" cellspacing="0" style="margin-top: 3px;" class="tikumore">
		<tr class="odd_">
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
				<td style="font-size: 12px; padding: 5px;" id="${demo.id}">${demo.phone}</td>
				<script type="text/javascript">    		
			$("#${demo.id}").editable("${_currConText}/demo/edit.shtm", { 
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
			
				//$(".editable_textarea").editable("${_currConText}/demo/edit.shtm", { 
					//id : 'id',
					//name : 'phone',
				  //  indicator : "<img src='${_currConText}/images/jquery/indicator.gif'>",
				  //  type   : 'textarea',
				  //  submitdata: { _method: "post" },
				  //  select : true,
				  //  submit : 'OK',
				   // cancel : 'cancel',
				  //  cssclass : "editable"
				  
				//}); 
		
			</script>
				<td style="font-size: 12px; padding: 5px;"><a href="#" onclick="toEditDemo(${demo.id})">编辑</a> &nbsp; <a
					href="view.shtm?id=${demo.id}" target='_blank'>查看</a> &nbsp; <a href="#" onclick="deleteDemo(${demo.id})">删除</a></td>
			</tr>
		</c:forEach>

	</table>

	<div class="pagination solid" style="margin-left: 410px;">
		<div class="page-bottom">

			<c:if test="${not empty demoList}">
				<util:pageTurn pageNum="${pageInfo.pageNum}" totleCount="${totalCount}" pageCount="${pageInfo.pageSize}" var="pageObj" />
				<%@include file="/WEB-INF/jsp/common/page.jsp"%>
			</c:if>

		</div>
	</div>

	<div id="demo_edit"></div>
	<div id="abcd2"></div>
	<input type='hidden' id='pageNum' value="1" />
</body>


<script type="text/javascript">
//编辑操作；
function editd(){
	var id=document.getElementById('id').value;
	var name=document.getElementById('name').value;
	var age=document.getElementById('age').value;
	var phone=document.getElementById('phone').value;
	$.get("${_currConText}/demo/edit.shtm",{id:id,name:name,age:age,phone:phone},function(data){
		document.getElementById('demo_edit').innerHTML='';
		//document.getElementById('demo_edit').style.display="none";
		pageno=$("#pageNum").val(); 
		demoList(pageno);
	});
}
//编辑前
function editDemo(id){
    $.get("${_currConText}/demo/toedit.shtm",{id:id},function(data){
		document.getElementById('demo_edit').innerHTML=data;
	});
}
//删除
function deleteDemo(id){
    $.get("${_currConText}/demo/delete.shtm",{id:id},function(data){
	});
}
//demoList;
function demoList(page){
	$("#pageNum").val(page);
	document.location='${_currConText}/demo/list.shtm?page='+page;
}
function goPage(pageNum){//分页用的函数
	demoList(pageNum);
}
</script>