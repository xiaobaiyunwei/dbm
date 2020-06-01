<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<script src="${_currConText}${_jsURL }/jquery/jquery.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL }/jquery/jquery.validate.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL }/jquery/jquery.metadata.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL }/jquery/messages_cn.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" media="screen" href="${_currConText}${_cssURL }/jquery/screen.css" />
<%
	response.setHeader("PRagma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
%>

<head>
<title>This is a modify page!</title>

<style type="text/css">
.tr {
	align: center;
}

.td {
	align: right;
}
</style>
</head>
<Sql:sqlSession.selectOne sqlMapId="demo_mysql" stmt="ns.sns.demo.getSnsDemo" param="${param}" var="SnsDemo" />
<table width="500" align="center" cellpadding="0" cellspacing="0" style="margin-top: 3px;" class="tikumore" style="border: solid thin red">
	<form action="" id="edit_form" method="post">
		<tr>
			<td style="font-size: 12px; padding: 5px;" align="right">ID:</td>
			<td style="font-size: 12px; padding: 5px;"><input type='text' name="id" id="id" readonly value="${SnsDemo.id}"
				style="border: 0; background: transparent;"></td>
		</tr>

		<tr>
			<td style="font-size: 12px; padding: 5px;" align="right">名字:</td>
			<td style="font-size: 12px; padding: 5px;"><input type='text' name="name" id="name" value="${SnsDemo.name}"
				validate="required:true,maxlength:10"></td>
		</tr>

		<tr>
			<td style="font-size: 12px; padding: 5px;" align="right">年龄:</td>
			<td style="font-size: 12px; padding: 5px;"><input type='text' name="age" id="age" value="${SnsDemo.age}"
				validate="required:true,number:true,maxlength:3"></td>

		</tr>

		<tr>
			<td style="font-size: 12px; padding: 5px;" align="right">手机号:</td>
			<td style="font-size: 12px; padding: 5px;"><input type='text' name="phone" id="phone" value="${SnsDemo.phone}"
				validate="phone:true,required:true"></td>
		</tr>

		<tr>
			<td style="font-size: 12px; padding: 5px;" align="right">描述:</td>
			<td style="font-size: 12px; padding: 5px;"><textarea name="describe" id="describe" cols="50" rows="5">${SnsDemo.describe}</textarea></td>
		</tr>

		<tr>
			<td style="font-size: 12px; padding: 5px;" colspan="2" align="center"><input type="submit" value="提交" /></td>
		</tr>

	</form>

</table>
<input type='hidden' id='pageNum' value='${param.pageno}' />
<div id="info"></div>
<script type="text/javascript">
	$().ready(function() {
		$.metadata.setType("attr", "validate");
		$('#edit_form').validate();
	});
	$.validator.setDefaults({
		submitHandler : function() {
			editd();
		}
	});
	//编辑操作；
	function editd() {
		var id = document.getElementById('id').value;
		var name = document.getElementById('name').value;
		var age = document.getElementById('age').value;
		var phone = document.getElementById('phone').value;
		var describe = document.getElementById('describe').value;
		$.get("${_currConText}/demo/mysql/edit.shtm", {
			id : id,
			name : name,
			age : age,
			phone : phone,
			describe : describe
		}, function(data) {
			pageno = $("#pageNum").val();
			window.parent.demoList(pageno);
			window.parent.finish();
		});
	}
	//-->
	<!--jqueryvalidateend-->
</script>