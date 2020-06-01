//---------------------------------------------------------------------------------------


//初始化文档
//$(document).ready();

//----------------------------------------------弹出DIV仿模态窗口开始----------------------------------------------
var divW;	//DIV宽度
var divH;	//DIV高度
var clientH;	//浏览器高度
var clientW;	//浏览器宽度
var divTitle;	//DIV标题
var pageUrl;	//DIV中加载的页面
var divTop;	//DIV纵坐标
var divLeft;	//DIV横坐标
var zIndex=100;
var zIndexWait=200;
var divIsmove;

//ismove是否可移动div块
function DivWindowOpen(count,divWidth,divHeight,top,left,title,url,needReflush,ismove){
	divW = divWidth;	//DIV宽度
	divH = divHeight;	//DIV高度
	divTitle = title;	//DIV高度
	divIsmove = ismove;
	divTop=top;
	divLeft=left;
	pageUrl = url+"&count="+count;	//DIV中加载的页面URL
	lockScreen();	//锁定背景
	divOpen(count);
}

//返回弹出的DIV的坐标
function divOpen(count){
	var minTop = 80;	//弹出的DIV记顶部的最小距离
	clientH = $(window).height();	//浏览器高度
	clientW = $(window).width();	//浏览器宽度
	if(divLeft==0){
		divLeft = (clientW - divW)/2;	//DIV横坐标
	}
	//divLeft += window.document.documentElement.scrollLeft;	//DIV显示的实际横坐标
	//判断是否存在要生成的div，如果有先删除该div
	if($("#divWindow"+count).length>0){
		clearDivWindow(count);
	}
	$("body").append("<div id='divWindow"+count+"' class='divWindow'><div id='divTitle"+count+"'></div><div id='divContent"+count+"'>载入中...</div>");	//增加DIV
	if(divIsmove!="no"){
		$("#divWindow"+count).draggable({
			
		});
	}
	zIndex=zIndex+1;
	//divWindow的样式
	$("#divWindow"+count).css("position","absolute");
	$("#divWindow"+count).css("overflow-y","auto");
	$("#divWindow"+count).css("z-index",zIndex);
	$("#divWindow"+count).css("left",(divLeft + "px"));	//定位DIV的横坐标
	$("#divWindow"+count).css("top",(divTop + "px"));	//定位DIV的纵坐标
	$("#divWindow"+count).css("opacity","0.9");
	$("#divWindow"+count).width(divW);
	$("#divWindow"+count).height(divH);
	$("#divWindow"+count).css("background-color","#FFFFFF");
	$("#divWindow"+count).css("border","solid 1px #333333");
	//divTitle的样式
	$("#divTitle"+count).css("height","20px");
	$("#divTitle"+count).css("line-height","20px");
	$("#divTitle"+count).css("background-color","#add1ff");
	$("#divTitle"+count).css("padding","3px 5px 1px 5px");
	$("#divTitle"+count).css("color","#FFFFFF");
	$("#divTitle"+count).css("font-weight","bold");
	//divContent的样式
	$("#divContent"+count).css("padding","20px");
	$("#divTitle"+count).append(divTitle);
	$("#divContent"+count).load(pageUrl);
}

//锁定背景屏幕
function lockScreen(){
	if($("#divLock").length == 0){	//判断DIV是否存在
		clientH = window.document.documentElement.scrollHeight;	//浏览器高度
		clientW = window.document.documentElement.scrollWidth;	//浏览器宽度
		$("body").append("<div id='divLock'></div>")	//增加DIV
		$("#divLock").height(clientH);
		$("#divLock").width(clientW);
		$("#divLock").css("display","block");
		$("#divLock").css("background-color","#000000");
		$("#divLock").css("position","absolute");
		$("#divLock").css("z-index",zIndex);
		$("#divLock").css("top","0px");
		$("#divLock").css("left","0px");
		$("#divLock").css("opacity","0.5");
	}
}

//清除DIV窗口
function clearDivWindow(count,needReflush){
	$("#divWindow"+count).remove();
	var objs=$(".divWindow");
	if(objs.length==0){
		clearLockScreen(needReflush);
	}
}

//清除背景锁定
function clearLockScreen(needReflush){
	$("#divLock").remove();
	if(needReflush=="yes"){
		window.location.reload();
	}
}