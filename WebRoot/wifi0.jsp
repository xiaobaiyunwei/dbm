<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags/wifi" prefix="wifi" %>
<html>
<head>
<meta charset="UTF-8">
<title>Layui</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="${_currConText}${_jsURL }/layui/${_cssURL }/layui.css" media="all">
</head>
<body>
	<div class="layui-fluid">	
			<div class="layui-col-md8">
				<div class="layui-row layui-col-space15">
					<div class="layui-col-md6">
						<div class="layui-card">
							<div class="layui-card-header">WIFI列表：</div>
							<div class="layui-card-body">
								<!-- <div class="layui-form" > -->
									<div class="layui-form-item">
										<div class="layui-inline">
											<!-- <label class="layui-form-label">端口</label> -->
											<div class="layui-input-inline">
												<select name="selected"  id="selected" style="height:38px;padding-left:10px;padding-right:30px;">
													<option value="0">选择WIFI</option>
													<option value="192.168.192.165">DL-LanDev</option>
													<option value="192.168.192.166">DL-LanTest</option>
													<option value="192.168.190.11">DL-WanTest</option>													
												</select> 
											</div>
											<div class="layui-input-inline" id="add_result">
											</div>
										</div>
									</div>
									<!-- <div class="layui-form-item">
										<div class="layui-input-block;">
											<button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">确定</button>
										</div>
									</div> 		 -->
								<!-- </div> -->
							</div>
						</div>
					</div>							
				</div>
			</div>	
	</div>			
	<input type="hidden" id="clientIp" value="192.168.192.88"/>
	<input type="hidden" id="mac" value="${param.mac}"/>
	<script src="${_currConText}${_jsURL }/layui/layui.js" charset="utf-8"></script>
	<script src="${_currConText}${_jsURL }/jquery/jquery.js" type="text/javascript"></script>
	<script src="${_currConText}/js/dbm/dataope.js" type="text/javascript"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
	$(document).ready(function(){
		$("#selected").change(function(){
			if($("option:selected",this).val()=='0'){
			}else{
				setwifi($("option:selected",this).val());
			}
		});
	});
	function setwifi(dns){
		var dns = dns;
		var clientIp=$("#clientIp").val();
		var mac=$("#mac").val();
		var fields = [ "dns", "clientIp", "mac" ];//参数;
		var values = [ dns, clientIp, mac ]; //参数对应的值;
		var url = "${_currConText}/set/iptables.shtm"; //方法要执行的url路径;
		//alert(dns+"||"+clientIp+"||"+mac);
		var data_val = postData(url, fields, values, 'add_result');

	}
	layui.use(
					[ 'form', 'layedit', 'laydate' ],
					function() {
						var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;
						//日期
						laydate.render({
							elem : '#date'
						});
						laydate.render({
							elem : '#date1'
						});
	
						//创建一个编辑器
						var editIndex = layedit.build('LAY_demo_editor');
	
						//监听指定开关
						form.on('switch(switchTest)', function(data) {
							layer.msg('开关checked：'
									+ (this.checked ? 'true' : 'false'), {
								offset : '6px'
							});
							layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF',
									data.othis)
						});
	
						//监听提交
						form.on('submit(demo1)', function(data) {
							subData(data);
							return false;
						});				
						//表单取值
						layui.$('#LAY-component-form-getval').on('click',
								function() {
									var data = form.val('example');
									alert(JSON.stringify(data));
								});
	
		});	
	</script>
</body>
</html>