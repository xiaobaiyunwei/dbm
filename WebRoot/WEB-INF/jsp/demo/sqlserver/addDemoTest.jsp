<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<head>
<link rel="stylesheet" type="text/css" media="screen" href="${_currConText}${_cssURL}/jquery/screen.css" />
<script src="${_currConText}${_jsURL}/jquery/jquery.min.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL}/jquery/jquery.validate.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL}/jquery/jquery.metadata.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL}/jquery/messages_cn.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL}/dataope.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL}/jquery/jquery.form.js" type="text/javascript"></script>

<title>demo首页</title>
</head>
<body>
<input type="button" name="demoList" id="demoList" value="demoList" onClick="demoList('1')">	
<input type="button" value="addDemo" onClick="toAddDemo()">	
<table align="center">
<tbody align="center" id="bodycontent">
</tbody>
</table>				
<input type='hidden' id='pageNum'/>	
<div id="demo_list"></div>	
<form action="" class="cmxform" name="add_form" id="add_form" method="post">
<div id="demo_add" style="display: none;">
	<table width="700" align="center" cellpadding="0" cellspacing="0" style="margin-top: 3px;" class="tikumore" >
		<tr>
					<td style="font-size: 12px; padding: 5px;">				
					名字
					</td>
					<td style="font-size: 12px; padding: 5px;">				
						<input type='text' id="name" name="name" validate="required:true,maxlength:10"	value="">	
					</td>
		</tr>
		<tr>
					<td style="font-size: 12px; padding: 5px;">				
					年龄
					</td>
					<td style="font-size: 12px; padding: 5px;">				
					<input type='text' id="age" name="age" validate="required:true,number:true,maxlength:3"	value="">	
					</td>
		</tr>
		<tr>
					<td style="font-size: 12px; padding: 5px;">				
					手机号
					</td>
					<td style="font-size: 12px; padding: 5px;">				
					<input type='text' id="phone" name="phone" validate="phone:true,required:true"	value="">	
					</td>
		</tr>
		<tr >
					<td  colspan="2" >		
					<input  type="hidden" id="stmt" name="stmt" value="ns.sns.demo.insertSnsDemo" />&nbsp;&nbsp;&nbsp;&nbsp;		
					<input  type="hidden" id="sqlMapId" name="sqlMapId" value="demo" />&nbsp;&nbsp;&nbsp;&nbsp;
					<input  type="submit" value="提交" />&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
		</tr>
	</table>	
	</div>	
</form>
</body>
<script type="text/javascript">
<!--jquery validate start-->
/**
 * 加载验证的form;
 */
$().ready(function() {
	$.metadata.setType("attr", "validate");
	$('#add_form').validate();	
});
/**
 * 验证成功后执行addDemo方法;
 */
$.validator.setDefaults({
	submitHandler: function() {
		addBut();
	}
});

<!--jquery validate end-->
//add demo before;
function toAddDemo()
{
	var url='${_currConText}/demo/toadd.shtm';//方法要执行的url路径;
	var div_id='demo_add';//执行请求后返回的内容显示在id为demo_add位置处;
	// toAddData(url,div_id);
    $("#demo_add").css("display","");
}
/**
 * add demo;
 * 
 */
function addDemo()
{
	var name=$('#name').val();
	var age=$('#age').val();
	var phone=$('#phone').val();
	var stmt="ns.sns.demo.insertSnsDemo";	//sql中声明操作的方法;
	var sqlMapId="demo";					//sqlMapConfig id;
	var fields=["name","age","phone","stmt","sqlMapId"];//参数;
	var values=[name,age,phone,stmt,sqlMapId];	//参数对应的值;
	var url="${_currConText}/demo/add.shtm"; //方法要执行的url路径;
	addData(url,fields,values);	
	pageno=$("#pageNum").val(); 
	demoList(pageno);
	document.getElementById('demo_add').innerHTML="";	

}

function addBut(){
	var url="${_currConText}/demo/add.shtm"; 
	$('#add_form').attr("action",url);
	 var options = { 
        success:       showResponse,  // post-submit callback 
        clearForm: true
    }; 
    $("#add_form").ajaxSubmit(options); 
    return false; 
   
}
 
// pre-submit callback 
function showRequest(formData, jqForm, options) { 
    var queryString = $.param(formData); 
    return true; 
} 

// post-submit callback 
function showResponse(responseText, statusText, xhr, $form)  {
	$("#demo_add").css("display","none");
	pageno=$("#pageNum").val(); 
	demoList(pageno);
}

//弹出编辑对话框,可以公用;
function toEditDemo(id){
	var url='${_currConText}/demo/toedit.shtm';//方法要执行的url路径;
    var div_id='demo_edit';				 //请求后返回的内容显示在id为demo_edit位置处;
    var stmt="ns.sns.demo.getSnsDemo";	 //sql中声明操作的方法;
    var sqlMapId="demo";						
    var result="SnsDemo";				//返回的结果对象;
	toEditData(url,id,div_id,stmt,sqlMapId,result);
}
/**
 * ok,编辑操作！
 */
function editd(){
	var id=$('#id').val();
	var name=$('#name').val();
	var age=$('#age').val();
	var phone=$('#phone').val();
	var stmt="ns.sns.demo.updateSnsDemo";//sql中声明操作的方法;
	var sqlMapId="demo";
	var fields=["id","name","age","phone","stmt","sqlMapId"];	//参数
	var values=[id,name,age,phone,stmt,sqlMapId];				//参数对应的值;
	var url="${_currConText}/demo/edit.shtm";					//方法要执行的url路径;
	editData(url,fields,values);
	pageno=$("#pageNum").val(); 
	demoList(pageno);											//编辑后，刷新当前页;
	document.getElementById('demo_edit').innerHTML='';			//隐藏编辑框;
}
//删除，可以公用;
function deleteDemo(id){
	var url="${_currConText}/demo/delete.shtm";					//方法要执行的url路径;
	var stmt="ns.sns.demo.deleteSnsDemo";						//sql中声明操作的方法;
	var sqlMapId="demo";
	deleteData(url,id,stmt,sqlMapId);
	pageno=$("#pageNum").val(); 
	demoList(pageno); 											//删除后，刷新当前页;
}	
//demoList;
function demoList(currPage){
	$("#pageNum").val(currPage);								//赋值当前页;
	var url="${_currConText}/demo/list.shtm";					//方法要执行的url路径;
	var div_id="demo_list";										//请求后返回的内容显示在id为demo_list位置处;
	var pageSize=3;												//分页，每页显示条数;如果显示全部记录，pageSize=-1;
																//请参照ns.sns.demo.getSnsDemoList的sql写法;
	var stmtCount="ns.sns.demo.getSnsDemoListCount";			//sql中声明操作的方法;
	var stmt="ns.sns.demo.getSnsDemoList";						//sql中声明操作的方法;
	var sqlMapId="demo";										
	var listResult="demoList";									//返回的结果对象;
	var fields=["currPage","pageSize","stmtCount","stmt","sqlMapId","listResult"];//参数;
	var values=[currPage,pageSize,stmtCount,stmt,sqlMapId,listResult];	//参数对应的值;
	listData(url,div_id,fields,values);
}
//分页跳转；
function goPage(pageNum){//分页用的函数
	demoList(pageNum);
}
</script>