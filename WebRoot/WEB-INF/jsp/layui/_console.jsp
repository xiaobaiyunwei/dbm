<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>layuiAdmin 控制台主页一</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="${_currConText}${_jsURL }/layuiadmin/layui/css/layui.css" media="all">
<link rel="stylesheet" href="${_currConText}${_jsURL }/layuiadmin/style/admin.css" media="all">
</head>
<body>

	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">

			<div class="layui-col-md8">
				<div class="layui-row layui-col-space15">
					<div class="layui-col-md6">
						<div class="layui-card">
							<div class="layui-card-header">快捷方式</div>
							<div class="layui-card-body">This search form.</div>
						</div>
					</div>


					<!-- IP分组Start -->
					<div class="layui-col-md6">
						<div class="layui-card">
							<div class="layui-card-header">IP分组结果</div>
							<div class="layui-card-body">This data is grouped by IP.</div>
						</div>
					</div>
					<!-- ip分组结束 -->
				</div>
			</div>

			<div class="layui-col-md4">
				<div class="layui-card">
					<div class="layui-card-header">命令分组结果</div>
					<div class="layui-card-body layui-text">This data is grouped by CMD.
					This data is grouped by CMD.
					This data is grouped by CMD.
					This data is grouped by CMD.
					This data is grouped by CMD.
					This data is grouped by CMD.
					This data is grouped by CMD.
					This data is grouped by CMD.
					This data is grouped by CMD.
					This data is grouped by CMD.
					This data is grouped by CMD.
					This data is grouped by CMD.
					This data is grouped by CMD.
					This data is grouped by CMD.
					This data is grouped by CMD.										
					</div>
				</div>
			</div>


				


		</div>
	</div>

	<script src="${_currConText}${_jsURL }/layuiadmin/layui/layui.js"></script>
	<script>
		layui.config({
			base : '${_currConText}/js/layuiadmin/' //静态资源所在路径
		}).extend({
			index : 'lib/index' //主入口模块
		}).use([ 'index', 'console' ]);
	</script>
</body>
</html>