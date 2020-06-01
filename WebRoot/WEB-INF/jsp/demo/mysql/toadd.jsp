<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<script src="${_currConText}${_jsURL }/jquery/jquery.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL }/jquery/jquery.validate.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL }/jquery/jquery.metadata.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL }/jquery/messages_cn.js" type="text/javascript"></script>
<style>
td.td1 {
	text-align: right;
}
</style>
<table width="500" align="center" cellpadding="0" cellspacing="0" style="margin-top: 3px;" class="tikumore" style="border: solid thin red">
	<form action="" class="cmxform" name="add_form" id="add_form" method="post">
		<tr>
			<td style="font-size: 12px; padding: 5px;" class='td1'><font color='red'>名111字:</font></td>
			<td style="font-size: 12px; padding: 5px;"><input type='text' id="name" name="name" value="" validate="required:true,maxlength:10"></td>
		</tr>
		<tr>
			<td style="font-size: 12px; padding: 5px;" class='td1'>年龄:</td>
			<td style="font-size: 12px; padding: 5px;"><input type='text' id="age" name="age" value="" validate="required:true,number:true,maxlength:3">
			</td>
		</tr>
		<tr>
			<td style="font-size: 12px; padding: 5px;" class='td1'>手机号:</td>
			<td style="font-size: 12px; padding: 5px;"><input type='text' id="phone" name="phone" value="" validate="phone:true,required:true"></td>
		</tr>
		<tr>
			<td style="font-size: 12px; padding: 5px;" class='td1'>描述:</td>
			<td style="font-size: 12px; padding: 5px;"><textarea name="describe" id="describe" cols="50" rows="5"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="提交" /></td>
		</tr>
	</form>
</table>
<input type='hidden' id='pageNum' value='${param.pageno}' />
<script type="text/javascript">
	$().ready(function() {
		$.metadata.setType("attr", "validate");
		$('#add_form').validate();
	});
	
	$.validator.setDefaults({
		submitHandler : function() {
			addDemo();
		}
	});

	//addDemo()
	function addDemo() {
		var name = document.getElementById('name').value;
		var age = document.getElementById('age').value;
		var phone = document.getElementById('phone').value;
		var describe = $('#describe').val();
		$.get("${_currConText}/demo/mysql/add.shtm", {
			name : name,
			age : age,
			phone : phone,
			describe : describe
		}, function(data) {								
			//window.parent.$.jBox.close();
			window.parent.$.jBox.tip("添加成功！",'info');
			pageno = $("#pageNum").val();
			window.parent.demoList(pageno);
			self.parent.jQuery("#closeWin").click();	
		});
	}

	<!--jqueryvalidateend-->
</script>
