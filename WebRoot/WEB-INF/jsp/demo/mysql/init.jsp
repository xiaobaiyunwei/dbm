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
	<div style="margin-top: 20px;">
		<table align="center">
			<tbody align="center" id="bodycontent">
				<tr>
					<td>
					<input type="button" value="demoList" name="demoList" id="demoList" onClick="demoList('1')"> 
					<input type="button" value="addDemo" onClick="toAddDemo()"></td>
				</tr>
			</tbody>
		</table>
	</div>
	<input type='hidden' id='pageNum' name="pageNum" value='' />
	<div id="demo_list"></div>
	<div id="demo_add"></div>
	<div id="demo_edit"></div>
	<div id="info"></div>
</body>

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

	//add demo before
	function toAddDemo() {
		var pageno = $("#pageNum").val();		
		var url = '${_currConText}/demo/mysql/toadd.shtm?pageno=' + pageno;//方法要执行的url路径;
		var div_id = 'demo_add';//执行请求后返回的内容显示在id为demo_add位置处;
		dialog("信息修改", "gg", "${_currConText}/images/dialog/ziyuan_142.jpg",
				"iframe", url, 850, 420, "from", "200");
		//toAddData(url, div_id);
	}

	//弹出编辑对话框,可以公用;
	function toEditDemo(id) {
		var pageno = $("#pageNum").val();
		var url = '${_currConText}/demo/mysql/toedit.shtm?id=' + id
				+ "&pageno=" + pageno;//方法要执行的url路径;
		dialog("信息修改", "gg", "${_currConText}/images/dialog/ziyuan_142.jpg",
				"iframe", url, 850, 420, "from", "200");
	}

	//弹出编辑对话框；
	function editDemo(id) {
		$.get("${_currConText}/demo/mysql/toedit.shtm", {
			id : id
		}, function(data) {
			document.getElementById('demo_edit').innerHTML = data;
		});
	}

	//删除
	function deleteDemo(id) {
		$.get("${_currConText}/demo/mysql/delete.shtm", {
			id : id
		}, function(data) {
			pageno = $("#pageNum").val();
			demoList(pageno);
		});
	}

	//生成表头;
	function genTableHead(titles) {
		var str = "<tr>";
		for (i = 0; i < titles.length; i++) {
			str += "<th>" + titles[i] + "</th>";
		}
		str += "</tr>";
		$("#bodycontent").html(str);
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
	function finish() {		
		window.parent.$.jBox.tip("修改成功！", 'info');
		self.parent.jQuery("#closeWin").click();		
		window.parent.$.jBox.close();
	}
	
</script>
</html>