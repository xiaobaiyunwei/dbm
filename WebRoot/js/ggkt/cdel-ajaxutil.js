function genPageTagByNoData(returnNum) {
    var str = "共0项 每页" + returnNum + "项 [首页] [上一页] [下一页] [末页] 共0页 第0页"; 
    return str;
}

function genPageTag(totalNum, pageNo, returnNum) {
	var totalNum = parseInt(totalNum);
	var pageNo = parseInt(pageNo);
	var returnNum = parseInt(returnNum);
	var totalPage = Math.floor((totalNum + returnNum - 1) / returnNum);
	
    var str = "共" + totalNum + "项 每页" +returnNum + "项";
    if (pageNo > 1) {
        str = str + " <a href='#' onclick=\"searchData('1','goPage');return false;\">[首页]</a> <a href='#' onclick=\"searchData('" + (pageNo - 1) + "','goPage');return false;\">[上一页]</a>";
    } else {
        str = str + " [首页] [上一页]";
    }
    if (pageNo < totalPage) {
        str = str + " <a href='#' onclick=\"searchData('" + (pageNo + 1 ) + "','goPage');return false;\">[下一页]</a> <a href='#' onclick=\"searchData('"+totalPage+"','goPage');return false;\">[末页]</a>"
    } else {
        str = str + " [下一页] [末页]"
    }
    str = str + " 共" + totalPage + "页 第" + pageNo + "页";
    if (totalPage > 1) {
        str = str + " <input  style='width:30px' onkeydown=\"if (event.keyCode == 13) if (/^[0-9]+$/.test(this.value) && this.value > 0 && this.value <="+totalPage+" ){searchData(this.value,'goPage'); return false;} else { alert('页码输入错误!');this.value=''; return false;}\">";
    } 
    return str;
}

function genStrDate(data){
	if(data == null){
		return "";
	}else{
		var c = new Date(); 
		c.setTime(data.time);
		var mon = c.getMonth()+1;
		if(mon<10){
			mon = "0" + mon;
		}
		var dat = c.getDate();
		if(dat<10){
			dat = "0" + dat;
		}
		return c.getYear()+"-"+mon+"-"+dat;
	}
}

function genStrDateTime(data){
	if(data == null){
		return "";
	}else{
		var c = new Date(); 
		c.setTime(data.time);
		var mon = c.getMonth()+1;
		if(mon<10){
			mon = "0" + mon;
		}
		var dat = c.getDate();
		if(dat<10){
			dat = "0" + dat;
		}
		var h = c.getHours();
		if(h<10){
			h= "0"+h;
		}
		var m = c.getMinutes();
		if(m<10){
			m= "0"+m;
		}
		return c.getYear()+"-"+mon+"-"+dat+" "+h+":"+m;
	}
}

function genDateSpace(data){  //距离今天的间隔天数
	if(data == null){
		return "－";
	}else{
		var c = new Date();
		c.setTime(data.time);
		var cn = new Date();
		if(cn<c){
			return 0;
		}else{
			return Math.floor((cn-c)/(24*60*60*1000));
		}
	}
}

function regValid(o,regStr,mo,m){
	if ( !( regStr.test( o.val() ) ) ) {
		o.addClass('ui-state-error');
		updateAddTips(mo,m);
		return false;
	} else {
		o.removeClass('ui-state-error');
		updateAddTips(mo,"");
		return true;
	}
}

function selfValid(o,boo,mo,m){
	if ( !boo ) {
		o.addClass('ui-state-error');
		updateAddTips(mo,m);
		return false;
	} else {
		o.removeClass('ui-state-error');
		updateAddTips(mo,"");
		return true;
	}
}

function updateAddTips(mo,t) {
	mo.text(t).effect("highlight",{},1500);
}

function mouseCoords(ev){
   if(ev.pageX || ev.pageY){
       return {x:ev.pageX, y:ev.pageY};     
   }     
   return { x:ev.clientX + document.body.scrollLeft - document.body.clientLeft, y:ev.clientY + document.body.scrollTop  - document.body.clientTop }; 
}

String.prototype.trim = function(){   
    return this.replace(/(^\s*)|(\s*$)/g, "");   
}  

function closeWin(){
	window.opener = null;
	window.open("","_self");
	window.close();
}

function genPageTag_1(totalNum, pageNo, returnNum){
	var totalNum = parseInt(totalNum);
	var pageNo = parseInt(pageNo);
	var returnNum = parseInt(returnNum);
	var totalPage = Math.floor((totalNum + returnNum - 1) / returnNum);
	
	var str = "共" + totalNum + "项 每页" +returnNum + "项";
    if (pageNo > 1) {
        str = str + " <a href='#' onclick=\"searchData('1','goPage');return false;\">[首页]</a> <a href='#' onclick=\"searchData('" + (pageNo - 1) + "','goPage');return false;\">[上一页]</a>";
    } else {
        str = str + " [首页] [上一页]";
    }
    if(totalPage <= 10){
		for(var i=1; i<=totalPage;i++){
			if(i != pageNo){
				str = str + " <a href='#' onclick=\"searchData('"+i+"','goPage');return false;\">"+i+"</a>";
			}else{
				str = str + " "+i;
			} 
		}
	}else{
		var maxPage;
		switch (pageNo){
			case 1 : maxPage=9;	break;
			case 2 : maxPage=8;	break;
			case 3 : maxPage=7;	break;
			case 4 : maxPage=6;	break;
			default : maxPage=5;break;
		}
		if(maxPage + pageNo > totalPage){
			maxPage = totalPage;
		}else{
			maxPage = maxPage + pageNo;	
		}
		var minPage;
		switch (pageNo){
			case 1 : minPage=1;	break;
			case 2 : minPage=1;	break;
			case 3 : minPage=1;	break;
			case 4 : minPage=1;	break;
			case 5 : minPage=1;	break;
			default : minPage = pageNo-5; break;
		}
		for(var i = minPage; i <= maxPage;i++){
			if(i != pageNo){
				str = str + " <a href='#' onclick=\"searchData('"+i+"','goPage');return false;\">"+i+"</a>";
			}else{
				str = str + " "+i;
			} 
		}
	}
    if (pageNo < totalPage) {
        str = str + " <a href='#' onclick=\"searchData('" + (pageNo + 1 ) + "','goPage');return false;\">[下一页]</a> <a href='#' onclick=\"searchData('"+totalPage+"','goPage');return false;\">[末页]</a>"
    } else {
        str = str + " [下一页] [末页]"
    }
    str = str + " 共" + totalPage + "页 第" + pageNo + "页";
    if (totalPage > 1) { 
        str = str + " <input  style='width:30px' onkeydown=\"if (event.keyCode == 13) if (/^[0-9]+$/.test(this.value) && this.value > 0 && this.value <="+totalPage+" ){searchData(this.value,'goPage'); return false;} else { alert('页码输入错误!');this.value=''; return false;}\">";
    } 
    return str;
}