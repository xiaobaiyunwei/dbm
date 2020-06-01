<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<script src="${_currConText}${_jsURL }/jquery/jquery.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL }/jquery/jquery.validate.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL }/jquery/jquery.metadata.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL }/jquery/messages_cn.js" type="text/javascript"></script>
<link rel="stylesheet" href="${_currConText}${_jsURL }/layuiadmin/layui/css/layui.css" media="all">
<form id="add_form" name="add_form" method="post">	
                  <label class="layui-form-label">IP地址：</label>
                  <div class="layui-input-block">
                    <input type="text" id="ip"  name="ip" class="layui-input" validate="required:true,maxlength:20,isip:true"/>
                  </div>
         	              
             
                <div class="layui-input-block">
                  <button class="layui-btn" lay-submit="" lay-filter="component-form-element">立即提交</button>
                  <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>

 <!--    <div class="layui-form-item">
      <label class="layui-form-label">IP</label>
      <div class="layui-input-inline">
        <input type="text" name="ip" id="ip" validate="required:true,maxlength:20">
      </div>
    </div> -->

<!--     <div class="layui-form-item">
      <label class="layui-form-label">邮箱</label>
      <div class="layui-input-inline">
        <input type="text" name="email" lay-verify="email" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
      </div>
    </div> -->
 
   
   
 
</form>
<input type='hidden' id='pageNum' value='${param.pageno}' />
  <script src="${_currConText}${_jsURL }/layuiadmin/layui/layui.js"></script>
  <script>
  $().ready(function() {
		$.metadata.setType("attr", "validate");
		$('#add_form').validate();
	});
	
	$.validator.setDefaults({
		submitHandler : function() {
			addDemo();
		}
	});

	//addDemo()
	function addDemo() {
		var ip = $('#ip').val();
		$.get("${_currConText}/set/add.shtm", {
			ip : ip
		}, function(data) {	
			window.parent.$.jBox.close();
			window.parent.$.jBox.tip("添加成功！",'info');
			pageno = $("#pageNum").val();
			window.parent.dataList(pageno);
			window.parent.jQuery("#closeWin").click();	
		});
	}
  </script>