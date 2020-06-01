<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<!DOCTYPE html>
<html>




<head>
<meta charset="utf-8">
<title>Redis管理</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="${_currConText}${_jsURL }/layuiadmin/layui/css/layui.css" media="all">
<link rel="stylesheet" href="${_currConText}${_jsURL }/layuiadmin/style/admin.css" media="all">
<link id="layuicss-layer" rel="stylesheet" href="https://www.layui.com/admin/std/dist/layuiadmin/layui/css/modules/layer/default/layer.css?v=3.1.1" media="all">

</head>
<body>
	<div class="layui-fluid">
		<div class="layui-card">
			<div class="layui-form layui-card-header layuiadmin-card-header-auto">
				<div class="layui-form-item"></div>
			</div>


			<div class="layui-card-body">
				<div style="padding-bottom: 10px;">
					<button class="layui-btn layuiadmin-btn-admin" data-type="batchdel">删除</button>
					<button class="layui-btn layuiadmin-btn-admin" data-type="add">添加</button>
				</div>


				<div class="layui-form layui-border-box layui-table-view" lay-filter="LAY-table-2" lay-id="LAY-user-back-manage" style="">
					<div class="layui-table-box">
						<div class="layui-table-header">
							<table cellspacing="0" cellpadding="0" border="0" class="layui-table">
								<thead>
									<tr>
										<th data-field="0" data-key="2-0-0" data-unresize="true" class=" layui-table-col-special">
											<div class="layui-table-cell laytable-cell-2-0-0 laytable-cell-checkbox">
												<input type="checkbox" name="layTableCheckbox" lay-skin="primary" lay-filter="layTableAllChoose">
												<div class="layui-unselect layui-form-checkbox" lay-skin="primary">
													<i class="layui-icon layui-icon-ok"></i>
												</div>
											</div>
										</th>
										<th data-field="id" data-key="2-0-1" class=" layui-unselect">
											<div class="layui-table-cell laytable-cell-2-0-1">
												<span>ID</span> 
												<span class="layui-table-sort layui-inline">
												<i class="layui-edge layui-table-sort-asc" title="升序"></i> 
												<i class="layui-edge layui-table-sort-desc" title="降序"></i></span>
											</div>
										</th>
										<th data-field="loginname" data-key="2-0-2" class="">
											<div class="layui-table-cell laytable-cell-2-0-2">
												<span>IP</span>
											</div>
										</th>
										<th data-field="telphone" data-key="2-0-3" class=""><div class="layui-table-cell laytable-cell-2-0-3">
												<span>创建时间</span>
											</div></th>
	
										<th data-field="8" data-key="2-0-8" class=" layui-table-col-special">
										<div class="layui-table-cell laytable-cell-2-0-8" align="center">
												<span>操作</span>
											</div></th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="layui-table-body layui-table-main">
							<table cellspacing="0" cellpadding="0" border="0" class="layui-table">
								<tbody>
								
									<tr data-index="0" class="">
										<td data-field="0" data-key="2-0-0" class="layui-table-col-special"><div
												class="layui-table-cell laytable-cell-2-0-0 laytable-cell-checkbox">
												<input type="checkbox" name="layTableCheckbox" lay-skin="primary">
												<div class="layui-unselect layui-form-checkbox" lay-skin="primary">
													<i class="layui-icon layui-icon-ok"></i>
												</div>
											</div></td>
												
										<td data-field="id" data-key="2-0-1" class=""><div class="layui-table-cell laytable-cell-2-0-1">1001</div></td>
										<td data-field="loginname" data-key="2-0-2" class=""><div class="layui-table-cell laytable-cell-2-0-2">admin</div></td>
										<td data-field="telphone" data-key="2-0-3" class=""><div class="layui-table-cell laytable-cell-2-0-3">11111111111</div></td>
										
								
										<td data-field="8" data-key="2-0-8" align="center" data-off="true" class="layui-table-col-special"><div
												class="layui-table-cell laytable-cell-2-0-8">
												<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a> <a
													class="layui-btn layui-btn-disabled layui-btn-xs"><i class="layui-icon layui-icon-delete"></i>删除</a>
											</div></td>
									</tr>
									
									<tr data-index="1" class="">
										<td data-field="0" data-key="2-0-0" class="layui-table-col-special"><div
												class="layui-table-cell laytable-cell-2-0-0 laytable-cell-checkbox">
												<input type="checkbox" name="layTableCheckbox" lay-skin="primary">
												<div class="layui-unselect layui-form-checkbox" lay-skin="primary">
													<i class="layui-icon layui-icon-ok"></i>
												</div>
											</div></td>
										<td data-field="id" data-key="2-0-1" class=""><div class="layui-table-cell laytable-cell-2-0-1">1002</div></td>
										<td data-field="loginname" data-key="2-0-2" class=""><div class="layui-table-cell laytable-cell-2-0-2">common-1</div></td>
										<td data-field="telphone" data-key="2-0-3" class=""><div class="layui-table-cell laytable-cell-2-0-3">22222222222</div></td>
									
										<td data-field="8" data-key="2-0-8" align="center" data-off="true" class="layui-table-col-special"><div
												class="layui-table-cell laytable-cell-2-0-8">
												<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a> <a
													class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a>
											</div></td>
									</tr>
					
								</tbody>
							</table>
						</div>
						<div class="layui-table-fixed layui-table-fixed-l">
							<div class="layui-table-header">
								<table cellspacing="0" cellpadding="0" border="0" class="layui-table">
									<thead>
										<tr>
											<th data-field="0" data-key="2-0-0" data-unresize="true" class=" layui-table-col-special"><div
													class="layui-table-cell laytable-cell-2-0-0 laytable-cell-checkbox">
													<input type="checkbox" name="layTableCheckbox" lay-skin="primary" lay-filter="layTableAllChoose">
													<div class="layui-unselect layui-form-checkbox" lay-skin="primary">
														<i class="layui-icon layui-icon-ok"></i>
													</div>
												</div></th>
										</tr>
									</thead>
								</table>
							</div>
							<div class="layui-table-body" style="height: 344px;">
								<table cellspacing="0" cellpadding="0" border="0" class="layui-table">
									<tbody>
										<tr data-index="0" class="">
											<td data-field="0" data-key="2-0-0" class="layui-table-col-special"><div
													class="layui-table-cell laytable-cell-2-0-0 laytable-cell-checkbox">
													<input type="checkbox" name="layTableCheckbox" lay-skin="primary">
													<div class="layui-unselect layui-form-checkbox" lay-skin="primary">
														<i class="layui-icon layui-icon-ok"></i>
													</div>
												</div></td>
										</tr>
										<tr data-index="1" class="">
											<td data-field="0" data-key="2-0-0" class="layui-table-col-special"><div
													class="layui-table-cell laytable-cell-2-0-0 laytable-cell-checkbox">
													<input type="checkbox" name="layTableCheckbox" lay-skin="primary">
													<div class="layui-unselect layui-form-checkbox" lay-skin="primary">
														<i class="layui-icon layui-icon-ok"></i>
													</div>
												</div></td>
										</tr>
										<tr data-index="2" class="">
											<td data-field="0" data-key="2-0-0" class="layui-table-col-special"><div
													class="layui-table-cell laytable-cell-2-0-0 laytable-cell-checkbox">
													<input type="checkbox" name="layTableCheckbox" lay-skin="primary">
													<div class="layui-unselect layui-form-checkbox" lay-skin="primary">
														<i class="layui-icon layui-icon-ok"></i>
													</div>
												</div></td>
										</tr>
										
									</tbody>
								</table>
							</div>
						</div>
						<div class="layui-table-fixed layui-table-fixed-r layui-hide" style="right: -1px;">
							<div class="layui-table-header">
								<table cellspacing="0" cellpadding="0" border="0" class="layui-table">
									<thead>
										<tr>
											<th data-field="8" data-key="2-0-8" class=" layui-table-col-special"><div class="layui-table-cell laytable-cell-2-0-8" align="center">
													<span>操作</span>
												</div></th>
										</tr>
									</thead>
								</table>
								<div class="layui-table-mend"></div>
							</div>
							<div class="layui-table-body" style="height: 344px;">
								<table cellspacing="0" cellpadding="0" border="0" class="layui-table">
									<tbody>
										<tr data-index="0" class="">
											<td data-field="8" data-key="2-0-8" align="center" data-off="true" class="layui-table-col-special"><div
													class="layui-table-cell laytable-cell-2-0-8">
													<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a> <a
														class="layui-btn layui-btn-disabled layui-btn-xs"><i class="layui-icon layui-icon-delete"></i>删除</a>
												</div></td>
										</tr>
										<tr data-index="1" class="">
											<td data-field="8" data-key="2-0-8" align="center" data-off="true" class="layui-table-col-special"><div
													class="layui-table-cell laytable-cell-2-0-8">
													<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a> <a
														class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a>
												</div></td>
										</tr>
										<tr data-index="2" class="">
											<td data-field="8" data-key="2-0-8" align="center" data-off="true" class="layui-table-col-special"><div
													class="layui-table-cell laytable-cell-2-0-8">
													<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a> <a
														class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a>
												</div></td>
										</tr>
										
									
									</tbody>
								</table>
							</div>
						</div>
					</div>
							<style>
							.laytable-cell-2-0-0 {
								width: 48px;
							}
							
							.laytable-cell-2-0-1 {
								width: 80px;
							}
							
							.laytable-cell-2-0-2 {
								
							}
							
							.laytable-cell-2-0-3 {
								
							}
							
							.laytable-cell-2-0-4 {
								
							}
							
							.laytable-cell-2-0-5 {
								
							}
							
							.laytable-cell-2-0-6 {
								
							}
							
							.laytable-cell-2-0-7 {
								
							}
							
							.laytable-cell-2-0-8 {
								width: 150px;
							}
							</style>
				</div>





		<script type="text/html" id="table-useradmin-admin">
          <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
          {{#  if(d.role == '超级管理员'){ }}
            <a class="layui-btn layui-btn-disabled layui-btn-xs"><i class="layui-icon layui-icon-delete"></i>删除</a>
          {{#  } else { }}
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a>
          {{#  } }}
        </script>
			</div>

		</div>
	</div>

	<script src="${_currConText}${_jsURL }/layuiadmin/layui/layui.js"></script>
	<script>
		layui
				.config({
					base : '${_currConText}/js/layuiadmin/' //静态资源所在路径
				})
				.extend({
					index : 'lib/index' //主入口模块
				})
				.use(
						[ 'index', 'useradmin', 'table' ],
						function() {
							var $ = layui.$, form = layui.form, table = layui.table;

							//监听搜索
							form.on('submit(LAY-user-back-search)', function(
									data) {
								var field = data.field;

								//执行重载
						/* 		table.reload('LAY-user-back-manage', {
									where : field
								}); */
							});

							//事件
							var active = {
								batchdel : function() {
									var checkStatus = table
											.checkStatus('LAY-user-back-manage'), checkData = checkStatus.data; //得到选中的数据

									if (checkData.length === 0) {
										return layer.msg('请选择数据');
									}

									layer
											.prompt(
													{
														formType : 1,
														title : '敏感操作，请验证口令'
													},
													function(value, index) {
														layer.close(index);

														layer
																.confirm(
																		'确定删除吗？',
																		function(
																				index) {

																			//执行 Ajax 后重载
																			/*
																			admin.req({
																			  url: 'xxx'
																			  //,……
																			});
																			 */
																			//table.reload('LAY-user-back-manage');
																			layer.msg('已删除');
																		});
													});
								},
								add : function() {
									layer
											.open({
												type : 2,
												title : '添加管理员',
												content : 'adminform.shtm',
												area : [ '420px', '420px' ],
												btn : [ '确定', '取消' ],
												yes : function(index, layero) {
													var iframeWindow = window['layui-layer-iframe'
															+ index], submitID = 'LAY-user-back-submit', submit = layero
															.find('iframe')
															.contents()
															.find(
																	'#'
																			+ submitID);

													//监听提交
													iframeWindow.layui.form
															.on(
																	'submit('
																			+ submitID
																			+ ')',
																	function(
																			data) {
																		var field = data.field; //获取提交的字段

																		//提交 Ajax 成功后，静态更新表格中的数据
																		//$.ajax({});
																		//table.reload('LAY-user-front-submit'); //数据刷新
																		layer.close(index); //关闭弹层
																	});

													submit.trigger('click');
												}
											});
								}
							}
							$('.layui-btn.layuiadmin-btn-admin').on(
									'click',
									function() {
										var type = $(this).data('type');
										active[type] ? active[type].call(this)
												: '';
									});
						});
	</script>
</body>
</html>

