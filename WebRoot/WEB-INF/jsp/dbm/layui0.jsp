<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
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
	<form class="layui-form" action="">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">IP</label>
				<div class="layui-input-inline">
					<select name="ip" lay-verify="required" lay-search="">
						<option value="">直接选择或搜索IP</option>
						<option value="192.168.192.105">192.168.192.105</option>
						<option value="192.168.192.106">192.168.192.106</option>
						<option value="192.168.192.107">192.168.192.107</option>
					</select>
				</div>
			</div>

			<div class="layui-inline">
				<label class="layui-form-label">端口</label>
				<div class="layui-input-inline">
					<select name="port">
						<option value="">请选择端口</option>
						<option value="27001">27001</option>
						<option value="27002">27002</option>
						<option value="27007">27007</option>
						<option value="27008">27008</option>
					</select>
				</div>
			</div>
			<br>
			<div class="layui-inline">
				<label class="layui-form-label">分析行数</label>
				<div class="layui-input-inline">
					<input type="text" name="linenum" lay-verify="required|number" autocomplete="off" class="layui-input">
				</div>
			</div>


		</div>

		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">普通文本域</label>
			<div class="layui-input-block">
				<textarea placeholder="请输入内容" class="layui-textarea"></textarea>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">热key分析</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
	<div id="add_result" ></div>
	<div id="ip_result"></div>
	<div id="cmd_result"></div>
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

							//创建一个编辑器
							var editIndex = layedit.build('LAY_demo_editor');

							//自定义验证规则
							form.verify({
								title : function(value) {
									if (value.length < 5) {
										return '标题至少得5个字符啊';
									}
								},
								pass : [ /^[\S]{6,12}$/, '密码必须6到12位，且不能出现空格' ],
								content : function(value) {
									layedit.sync(editIndex);
								}
							});

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
								$("#add_result").html('分析运行中……');
								subData(data);
								return false;
							});

							//表单赋值
							layui.$('#LAY-component-form-setval').on('click',
									function() {
										form.val('example', {
											"username" : "贤心" // "name": "value"
											,
											"password" : "123456",
											"interest" : 1,
											"like[write]" : true //复选框选中状态
											,
											"close" : true //开关状态
											,
											"sex" : "女",
											"desc" : "我爱 layui"
										});
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
			$("#add_result").html('分析运行中……');
			var ip = o.field.ip;
			var linenum = o.field.linenum;
			var port = o.field.port;
			var fields = [ "ip", "linenum", "port" ];//参数;
			var values = [ ip, linenum , port]; //参数对应的值;
			var url = "${_currConText}/dbm/postdata0.shtm"; //方法要执行的url路径;
			var data_val = postData(url, fields, values, 'add_result');
		}
	</script>

</body>
</html>