<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="_cssURL" value="/css"></c:set>
<c:set var="_currConText" value="${pageContext.request.contextPath}"></c:set>
<c:set var="_jsURL" value="/js"></c:set>
<head>
<link rel="stylesheet" type="text/css" media="screen"
	href="${_currConText}${_cssURL }/thumb/main.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="${_currConText}${_cssURL }/jquery/screen.css" />
<script src="${_currConText}${_jsURL }/jquery/jquery.js"
	type="text/javascript"></script>
<script src="${_currConText}${_jsURL }/jquery/jquery.validate.js"
	type="text/javascript"></script>
<script src="${_currConText}${_jsURL }/jquery/jquery.metadata.js"
	type="text/javascript"></script>
<script src="${_currConText}${_jsURL }/jquery/messages_cn.js"
	type="text/javascript"></script>
<script src="${_currConText}/js/dbm/dataope.js" type="text/javascript"></script>
<style type="text/css">
.left {
	float: left;
	width: 200px;
	height: 100%;
	font-family: sans-serif;
	##background-color: red;
	font-size:x-large;
}
.right {
	float: right;
	height: 100%;
	bargin: 2px;
	font-size:12px;
	font-family: sans-serif;
	font-size:20px;
	color:green;
}
</style>
<script type="text/javascript">
	$().ready(function() {
		$.metadata.setType("attr", "validate");
		$('#add_form').validate();
		postPre();		
	});
	/**
	 * 验证成功后执行addDemo方法;
	 */
	$.validator.setDefaults({
		submitHandler : function() {
			subData();
		}
	});
	//post before
	function postPre() {
		var url = '${_currConText}/dbm/postpre.shtm';//方法要执行的url路径;
		var div_id = 'post_pre';//执行请求后返回的内容显示在id为demo_add位置处;
		postDataPre(url, div_id);
	}
	//post data()
	function subData() {
		var ip = document.getElementById('ip').value;
		var linenum = $('#linenum').val();
		var describe = $('#describe').val();
		var fields = [ "ip", "describe","linenum"];//参数;
		var values = [ ip, describe,linenum]; //参数对应的值;
		var url = "${_currConText}/dbm/postdata.shtm"; //方法要执行的url路径;
		var data_val = postData(url, fields, values, 'add_result');
	}
	function sortIP(){
		var describe='/bin/sh /opt/devops/cmd/ipgroup.sh';
		var fields = ["describe"];
		var values = [describe];
		var url = "${_currConText}/dbm/statistics.shtm";
		postData(url, fields, values, 'add_result');
	}
	function sortCMD(){
		var describe='/bin/sh /opt/devops/cmd/cmdgroup.sh';
		var fields = ["describe"];
		var values = [describe];
		var url = "${_currConText}/dbm/statistics.shtm";
		postData(url, fields, values, 'add_result');		
	}	
</script>
<title>redis manage首页</title>
</head>
<body>
	<div style="margin-top: 20px;" class="left">
		<input type="button" value="执行shell" onclick="postPre()" />
		<input type="button" value="Text赋值" onclick="appendCmd()" />
		<form action="" class="cmxform" name="add_form" id="add_form"
			method="post">
			<div id="post_pre"></div>
		</form>
		<input name="a" type="button" value="IP统计1" onclick="sortIP()"/>
		<input name="b" type="button" value="方法统计" onclick="sortCMD()"/>
	</div>
	<div id="add_result"  style="margin-top: 20px;position:relative; left:-150px;" class="right"></div>
</body>
</html>