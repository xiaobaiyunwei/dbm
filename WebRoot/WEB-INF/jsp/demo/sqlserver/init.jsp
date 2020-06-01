<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<head>
<link rel="stylesheet" type="text/css" media="screen" href="${_currConText}${_cssURL}/jquery/screen.css" />
<script src="${_currConText}${_jsURL}/jquery/jquery.min.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL}/jquery/jquery.validate.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL}/jquery/jquery.metadata.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL}/jquery/messages_cn.js" type="text/javascript"></script>
<script src="${_currConText}${_jsURL}/common/dataope.js" type="text/javascript"></script>
<link id="skin" rel="stylesheet" href="${_currConText}${_cssURL}/BoxSkins/Blue/jbox.css" />
    <script type="text/javascript" src="${_currConText}${_jsURL}/jquery/jquery.jBox-2.3.min.js"></script>
    <script type="text/javascript" src="${_currConText}${_jsURL}/jquery/jquery.jBox-zh-CN.js"></script>
    <!--demo测试代码-->
    <script type="text/javascript" src="${_currConText}/jbox-demo-depends/demo.js"></script>
    <!--demo代码高亮-->
    <script type="text/javascript" src="${_currConText}/jbox-demo-depends/highlight/highlight.pack.js"></script>
    <script type="text/javascript" src="${_currConText}/jbox-demo-depends/highlight/languages/javascript.js"></script>
    <link rel="stylesheet" type="text/css" href="${_currConText}/jbox-demo-depends/highlight/styles/magula.css" />
    
<title>demo首页-111111前台</title>
</head>
<body>
<c:if test="${param==null || param.db==null}">
<cdelUtil:stopPage/>
</c:if>
<input type="button" name="demoList" id="demoList" value="demoList" onClick="demoList('1')">	
<input type="button"  value="addDemo" onClick="toAddDemo()">
总数：<Sql:sqlSession.selectOne sqlMapId="demo_${param.db }" stmt="ns.sns.demo.getSnsDemoListCount" var="countNum_"></Sql:sqlSession.selectOne>
		${countNum_}	
<table align="center">
<tbody align="center" id="bodycontent">
</tbody>
</table>				
<input type='hidden' id='pageNum'/>	
<div id="demo_list" >
</div>	
<form action="" class="cmxform" name="add_form"  id="add_form" method="post">
<div id="demo_add"></div>
<div id="add_result" style="position:absolute;top:100;left:100;z-index:100;color:green;"> 

</div>		
</form>
<div id="demo_edit"></div>
</body>
<script type="text/javascript">

<!--jquery validate start-->
/**
 * 加载验证的form;
 */
$().ready(function() {
	$.metadata.setType("attr", "validate");
	$('#add_form').validate();	
	demoList(1);
});
/**
 * 验证成功后执行addDemo方法;
 */
$.validator.setDefaults({
	submitHandler: function() {
		//submitFunc();
		addDemo();
	}
});
<!--jquery validate end-->
function submitFunc(){
	alert($("#subType").val());
}
//add demo before;
function toAddDemo()
{
	var url='${_currConText}/demo/${param.db}/toadd.shtm';//方法要执行的url路径;
	var div_id='demo_add';//执行请求后返回的内容显示在id为demo_add位置处;
	toAddData(url,div_id);
}

function fresh()
{
	pageno=$("#pageNum").val(); 
	demoList(pageno);	
}
//add demo; 
function addDemo()
{
	var name=$('#name').val();
	var age=$('#age').val();
	var phone=$('#phone').val();
	var describe=$('#describe').val();
	var stmt="ns.sns.demo.insertSnsDemo";	//sql中声明操作的方法;
	var sqlMapId="demo_${param.db}";					//sqlMapConfig id;
	var fields=["name","age","phone","describe","stmt","sqlMapId"];//参数;
	var values=[name,age,phone,describe,stmt,sqlMapId];	//参数对应的值;
	var url="${_currConText}/demo/${param.db}/add.shtm"; //方法要执行的url路径;
	var data_val = addData(url,fields,values,'add_result',"fresh()");
	hiddenDiv("demo_add");
	
	//$.jBox('id:add_result', { bottomText: '添加成功！' });
	
}
 
//弹出编辑对话框,可以公用;
function toEditDemo(id){
	var url='${_currConText}/demo/${param.db}/toedit.shtm';//方法要执行的url路径;
    var div_id='demo_edit';				 //请求后返回的内容显示在id为demo_edit位置处;
    var stmt="ns.sns.demo.getSnsDemo";	 //sql中声明操作的方法;
    var sqlMapId="demo_${param.db}";						
    var result="SnsDemo";				//返回的结果对象;
	toEditData(url,id,div_id,stmt,sqlMapId,result);
}

//编辑操作！
function editd(){
	var id=$('#id').val();
	var name=$('#name').val();
	var age=$('#age').val();
	var phone=$('#phone').val();
	var stmt="ns.sns.demo.updateSnsDemo";//sql中声明操作的方法;
	var sqlMapId="demo_${param.db}";
	var fields=["id","name","age","phone","stmt","sqlMapId"];	//参数
	var values=[id,name,age,phone,stmt,sqlMapId];				//参数对应的值;
	var url="${_currConText}/demo/${param.db}/edit.shtm";		//方法要执行的url路径;
	editData(url,fields,values,'fresh()');						//编辑后，刷新当前页;
	hiddenDiv('demo_edit');
}

//删除，可以公用;
function deleteDemo(id){
	var url="${_currConText}/demo/${param.db}/delete.shtm";		//方法要执行的url路径;
	var stmt="ns.sns.demo.deleteSnsDemo";						//sql中声明操作的方法;
	var sqlMapId="demo_${param.db}";
	deleteData(url,id,stmt,sqlMapId);
	pageno=$("#pageNum").val(); 
	demoList(pageno); 											//删除后，刷新当前页;
}	

//demoList;
function demoList(currPage){	
	$("#pageNum").val(currPage);								//赋值当前页;
	var url="${_currConText}/demo/${param.db}/list.shtm";					//方法要执行的url路径;
	var div_id="demo_list";										//请求后返回的内容显示在id为demo_list位置处;
	var pageSize=5;												//分页，每页显示条数;如果显示全部记录，pageSize=-1;
	var stmtCount="ns.sns.demo.getSnsDemoListCount";			//sql中声明操作的方法;
	var stmt="ns.sns.demo.getSnsDemoList";						//sql中声明操作的方法;
	var sqlMapId="demo_${param.db}";							
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