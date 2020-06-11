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
	<br>
<!-- 获取ip列表 -->
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md8">
				<div class="layui-row layui-col-space15">
					<div class="layui-col-md6">
						<div class="layui-card">
							<div class="layui-card-body">
								<form class="layui-form" action=""> 
									<div class="layui-form-item">
										<div class="layui-inline">
											<label class="layui-form-label">WIFI</label>
											<div class="layui-input-inline">
												<select name="dns"  id="dns"  lay-verify="required">
													<option value="">选择WIFI</option>
													<option value="192.168.192.165">DL-LanDev</option>
													<option value="192.168.192.166">DL-LanTest</option>
													<option value="192.168.190.11">DL-WanTest</option>													
												</select> 
											</div>
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-inline">
											<label class="layui-form-label">客户端IP</label>
											<div class="layui-input-inline">
												<input type="text" id="clientIp" name="clientIp" value="192.168.190.66" lay-verify="required:true,maxlength:20,isip:true" autocomplete="off" class="layui-input">
											</div>
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-inline">
											<label class="layui-form-label">MAC地址</label>
											<div class="layui-input-inline">
												<input type="text" id="mac" name="mac" value="44:a8:42:26:ca:76" lay-verify="required" autocomplete="off" class="layui-input">
											</div>
										</div>
									</div>
												
									<div class="layui-form-item">
										<div class="layui-input-block;" style="text-align: center;">
											<button type="submit" class="layui-btn" lay-submit="" lay-filter="setwifi">确定</button>
										</div>
										<div id="add_result"></div>	
									</div> 		
								 </form>
							</div>
						</div>
					</div>							
				</div>
			</div>
		</div>
	</div>
	
	<script src="${_currConText}${_jsURL }/layui/layui.js" charset="utf-8"></script>
	<script src="${_currConText}${_jsURL }/jquery/jquery.js" type="text/javascript"></script>
	<script src="${_currConText}/js/dbm/dataope.js" type="text/javascript"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
		layui
				.use(
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

							//监听提交
							form.on('submit(setwifi)', function(data) {
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
		//post data()
		function subData(o) {			
			var dns = o.field.dns;
			var clientIp=$("#clientIp").val();
			var mac=$("#mac").val();
			var fields = [ "dns", "clientIp", "mac" ];//参数;
			var values = [ dns, clientIp, mac ]; //参数对应的值;
			var url = "${_currConText}/set/iptables.shtm"; //方法要执行的url路径;
			//alert(dns+"||"+clientIp+"||"+mac);
			var data_val = postData(url, fields, values, 'add_result');			
		}								
	</script>
</body>
</html>