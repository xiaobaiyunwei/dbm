<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>    

<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" type="text/css" href="${_webSite}${_currConText }${_cssURL}/style_new1.css" />
<script type="text/javascript" src="${_webSite}${_currConText}${_jsURL}/xheditor.js"></script>
	<body>
	<!-- 类型选择弹出层 -->
    <div id="jumpDiv"></div>	
	<%-- 头部--%>
	<div id="content_warp">
		<div class="c_top"></div>
		<div class="contet">
		  <%-- 左侧菜单--%>
			<div class="content_right">
				<div class="nwjd">
			    <div class="wtms">
					<div class="t"></div>
				    <div class="c">
				    	<div class="c-top">
				
				        </div>
				        <div class="c-center">
				            <textarea tabindex="2" onkeydown="ctlent(event);" id="${param.divID }" name="${param.divID }" class="ntest1" cols="80" rows="15" style=" height:230px;width:610px;resize: none;">
				           </textarea>
				        </div>
				        <div class="c-bottom">
				        </div>
				    </div>
				    <div class="b"></div>
				</div>
		</div>		
	</div>
	<div class="c_bottom"></div>
	</div>
 </div>
	<div id="data"></div>
	
	<%-- 底部 --%>
	</body>
</html>
<script type="text/javascript" src="${_currConText }${_jsURL}/xheditor.js"></script>
<script type="text/javascript" src="${_currConText }${_jsURL}/type_select.js"></script>
<script src="${_currConText}${_jsURL}/jquery/modewindow.js"></script>
<script type="text/javascript">

$().ready(function() {
	 $('#${param.divID }').xheditor(true,{
         forcePtag: false,
         upImgUrl: "!<c:url value='/answer/uploadIMG.shtm'/>",
         upImgExt: "jpg,jpeg,gif,png",
         plugins: {Subscript:{c:'',t:'下标'},Superscript:{c:'',t:'上标'}},
         tools: 'GStart,Cut,Copy,Paste,Pastetext,GEnd,Separator,GStart,Blocktag,Fontface,FontSize,Bold,Italic,Underline,Strikethrough,FontColor,BackColor,Removeformat,GEnd,Separator,GStart,Subscript,Superscript,Align,List,Outdent,Indent,GEnd,Separator,GStart,Link,Unlink,Img,Flash,Media,Emot,Table,GEnd,Separator,GStart,Source,Preview,Fullscreen,GEnd',
         shortcuts:{'ctrl+enter':function(){validate();}}
     });
});

 function insertEQ()
 {
     try
     {
         var editor=$("#${param.divID }").xheditor(true)[0].objxhe;
         var arr = showModalDialog("${_currConText}/js/formula/formula.htm", "", "dialogWidth:45em; dialogHeight:35em; status:0;help:0");
        
         if ("undefined" != typeof(arr)) 
         {
           editor.pasteText(arr); 
           
         }
     }
     catch(e){  
     }
 }
</script>

