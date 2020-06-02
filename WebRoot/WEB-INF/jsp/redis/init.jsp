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
	<br>
<!-- 获取ip列表 -->

<Sql:sqlSession.selectList sqlMapId="demo_mysql" var="dataList"  stmt="ns.devops.redis.getRedisIP"></Sql:sqlSession.selectList>
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">

			<div class="layui-col-md8">
				<div class="layui-row layui-col-space15">
					<div class="layui-col-md6">
						<div class="layui-card">
							<div class="layui-card-header">热KEY分析：</div>
							<div class="layui-card-body">

								<form class="layui-form" action="">
									<div class="layui-form-item">
										<div class="layui-inline">
											<label class="layui-form-label">IP</label>
											<div class="layui-input-inline">
												<select name="ip" lay-verify="required" lay-search="">
												<option value="">直接选择或搜索IP</option>
												<c:if test="${not empty dataList}">
													<c:forEach var="data" items="${dataList}">
														<option value="${data.ip }">${data.ip }</option>
													</c:forEach>
												</c:if>											
												</select>
											</div>
										</div>
									</div>

									<div class="layui-form-item">
										<div class="layui-inline">
											<label class="layui-form-label">端口</label>
											<div class="layui-input-inline">
												<select name="port" lay-verify="required">
													<option value="">请选择端口</option>
													<option value="27001">27001</option>
													<option value="27002">27002</option>
													<option value="27007">27007</option>
													<option value="27008">27008</option>
												</select>
											</div>
										</div>
									</div>

									<div class="layui-form-item">
										<div class="layui-inline">
											<label class="layui-form-label">分析行数</label>
											<div class="layui-input-inline">
												<input type="text" name="linenum" lay-verify="required|number" autocomplete="off" class="layui-input">
											</div>
										</div>
									</div>

									<div class="layui-form-item">
										<div class="layui-input-block;">
											<button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">热key分析</button>
											<button type="button" class="layui-btn" onclick="showHistory()" >最近执行</button>
											<button type="reset" class="layui-btn layui-btn-primary">重置</button>
										</div>
									</div>

		<!-- <div class="layui-form-item layui-form-text">
			<label class="layui-form-label">普通文本域</label>
			<div class="layui-input-block">
				<textarea placeholder="请输入内容" class="layui-textarea"></textarea>
			</div>
		</div>
 		-->
 		
								</form>
							</div>
						</div>
					</div>

					<!-- IP分组Start -->
					<div class="layui-col-md6">
						<div class="layui-card">
							<div class="layui-card-header">IP分组结果</div>
							<div class="layui-card-body layui-text" id="ip_result" ></div>
						</div>
					</div>
					<!-- ip分组结束 -->
				</div>
			</div>


			<div class="layui-col-md4">
				<div class="layui-card">
					<div class="layui-card-header">命令分组结果</div>
					<div class="layui-card-body layui-text" id="cmd_result"></div>
				</div>
			</div>
		</div>
	</div>

	<div id="add_result"></div>
	
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
			$("#ip_result").html('分析进行中……');
			$("#cmd_result").html('分析进行中……');
			var ip = o.field.ip;
			var linenum = o.field.linenum;
			var port = o.field.port;
			var fields = [ "ip", "linenum", "port" ];//参数;
			var values = [ ip, linenum, port ]; //参数对应的值;
			var url = "${_currConText}/redis/postdata0.shtm"; //方法要执行的url路径;
			var data_val = postData(url, fields, values, 'add_result');
		}
		
		function sortIP() {
			var describe = '/bin/sh /opt/devops/cmd/ipgroup.sh';
			var fields = [ "describe","type" ];
			var values = [ describe,"ip" ];
			var url = "${_currConText}/redis/statistics.shtm";
			postData(url, fields, values, 'ip_result');
		}
		
		function sortCMD() {
			var describe = '/bin/sh /opt/devops/cmd/cmdgroup.sh';
			var fields = [ "describe" ,"type"];
			var values = [ describe ,"cmd"];
			var url = "${_currConText}/redis/statistics.shtm";
			postData(url, fields, values, 'cmd_result');
		}
		function showHistory(){
			sortIP();
			sortCMD();
		}
	</script>

</body>
</html>