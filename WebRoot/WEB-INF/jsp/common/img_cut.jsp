<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'img_cut.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="/Css/thumb/main.css" type="text/css" rel="Stylesheet" />
	<script type="text/javascript" src="/theme/js/jquery.pack.js"></script>
	<script type="text/javascript" src="/theme/js/ui.core.packed.js"></script>
	<script type="text/javascript" src="/theme/js/ui.draggable.packed.js"></script>
	<script type="text/javascript" src="/theme/js/Thumb.js"></script>
  </head>
  
  <body>
  <table align="center" cellpadding="0" cellspacing="0"
					bordercolor="#FFFFFF" class="shu_table11">					
					<tr>
						<td colspan="2" class="shu_table_td5" style="color: red;" >
						<div class="uploadtooltip">
							您可以拖动照片以裁剪满意的头像
						</div>
						<div id="Canvas" class="uploaddiv">

							<div id="ImageDragContainer">
								<img src='/images/thumb/cuttest.jpg' id='ImageDrag' class='imagePhoto' />
							</div>
							<div id="IconContainer">
								<img src='/images/thumb/cuttest.jpg' id='ImageIcon' class='imagePhoto' />
							</div>
						</div>
						<div class="uploaddiv">
							<table>
								<tr>
									<td id="Min">
										<img alt="缩小" src="/images/thumb/_c.gif"
											onMouseOver="this.src='/images/thumb/_c.gif';"
											onMouseOut="this.src='/images/thumb/_h.gif';" id="moresmall"
											class="smallbig" />
									</td>
									<td>
										<div id="bar">
											<div class="child">
											</div>
										</div>
									</td>
									<td id="Max">
										<img alt="放大" src="/images/thumb/c.gif"
											onMouseOver="this.src='/images/thumb/c.gif';"
											onMouseOut="this.src='/images/thumb/h.gif';" id="morebig"
											class="smallbig" />
									</td>
								</tr>
							</table>
						</div>
							<div style="display:none ">
								图片实际宽度：
								<input name="txt_width" type="text" id="txt_width" value="1" />
								<br />
								图片实际高度：
								<input name="txt_height" type="text" id="txt_height" value="1" />
								<br />
								距离顶部：
								<input name="txt_top" type="text" id="txt_top" value="82" />
								<br />
								距离左边：
								<input name="txt_left" type="text" id="txt_left" value="73" />
								<br />
								截取框的宽：
								<input name="txt_DropWidth" type="text" id="txt_DropWidth"
									value="120" />
								<br />
								截取框的高：
								<input name="txt_DropHeight" type="text" id="txt_DropHeight"
									value="120" />
								<br />
								放大倍数：
								<input name="txt_Zoom" type="text" id="txt_Zoom" value="" />
								
								<input type="hidden" id="path" name="path" value="/images/thumb" />
								<input type="hidden" id="srchead" name="srchead" value="cuttest.jpg" />
							</div>
						</td>
					</tr>
				</table>
  </body>
<script type="text/javascript">

function go(){

    $iconElement = $("#ImageIcon");
    $imagedrag = $("#ImageDrag");

    //获取上传图片的实际高度，宽度
    var image = new Image();
    image.src = $iconElement.attr("src");
    var realWidth = image.width;
    var realHeight = image.height;  
    image = null;       
   
    //计算缩放比例开始
    minFactor = ICON_SIZE / Math.max(realWidth, realHeight);
    if (ICON_SIZE > realWidth && ICON_SIZE > realHeight) {
        minFactor = 1;
    }
    factor = minFactor > 0.25 ? 8.0 : 4.0 / Math.sqrt(minFactor);

    //图片缩放比例
    var scaleFactor = 1;
    if (realWidth > CANVAS_WIDTH && realHeight > CANVAS_HEIGHT) {
        if (realWidth / CANVAS_WIDTH > realHeight / CANVAS_HEIGHT) {
            scaleFactor = CANVAS_HEIGHT / realHeight;
        }
        else {
            scaleFactor = CANVAS_WIDTH / realWidth;
        }
    }
    //计算缩放比例结束

    //设置滑动条的位置，设置滑动条的值的变化来改变缩放率是一个非线性的变化，而是幂函数类型 即类似y=factor（X）--此处x为幂指数
    //此处100 * (Math.log(scaleFactor * factor) / Math.log(factor)) 为知道y 求解x 的算法
    $(".child").css("left", 100 * (Math.log(scaleFactor * factor) / Math.log(factor)) + "px");

    //图片实际尺寸，并近似到整数
    currentWidth = Math.round(scaleFactor * realWidth);
    currentHeight = Math.round(scaleFactor * realHeight);


    //图片相对CANVAS的初始位置，图片相对画布居中
    originLeft = Math.round((CANVAS_WIDTH - currentWidth) / 2) ;
    originTop = Math.round((CANVAS_HEIGHT - currentHeight) / 2);
    //计算截取框中的图片的位置
    dragleft = originLeft - LEFT_EDGE;
    dragtop = originTop - TOP_EDGE;


    //设置图片当前尺寸和位置
    $iconElement.css({ width: currentWidth + "px", height: currentHeight + "px", left: originLeft + "px", top: originTop + "px" });
    $imagedrag.css({ width: currentWidth + "px", height: currentHeight + "px", left: dragleft + "px", top: dragtop + "px" });

    //初始化默认值
    $("#txt_width").val(currentWidth);
    $("#txt_height").val(currentHeight);
    $("#txt_top").val(0-dragtop);
    $("#txt_left").val(0-dragleft);
    $("#txt_Zoom").val(scaleFactor);

    oldWidth = currentWidth;
    oldHeight = currentHeight;
}

function move(){
  $("#ImageDrag").draggable(
    {
        cursor: 'move',
        drag: function(e, ui) {
            var self = $(this).data("draggable");
            var drop_img = $("#ImageIcon");
            var top = drop_img.css("top").replace(/px/, ""); //取出截取框到顶部的距离
            var left = drop_img.css("left").replace(/px/, ""); //取出截取框到左边的距离
            drop_img.css({ left: (parseInt(self.position.left) + LEFT_EDGE) + "px", top: (parseInt(self.position.top) + TOP_EDGE) + "px" }); //同时移动内部的图片
            $("#txt_left").val(0 - parseInt(self.position.left));
            $("#txt_top").val(0 - parseInt(self.position.top));
        }
    }
    );
    //设置图片可拖拽，并且拖拽一张图片时，同时移动另外一张图片
    $("#ImageIcon").draggable(
    {
        cursor: 'move',
        drag: function(e, ui) {
            var self = $(this).data("draggable");
            var drop_img = $("#ImageDrag");
            var top = drop_img.css("top").replace(/px/, ""); //取出截取框到顶部的距离
            var left = drop_img.css("left").replace(/px/, ""); //取出截取框到左边的距离
            drop_img.css({ left: (parseInt(self.position.left) - LEFT_EDGE) + "px", top: (parseInt(self.position.top) - TOP_EDGE) + "px" }); //同时移动内部的图片
            $("#txt_left").val(0 - (parseInt(self.position.left) - LEFT_EDGE));
            $("#txt_top").val(0 - (parseInt(self.position.top) - TOP_EDGE));
        }

    }
    );
}
  </script>
</html>