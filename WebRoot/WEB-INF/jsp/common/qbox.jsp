<%@ page pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<link rel="stylesheet" type="text/css" href="${_pubConText}${_cssURL}/qbox.css" />
<!-- <div class="feedback" style="display: block;z-index: 1;"><a title="意见反馈" href="javascript:void(0);" id="link-feedback">意见反馈</a></div> -->

<div class="fbox_shadow" style="display: none;z-index: 1;">
	<div class="fbox">
		<h3 style="font-size: 100%;"><em style=" font-style: normal;">意见反馈</em><a title="关闭" href="javascript:void(0);" class="f_close_btn" style="color: #000000;text-decoration: none;"></a></h3>
		<p class="options">
			<label for="section"><input type="radio" checked="checked" value="0" name="radio" id="section">我发现了错误</label>
			<label for="improve"><input type="radio" value="1" name="radio" id="improve">我期待的改进</label>
		</p>
		<textarea rows="" cols="" id="info" name="info" class="inputs" maxlength="2000"></textarea>
		<div class="clear"></div>
		<p class="sug">为了更好的了解您的意见，请留下您的联系方式(选填)：</p>
		<input type="text" value="电话或者邮箱..." class="contact stest1" id="contact" name="contact" maxlength="50">
		<input type="button" value="提交" name="" class="submit_btn inputs">
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		//点击意见反馈
		$("#link-feedback").click(function(){
			$(".feedback").hide();
			$(".fbox_shadow").show();
		});
		
		//点击关闭图标
		$(".f_close_btn").click(function(){
		$(".feedback").show();
		$(".fbox_shadow").hide();
		});
		
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
			var adviceType = $("input[type='radio']:checked").val();
			var adviceContent = $("#info").val();
			var userInfo = $("#contact").val();
			if(adviceType==null||adviceType==""||"undefined"==adviceType){
				adviceType=0;
			}
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
							$(".feedback").show();
							$(".fbox_shadow").hide();
						}, { buttons: { "确定": true} });
					}
				});
			} 
			else
			{
				$(".feedback").show();
				$(".fbox_shadow").hide();
			}
		});
	});
</script>