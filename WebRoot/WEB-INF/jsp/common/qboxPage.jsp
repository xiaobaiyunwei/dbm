<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/noCache.jsp"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
	<title>意见反馈</title>
	<link rel="stylesheet" type="text/css" href="${_projectContext}${_cssURL}/reg.css" />
<link rel="stylesheet" type="text/css" href="${_pubConText}${_cssURL}/qboxPage.css" />
<link id="skin" rel="stylesheet" href="${_projectContext}${_cssURL}/BoxSkins/Blue/jbox.css" />
	<%@ include file="/WEB-INF/jsp/common/js_cookie_c.jsp"%>
	<script language="javascript" src="${_projectContext}${_jsURL}/common.js"></script>
	<script language="javascript" src="${_projectContext}${_jsURL}/global.js"></script>
	<script language="javascript" src="${_projectContext}${_jsURL}/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="${_projectContext}${_jsURL}/jquery/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="${_projectContext}${_jsURL}/jquery/jquery.jBox-zh-CN.js"></script>
<style> 
</style>
</head>
<body>
<!--头部开始-->
<script language="javascript" src="${_webSite}${_pubConText}${_jsURL}/global.js"></script> 
<c:import url="${_webSite}${_pubConText}/common/headHtml.shtm" charEncoding="UTF-8"/>
<script>AAEL.Global.writeLoginInfo();</script>
<!--头部结束-->
<div class="fbox_shadow" style="display: block;z-index: 1;" >
	<div class="fbox" >
		<h3 style="font-size: 100%;"><em style=" font-style: normal;">意见反馈</em></h3>
		<p class="options">
			<label for="section"><input type="radio" checked="checked" value="0" name="radio" id="section">我发现了错误</label>
			<label for="improve">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" value="1" name="radio" id="improve">我期待的改进</label>
		</p>
		<textarea rows="" cols="" id="info" name="info" class="inputs" maxlength="2000"></textarea>
		<div class="clear"></div></br>
		<p class="sug">为了更好的了解您的意见，请留下您的联系方式(选填)：</p>
		<input type="text" value="电话或者邮箱..." class="contact stest1" id="contact" name="contact" maxlength="50">
		<input type="button" value="提交" name="" class="submit_btn inputs">
	</div>
</div>
<div class="floor">
<script type="text/javascript" src="${_projectContext}${_jsURL}/footer.js"></script>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		
		//点击联系方式输入框
		$(".contact").focus(function(){
			var contact = $("#contact").val();
			if($.trim(contact) == "电话或者邮箱...")
			{
				$("#contact").val("");
			}
		}).blur(function(){
			var contact = $("#contact").val();
			if($.trim(contact) == "")
			{
				$("#contact").val("电话或者邮箱...");
			}
		});
		
		//点击提交按钮
		$(".submit_btn").click(function(){
			var adviceType = $("input[type=radio]:checked").val();
			var adviceContent = $("#info").val();
			var userInfo = $("#contact").val();
			if($.trim(adviceContent) != "")
			{
				if(userInfo == "电话或者邮箱...")
				{
					userInfo = "";
				}
				var p = {adviceType:adviceType, adviceContent:encodeURI(adviceContent), userInfo:encodeURI(userInfo)};
				$.post("${_pubConText}/common/qbox_add.shtm", p, function(data){
					data = $.trim(data);
					if(data > 0)
					{
						var tip = "您的意见反馈已成功提交，感谢您的支持和帮助！";
						$.jBox.confirm(tip, "提交成功", function(){
							$("input[type=radio][value=0]").attr("checked", "checked");
							$("#info").val("");
							$("#contact").val("电话或者邮箱...");
						}, { buttons: { "确定": true} });
					}
				});
			}
			else{
				$.jBox.alert("请填写意见!","提示",{top: '40%'});
			}
		});
	});
</script>
</body>
</html>

