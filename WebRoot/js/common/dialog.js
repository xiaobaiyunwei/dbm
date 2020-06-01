var dialogFirst = true;
function dialog(title, className, topImgUrl, type, content, width, height,
		cssName, topSpace, showbg, offsets, obj) {
	
	// $("select").attr("disabled","disabled");
	if (dialogFirst == true) {
		var temp_float2 = new String;
		temp_float2 = "<div id=\"floatBoxBg\" style=\"height:"
				+ $(document).height()
				+ "px;filter:alpha(opacity=0);opacity:0;\"></div>";
		temp_float2 += " <div class='" + className + "' >";
		temp_float2 += "<div class='top'>";
		temp_float2 += "	<div class='top-left'><img src='" + topImgUrl
				+ "'/></div>";
		temp_float2 += "<div class='top-center'> " + title + "</div>";
		temp_float2 += "<div class='top-right'><a id='closeWin' style='cursor:pointer'><img src='/dbm/images/dialog/ziyuan_144.jpg'/></a></div>";
		temp_float2 += "</div>";
		temp_float2 += "<div class='center' id='content'>";
		// temp_float2+=" <div class='center-bottom1'>";
		// temp_float2+=" <div class='center-bottom1-01'><input name=''
		// type='button' class='gtctest2' value='浏 览'/></div>";
		// temp_float2+=" <div class='center-bottom1-01'><input name=''
		// type='button' class='gtctest3' value='上 传'/></div>";
		// temp_float2+=" <div class='center-bottom1-01'><input name=''
		// type='button' class='gtctest3' value='撤 销'/></div>";
		// temp_float2+="</div>";
		// temp_float2+=" <div
		// class='center-bottom2'>阿斯顿撒打算.mp4&nbsp;&nbsp;&nbsp;&nbsp;26MB</div>";
		temp_float2 += "</div>";
		temp_float2 += "</div>";

		var temp_float3 = new String;
		temp_float3 = "<div id=\"floatBoxBg\" style=\"height:"
				+ $(document).height()
				+ "px;filter:alpha(opacity=0);opacity:0;\"></div>";
		temp_float3 += "<span id='closeWin' style='cursor:pointer'></span>";
		temp_float3 += " <div class='" + className + "' id='content'>";
		temp_float3 += "</div>";

		$("body").append(temp_float2);
		dialogFirst = false;

	}

	$("#closeWin")
			.click(
					function() {
						$("#floatBoxBg").animate({
							opacity : "0"
						}, "normal", function() {
							$(this).hide();
						});
						$("." + className + "")
								.animate(
										{
											top : ($(document).scrollTop() - (height == "auto" ? 300
													: parseInt(height)))
													+ "px"
										}, "normal", function() {
											$(this).hide();
										});
						// $("select").attr("disabled","");
						$("#floatBoxBg").remove();
						$("." + className + "").remove();
						dialogFirst = true;
					});

	contentType = type;
	content = content;
	switch (contentType) {
	case "url":
		var content_array = content.split("?");
		$("#content").ajaxStart(function() {
			$(this).html("loading...");
		});
		$.ajax({
			type : content_array[0],
			url : content_array[1],
			data : content_array[2],
			error : function() {
				$("#content").html("error...");
			},
			success : function(html) {
				// $("#floatBox .content").html(html);
				$("#content").html(html);
			}
		});
		break;
	case "text":
		$("#content").html(content);
		break;
	case "id":
		$("#content").html($("#" + content + "").html());
		break;
	case "iframe":
		$("#content")
				.html(
						"<iframe src=\""
								+ content
								+ "\" width=\"100%\" height=\""
								+ (parseInt(height))
								+ "px"
								+ "\" scrolling=\"no\" frameborder=\"0\" marginheight=\"0\" marginwidth=\"0\"></iframe>");
		$("#content").hide();
		$("#content").fadeIn(2000);
	}

	if (showbg != false) {
		$("#floatBoxBg").show();
		$("#floatBoxBg").animate({
			opacity : "0.3"
		}, "normal");
	}
	$("#floatBox").attr("class", "floatBox " + cssName);

	if (offsets == null && obj == null) {
		// $(".gtc").css({display:"block",left:(($(document).width())/2-(parseInt(width)/2))+"px",top:($(document).scrollTop()+$(window).height()/2-parseInt(topSpace))+"px",width:width,height:height});
		$("." + className)
				.animate(
						{
							top : ($(document).scrollTop() + $(window).height()
									/ 2 - parseInt(topSpace))
									+ "px"
						}, "normal");
	} else if (offsets == "mouseXY") {
		$("." + className).css({
			display : "block",
			left : (obj.pageX - parseInt(width)) + "px",
			top : (obj.pageY - parseInt(height)) + "px",
			width : width,
			height : height
		});
		$("." + className)
				.animate(
						{
							top : ($(document).scrollTop() + $(window).height()
									/ 2 - parseInt(topSpace))
									+ "px"
						}, "normal");
	}
}