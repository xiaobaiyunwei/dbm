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
							�������϶���Ƭ�Բü������ͷ��
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
										<img alt="��С" src="/images/thumb/_c.gif"
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
										<img alt="�Ŵ�" src="/images/thumb/c.gif"
											onMouseOver="this.src='/images/thumb/c.gif';"
											onMouseOut="this.src='/images/thumb/h.gif';" id="morebig"
											class="smallbig" />
									</td>
								</tr>
							</table>
						</div>
							<div style="display:none ">
								ͼƬʵ�ʿ�ȣ�
								<input name="txt_width" type="text" id="txt_width" value="1" />
								<br />
								ͼƬʵ�ʸ߶ȣ�
								<input name="txt_height" type="text" id="txt_height" value="1" />
								<br />
								���붥����
								<input name="txt_top" type="text" id="txt_top" value="82" />
								<br />
								������ߣ�
								<input name="txt_left" type="text" id="txt_left" value="73" />
								<br />
								��ȡ��Ŀ�
								<input name="txt_DropWidth" type="text" id="txt_DropWidth"
									value="120" />
								<br />
								��ȡ��ĸߣ�
								<input name="txt_DropHeight" type="text" id="txt_DropHeight"
									value="120" />
								<br />
								�Ŵ�����
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

    //��ȡ�ϴ�ͼƬ��ʵ�ʸ߶ȣ����
    var image = new Image();
    image.src = $iconElement.attr("src");
    var realWidth = image.width;
    var realHeight = image.height;  
    image = null;       
   
    //�������ű�����ʼ
    minFactor = ICON_SIZE / Math.max(realWidth, realHeight);
    if (ICON_SIZE > realWidth && ICON_SIZE > realHeight) {
        minFactor = 1;
    }
    factor = minFactor > 0.25 ? 8.0 : 4.0 / Math.sqrt(minFactor);

    //ͼƬ���ű���
    var scaleFactor = 1;
    if (realWidth > CANVAS_WIDTH && realHeight > CANVAS_HEIGHT) {
        if (realWidth / CANVAS_WIDTH > realHeight / CANVAS_HEIGHT) {
            scaleFactor = CANVAS_HEIGHT / realHeight;
        }
        else {
            scaleFactor = CANVAS_WIDTH / realWidth;
        }
    }
    //�������ű�������

    //���û�������λ�ã����û�������ֵ�ı仯���ı���������һ�������Եı仯�������ݺ������� ������y=factor��X��--�˴�xΪ��ָ��
    //�˴�100 * (Math.log(scaleFactor * factor) / Math.log(factor)) Ϊ֪��y ���x ���㷨
    $(".child").css("left", 100 * (Math.log(scaleFactor * factor) / Math.log(factor)) + "px");

    //ͼƬʵ�ʳߴ磬�����Ƶ�����
    currentWidth = Math.round(scaleFactor * realWidth);
    currentHeight = Math.round(scaleFactor * realHeight);


    //ͼƬ���CANVAS�ĳ�ʼλ�ã�ͼƬ��Ի�������
    originLeft = Math.round((CANVAS_WIDTH - currentWidth) / 2) ;
    originTop = Math.round((CANVAS_HEIGHT - currentHeight) / 2);
    //�����ȡ���е�ͼƬ��λ��
    dragleft = originLeft - LEFT_EDGE;
    dragtop = originTop - TOP_EDGE;


    //����ͼƬ��ǰ�ߴ��λ��
    $iconElement.css({ width: currentWidth + "px", height: currentHeight + "px", left: originLeft + "px", top: originTop + "px" });
    $imagedrag.css({ width: currentWidth + "px", height: currentHeight + "px", left: dragleft + "px", top: dragtop + "px" });

    //��ʼ��Ĭ��ֵ
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
            var top = drop_img.css("top").replace(/px/, ""); //ȡ����ȡ�򵽶����ľ���
            var left = drop_img.css("left").replace(/px/, ""); //ȡ����ȡ����ߵľ���
            drop_img.css({ left: (parseInt(self.position.left) + LEFT_EDGE) + "px", top: (parseInt(self.position.top) + TOP_EDGE) + "px" }); //ͬʱ�ƶ��ڲ���ͼƬ
            $("#txt_left").val(0 - parseInt(self.position.left));
            $("#txt_top").val(0 - parseInt(self.position.top));
        }
    }
    );
    //����ͼƬ����ק��������קһ��ͼƬʱ��ͬʱ�ƶ�����һ��ͼƬ
    $("#ImageIcon").draggable(
    {
        cursor: 'move',
        drag: function(e, ui) {
            var self = $(this).data("draggable");
            var drop_img = $("#ImageDrag");
            var top = drop_img.css("top").replace(/px/, ""); //ȡ����ȡ�򵽶����ľ���
            var left = drop_img.css("left").replace(/px/, ""); //ȡ����ȡ����ߵľ���
            drop_img.css({ left: (parseInt(self.position.left) - LEFT_EDGE) + "px", top: (parseInt(self.position.top) - TOP_EDGE) + "px" }); //ͬʱ�ƶ��ڲ���ͼƬ
            $("#txt_left").val(0 - (parseInt(self.position.left) - LEFT_EDGE));
            $("#txt_top").val(0 - (parseInt(self.position.top) - TOP_EDGE));
        }

    }
    );
}
  </script>
</html>