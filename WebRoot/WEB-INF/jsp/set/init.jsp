<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<head>
<link rel="shortcut icon" href="#"/>
<link rel="stylesheet" type="text/css" media="screen" href="${_currConText}${_cssURL }/thumb/main.css" />
<link rel="stylesheet" type="text/css" media="screen" href="${_currConText}${_cssURL }/jquery/screen.css" />
<script src="${_currConText}${_jsURL }/jquery/jquery.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL }/jquery/jquery.validate.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL }/jquery/jquery.metadata.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL }/jquery/messages_cn.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL }/common/dataope.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL }/common/dialog.js" type="text/javascript"></script>
<%@ include file="/WEB-INF/jsp/common/commonJBox.jsp"%>
<!-- 内联式样式表,直接在标签上通过style属性来定义；-->
<!-- 导入式样式表；不建议使用; -->
<style type="text/css">
@import "${_webSite}${_currConText}${_cssURL }/dialog/dialog.css";
</style>
<title>demo首页</title>
</head>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
<body>
	<div class="layui-card-body">
		<div style="padding-bottom: 10px;">
			<button class="layui-btn layuiadmin-btn-admin" onClick="toAddData()">添加</button>			
		</div>
	</div>
	
	<input type='hidden' id='pageNum' name="pageNum" value='' />
	<div id="data_list"></div>
	<div id="data_add"></div>
	<div id="data_edit"></div>
	<div id="info"></div>
</body>

<script type="text/javascript">
	

	$().ready(function() {
		$.metadata.setType("attr", "validate");
		dataList(1);
		//setTimeout("dataList()", 5000);
	});

	//分页跳转；
	function goPage(pageNum) {
		//分页用的函数
		dataList(pageNum);
	}

	//add demo before
	function toAddData() {
		var pageno = $("#pageNum").val();		
		var url = '${_currConText}/set/addform.shtm?pageno=' + pageno;//方法要执行的url路径;
		var div_id = 'data_add';//执行请求后返回的内容显示在id为demo_add位置处;
		dialog("IP添加", "gg", "${_currConText}/images/dialog/ziyuan_142.jpg",
				"iframe", url, 300, 200, "from", "200");
		//toAddData(url, div_id);
	}

	//弹出编辑对话框,可以公用;
	function toEditData(id) {
		var pageno = $("#pageNum").val();
		var url = '${_currConText}/set/toedit.shtm?id=' + id
				+ "&pageno=" + pageno;//方法要执行的url路径;
		dialog("信息修改", "gg", "${_currConText}/images/dialog/ziyuan_142.jpg",
				"iframe", url, 200, 220, "from", "200");
	}

	//弹出编辑对话框；
	function editData(id) {
		$.get("${_currConText}/set/toedit.shtm", {
			id : id
		}, function(data) {
			document.getElementById('data_edit').innerHTML = data;
		});
	}

	//删除
	function deleteData(id) {
		var statu = confirm("Are you sure to delete the current data?");
			if(!statu){
			   return false;
			}		  
			$.get("${_currConText}/set/delete.shtm", {
				id : id
			}, function(data) {
				pageno = $("#pageNum").val();
				dataList(pageno);
			});
	
	}

	//dataList;
	function dataList(page) {			
		$("#pageNum").val(page);
		$.get("${_currConText}/set/list.shtm", {
			currPage : page
		}, function(data) {
			document.getElementById('data_list').innerHTML = data;
		});
	}
	function finish() {		
		window.parent.$.jBox.tip("修改成功！", 'info');
		self.parent.jQuery("#closeWin").click();		
		window.parent.$.jBox.close();
	}
	
</script>
</html>