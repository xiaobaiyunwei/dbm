<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<style>
td.td1 {
	text-align: left;
}
</style>
	<table width="200" align="left" cellpadding="0" cellspacing="0"
		style="margin-top: 3px;" class="left" style="border: solid thin red">
	<form action="" class="cmxform" name="add_form" id="add_form"
		method="post">
		<tr>
			<td style="font-size: 12px; padding: 5px;" class='td1'><font
				color='red'>ip</font> <input type='text' id="ip" name="ip"
				value="127.0.0.1" validate="required:true,maxlength:20" /></td>
		</tr>
		<tr>
			<td style="font-size: 12px; padding: 5px;" class='td1'><font
				color='red'>行数</font> <input type='text' id="linenum" name="linenum"
				value="10" validate="required:true,digits:true" /></td>
		</tr>
		<tr>
			<td style="font-size: 12px; padding: 5px;"><textarea
					name="describe" id="describe" cols="50" rows="5"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="提交"  onclick="info()"/>
			</td>
		</tr>
	</form>
</table>
<script type="text/javascript">
	function info(){
		$("#add_result").html('运行中……');
	}
</script>