/**
 * 到添加页面;
 * 
 * @param url,执行的方法路径;
 * @param div_id,数据显示在id为div_id的位置;
 * @author guiguketang
 */
function toAddData(url,div_id){
	if(url!=null && url.length>0 && div_id!=null){
		$.get(url,function(data){
			$("#" + div_id).html(data);
		});
	}else{
		alert("参数错误");
	}	
}

/**
 * 添加方法;
 * 
 * @param url,执行的方法路径;
 * @param fields,url接收的参数;
 * @param values,url接收的参数对应的值;
 * @author guiguketang
 */
function addData(url,fields,values,div_id,callback){
	if(fields.length==values.length){
		var s="({";
		for(i=0;i<fields.length;i++){
			if(i!=(fields.length-1)){
				s+=fields[i]+":'"+htmlCoder(fields[i],values[i])+"',";
			}else if(i==(fields.length-1)){
				s+=fields[i]+":'"+htmlCoder(fields[i],values[i])+"',async:'false'})";
			}
		}
		try{
			var p=eval(s);
		}catch(e){
			alert('出错了!'+e.message);
			return false;
		}
		$.post(url,p,function(data){	
			$("#" + div_id).html(data);
			eval(callback);			
		});
	}else if(fields.length!=values.length){
		alert("传入参数错误！");
	}
}

function addDataAsync(url,fields,values,div_id,callback){
	if(fields.length==values.length){
		var s="({";
		for(i=0;i<fields.length;i++){
			if(i!=(fields.length-1)){
				s+=fields[i]+":'"+htmlCoder(fields[i],values[i])+"',";
			}else if(i==(fields.length-1)){
				s+=fields[i]+":'"+htmlCoder(fields[i],values[i])+"',async:'false'})";
			}
		}
		try{
			var p=eval(s);
		}catch(e){
			alert('出错了!');
			return false;
		}
		$.ajax({url:url,type:"post",data:p,async:false,success:function(data){		
			$("#" + div_id).html(data);
			eval(callback);			
		}});
	}else if(fields.length!=values.length){
		alert("传入参数错误！");
	}
}


/**
 * 获取编辑页面数据;
 * 
 * @param url,执行的方法路径;
 * @param id,
 * @param div_id,数据显示在id为div_id的位置;
 * @param stmt,sql中声明操作的方法;
 * @param sqlMapId
 * @param result,返回的结果对象;
 * @author guiguketang
 */
function toEditData(url,id,div_id,stmt,sqlMapId,result){	
    $.get(url,{id:id,stmt:stmt,sqlMapId:sqlMapId,result:result},function(data){
    	$("#" + div_id).html(data);
	});
}
/**
 * 消息表获取编辑页面数据;
 * 
 * @param url,执行的方法路径;
 * @param messegeID,
 * @param div_id,数据显示在id为div_id的位置;
 * @param stmt,sql中声明操作的方法;
 * @param sqlMapId
 * @param result,返回的结果对象;
 * @author liqingzhou
 */
function toEditDataMy(url,id,div_id,stmt,sqlMapId,result){	
    $.get(url,{messegeID:id,stmt:stmt,sqlMapId:sqlMapId,result:result},function(data){
    	$("#" + div_id).html(data);
	});
}
/**
 * 编辑数据;
 * 
 * @param url,执行的方法路径;
 * @param fields,url接收的参数;
 * @param values,url接收的参数对应的值;
 * @author guiguketang
 */
function editData(url,fields,values,callback){
	
	if(fields.length==values.length){
		var s="({";
		for(i=0;i<fields.length;i++){
			if(i!=(fields.length-1)){
				s+=fields[i]+":'"+htmlCoder(fields[i],values[i])+"',";
			}else if(i==(fields.length-1)){
				s+=fields[i]+":'"+htmlCoder(fields[i],values[i])+"'})";
			}
		}
		var p=eval(s);
	    $.post(url,p,function(data){
	    	eval(callback);
		});
	}else if(fields.length!=values.length){
		alert("传入参数错误！");
	}
	
}
/**
 * 删除单条记录
 * 
 * @param url,执行的方法路径;
 * @param id,根据id删除记录;
 * @param stmt,sql中声明操作的方法;
 * @param sqlMapId
 * @author guiguketang
 */
function deleteData(url,id,stmt,sqlMapId){
    $.get(url,{id:id,stmt:stmt,sqlMapId:sqlMapId},function(data){
    });
}

/**
 * 消息表删除单条记录
 * 
 * @param url,执行的方法路径;
 * @param messegeID,根据id删除记录;
 * @param stmt,sql中声明操作的方法;
 * @param sqlMapId
 * @author liqingzhou
 */
function deleteDataMy(url,messegeID,stmt,sqlMapId){
    $.get(url,{messegeID:messegeID,stmt:stmt,sqlMapId:sqlMapId},function(data){
    });
}
/**
 * 列表;
 * 
 * @param url,执行的方法路径;
 * @param div_id,数据显示在id为div_id的位置;
 * @param fields,url接收的参数;
 * @param values,url接收的参数对应的值;
 * @param needload,是否需要加载背景层
 * @author guiguketang
 */
function listData(url,div_id,fields,values,callback,needload){
	if(fields.length==values.length){
		var s="({";
		for(i=0;i<fields.length;i++){
			if(i!=(fields.length-1)){
				s+=fields[i]+":'"+htmlCoder(fields[i],values[i])+"',";
			}else if(i==(fields.length-1)){
				s+=fields[i]+":'"+htmlCoder(fields[i],values[i])+"',async:'false'})";
			}
		}
		var p=eval(s);
		if(needload=="yes"){
			createBackGround(div_id);
		}
	    $.get(url,p,function(data){
	    	if(needload=="yes"){
	    		clearBackGround();
	    	}
	    	$("#" + div_id).html(data);
	    	eval(callback);		
	    });
    }else if(fields.length!=values.length){
		alert("传入参数错误！");
	}
}

//同步加载
function listDataAsync(url,div_id,fields,values){
	if(fields.length==values.length){
		var s="({";
		for(i=0;i<fields.length;i++){
			if(i!=(fields.length-1)){
				s+=fields[i]+":'"+htmlCoder(fields[i],values[i])+"',";
			}else if(i==(fields.length-1)){
				s+=fields[i]+":'"+htmlCoder(fields[i],values[i])+"'})";
			}
		}
		var p=eval(s);
	    $.ajax({
	    		url:url,
	    		data:p,
	    		async:false,
	    		success:function(data){
	    			$("#" + div_id).html(data);
	    		}
	    });
    }else if(fields.length!=values.length){
		alert("传入参数错误！");
	}
}

function listDataNoHtml(url,div_id,fields,values,callback){
	if(fields.length==values.length){
		var s="({";
		for(i=0;i<fields.length;i++){
			if(i!=(fields.length-1)){
			s+=fields[i]+":'"+values[i]+"',";
			}else if(i==(fields.length-1)){
				s+=fields[i]+":'"+values[i]+"',async:'false'})";
			}
		}
		var p=eval(s);
	    $.get(url,p,function(data){
	    	$("#" + div_id).html(data);
	    	eval(callback);		
	    });
    }else if(fields.length!=values.length){
		alert("传入参数错误！");
	}
}

function createBackGround(divID){
	var obj=$("#"+divID);
	if($("#divLock").length == 0){
		var clientW = obj.width();
		var clientH = 0;
		var p = obj.position();
		var clientT = p.top;
		var clientL = p.left;
		if($(".page").length==0){
			clientH = obj.height();
		}else{
			var pp = $(".page").position();
			var pclientT = pp.top;
			clientH = pclientT-clientT+50;
		}
		$("body").append("<div id='divLock'></div>");
		$("#divLock").css("height",clientH+"px");
		$("#divLock").css("width",clientW+"px");
		$("#divLock").css("display","block");
		$("#divLock").css("background-color","#000000");
		$("#divLock").css("position","absolute");
		$("#divLock").css("z-index",100);
		$("#divLock").css("top",clientT+"px");
		$("#divLock").css("left",clientL+"px");
		$("#divLock").css("opacity","0.5");
		waitImage("divLock");
	}
}

function waitImage(divID){
	var name="divLockWait";
	$("#"+divID).append("<div id='divLockWait'></div>");	//增加DIV
	$("#"+name).height("100%");
	$("#"+name).width("100%");
	$("#"+name).css("display","block");
	$("#"+name).css("position","absolute");
	$("#"+name).css("z-index",101);
	$("#"+name).css("top","0px");
	$("#"+name).css("left","0px");
	document.getElementById(name).style.background="no-repeat";
	document.getElementById(name).style.backgroundImage="url('/images/comm/icon/jindu.gif')";
	document.getElementById(name).style.backgroundPosition='center center';
}

function clearBackGround(){
	if($("#divLockWait").length != 0){
		$("#divLockWait").remove();
	}
	if($("#divLock").length != 0){
		$("#divLock").remove();
	}
}

/**
 * 隐藏div区域;
 * 
 * @param div_id
 */
function hiddenDiv(div_id)
{
	document.getElementById(div_id).innerHTML="";
}


function htmlCoder(fields, str) {
	var s = "";
	if (!isNaN(str) || str == undefined || fields.indexOf("_FCK") > -1) {
		if(fields.indexOf("_FCK") > -1){
			str=str.replace(/\r\n/g,"")  
	        str=str.replace(/\n/g,""); 
			for ( var i = 0; i < str.length; i++) {
				switch (str.substr(i, 1)) {
				case "\'":
					s += "&#39;";
					break;
				default:
					s += str.substr(i, 1);
					break;
				}
			}
		}else{
			s = str;
		}
		return s;	
	} else {
		if (str.length == 0)
			return "";
		for ( var i = 0; i < str.length; i++) {
			switch (str.substr(i, 1)) {
			case "<":
				s += "&lt;";
				break;
			case ">":
				s += "&gt;";
				break;
			case "&":
				s += "&amp;";
				break;
			case "\'":
				s += "&#39;";
				break;
			case "\"":
				s += "&quot;";
				break;
			case "\\":
				s += "&#92;";
				break;
			case "\r":
				s += "";
				break;
			case "\n":
				s += "<br>";
				break;
			default:
				s += str.substr(i, 1);
				break;
			}
		}
		s=s.replace(/\r\n/g,"<br/>")  
        s=s.replace(/\n/g,"<br/>"); 
		return s;
	}
} 

function getLength(str) {
    ///<summary>获得字符串实际长度，中文2，英文1</summary>
    ///<param name="str">要获得长度的字符串</param>
    var realLength = 0, len = str.length, charCode = -1;
    for (var i = 0; i < len; i++) {
        charCode = str.charCodeAt(i);
        if (charCode >= 0 && charCode <= 128) realLength += 1;
        else realLength += 2;
    }
    return realLength;
}