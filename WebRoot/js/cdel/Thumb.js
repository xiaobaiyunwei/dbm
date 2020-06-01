/// <reference path="JSintellisense/jquery-1.2.6-intellisense.js" />

//全局变量定义
var CANVAS_WIDTH = 284; //画布的宽
var CANVAS_HEIGHT = 266; //画布的高
var ICON_SIZE = 120;  //截取框的大小，正方形
var LEFT_EDGE = (CANVAS_WIDTH - ICON_SIZE) / 2; //82
var TOP_EDGE = (CANVAS_HEIGHT - ICON_SIZE) / 2; //73
var CANVAS_LEFT_MARGIN = 4;
var $iconElement;
var $imagedrag;
var factor;
var minFactor;
var oldWidth;
var oldHeight;
var currentWidth;
var currentHeight;
var originLeft;
var originTop;
var dragleft;
var dragtop;


//用document. ready事件中在上传后第一次转向时无法获取到图片的打开，应该是没有被下载来的缘故
$(window).load(function() {
	go();
    //设置图片可拖拽，并且拖拽一张图片时，同时移动另外一张图片
   move();

    //缩放的代码，要缩放以截取框为中心，所以要重新计算图片的left和top
    $(".child").draggable(
  {
      cursor: "move", containment: $("#bar"),
      drag: function(e, ui) {
      var left = parseInt($(this).css("left"));
          //前面讲过了y=factor（x），此处是知道x求y的值，即知道滑动条的位置，获取缩放率
          scaleFactor = Math.pow(factor, (left / 100 - 1));
          if (scaleFactor < minFactor) {
              scaleFactor = minFactor;
          }
          if (scaleFactor > factor) {
              scaleFactor = factor;
          }
          //以下代码同初始化过程，因为用到局部变量所以没有
          var iconElement = $("#ImageIcon");
          var imagedrag = $("#ImageDrag");

          var image = new Image();
          image.src = iconElement.attr("src");
          var realWidth = image.width;
          var realHeight = image.height;
          image = null;

          //图片实际尺寸
          var currentWidth = Math.round(scaleFactor * realWidth);
          var currentHeight = Math.round(scaleFactor * realHeight);

          //图片相对CANVAS的初始位置
          var originLeft = parseInt(iconElement.css("left"));
          var originTop = parseInt(iconElement.css("top"));

          originLeft -= Math.round((currentWidth - oldWidth) / 2);
          originTop -= Math.round((currentHeight - oldHeight) / 2);
          dragleft = originLeft - LEFT_EDGE;
          dragtop = originTop - TOP_EDGE;

          //图片当前尺寸和位置
          iconElement.css({ width: currentWidth + "px", height: currentHeight + "px", left: originLeft + "px", top: originTop + "px" });
          imagedrag.css({ width: currentWidth + "px", height: currentHeight + "px", left: dragleft + "px", top: dragtop + "px" });

          $("#txt_Zoom").val(scaleFactor);
          $("#txt_left").val(0 - dragleft);
          $("#txt_top").val(0 - dragtop);
          $("#txt_width").val(currentWidth);
          $("#txt_height").val(currentHeight);
          oldWidth = currentWidth;
          oldHeight = currentHeight;

      }
  });
    var SilderSetValue = function(i) {
        var left = parseInt($(".child").css("left"));
        left += i;

        if (left < 0) {
            left = 0;
        }
        if (left > 200) {
            left = 200;
        }

        scaleFactor = Math.pow(factor, (left / 100 - 1));
        if (scaleFactor < minFactor) {
            scaleFactor = minFactor;
        }
        if (scaleFactor > factor) {
            scaleFactor = factor;
        }
        var iconElement = $("#ImageIcon");
        var imagedrag = $("#ImageDrag");

        var image = new Image();
        image.src = iconElement.attr("src");
        var realWidth = image.width;
        var realHeight = image.height;
        image = null;

        //图片实际尺寸
        var currentWidth = Math.round(scaleFactor * realWidth);
        var currentHeight = Math.round(scaleFactor * realHeight);

        //图片相对CANVAS的初始位置
        var originLeft = parseInt(iconElement.css("left"));
        var originTop = parseInt(iconElement.css("top"));

        originLeft -= Math.round((currentWidth - oldWidth) / 2);
        originTop -= Math.round((currentHeight - oldHeight) / 2);
        dragleft = originLeft - LEFT_EDGE;
        dragtop = originTop - TOP_EDGE;

        //图片当前尺寸和位置
        $(".child").css("left", left + "px");
        iconElement.css({ width: currentWidth + "px", height: currentHeight + "px", left: originLeft + "px", top: originTop + "px" });
        imagedrag.css({ width: currentWidth + "px", height: currentHeight + "px", left: dragleft + "px", top: dragtop + "px" });

        $("#txt_Zoom").val(scaleFactor);
        $("#txt_left").val(0 - dragleft);
        $("#txt_top").val(0 - dragtop);
        $("#txt_width").val(currentWidth);
        $("#txt_height").val(currentHeight);

        oldWidth = currentWidth;
        oldHeight = currentHeight;
    }
    //点击加减号
    $("#moresmall").click(function() {
        SilderSetValue(-20);
    });
    $("#morebig").click(function() {
        SilderSetValue(20);
    });

});
