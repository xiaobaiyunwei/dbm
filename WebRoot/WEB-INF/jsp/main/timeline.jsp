<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>时间线</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="${_currConText}${_jsURL }/layuiadmin/layui/css/layui.css" media="all">
<link rel="stylesheet" href="${_currConText}${_jsURL }/layuiadmin/style/admin.css" media="all">
</head>
<body>

	<style>
/* 这段样式只是用于演示 */
#LAY-component-timeline .layui-card-body {
	padding: 15px;
}
</style>

	<div class="layui-fluid" id="LAY-component-timeline">
		<div class="layui-row layui-col-space15">

			<div class="layui-col-md12">
				<div class="layui-card">
					<div class="layui-card-header">时间线</div>
					<div class="layui-card-body">

						<ul class="layui-timeline">
							<li class="layui-timeline-item"><i class="layui-icon layui-timeline-axis"></i>
								<div class="layui-timeline-content layui-text">
									<div class="layui-timeline-title">
										2020年12月25日，完成Redis大Key离线分析功能，生产环境发布上线（圣诞节）；
									</div>
								</div>
							</li>
							<li class="layui-timeline-item"><i class="layui-icon layui-timeline-axis"></i>
								<div class="layui-timeline-content layui-text">
									<div class="layui-timeline-title">
										2020年12月15日，项目再次启动，并于12月23日完成Redis大Key实时分析功能；
									</div>
								</div>
							</li>
							<li class="layui-timeline-item"><i class="layui-icon layui-timeline-axis"></i>
								<div class="layui-timeline-content layui-text">
									<div class="layui-timeline-title">2020年06月17日，生产环境发布上线（618活动前夕）；
										转做其他项目，此项目搁置；
									</div>
								</div>
							</li>
						
							<li class="layui-timeline-item"><i class="layui-icon layui-timeline-axis"></i>
								<div class="layui-timeline-content layui-text">
									<div class="layui-timeline-title">2020年05月29日，增加redis维护版块；
									<a lay-href="set/init.shtm">查看redis维护</a>
									</div>
								</div>
							</li>
						
							<li class="layui-timeline-item"><i class="layui-icon layui-timeline-axis"></i>
								<div class="layui-timeline-content layui-text">
									<div class="layui-timeline-title">2020年05月27日，增加mysql下CRUD开发，增加前端UI框架JBOX；
									<a lay-href="demo/mysql/init.shtm">查看CRUD demo</a>
									</div>
								</div></li>
				
							<li class="layui-timeline-item"><i class="layui-icon layui-timeline-axis"></i>
								<div class="layui-timeline-content layui-text">
									<div class="layui-timeline-title">2020年05月26日，完成Redis热Key分析模块功能，达到预发布状态；
									<a lay-href="redis/init.shtm">Redis热Key分析</a>
									</div>
								</div></li>
							<li class="layui-timeline-item"><i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop layui-timeline-axis"></i>
								<div class="layui-timeline-content layui-text">
									<div class="layui-timeline-title">更久前，在Jodd、Falcon、Archery、DataX等开源Project中寻找灵感……</div>
								</div></li>
						</ul>
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
		}).use([ 'index' ]);
	</script>
</body>
</html>