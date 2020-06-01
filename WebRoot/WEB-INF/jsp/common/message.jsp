<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/noCache.jsp"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags/purchase" prefix="purchase" %>
<%@ include file="/WEB-INF/jsp/common/checkUser.jsp"%>
<link rel="stylesheet" type="text/css" href="${_projectContext}${_cssURL}/ziyuan.css" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>正保教育开放平台 - 系统提示</title>
<link rel="stylesheet" type="text/css" href="${_projectContext}${_cssURL}/global.css" />
<link rel="stylesheet" type="text/css" href="${_projectContext}${_cssURL}/myCart.css" />
<link href="${_webSite}/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<script language="javascript" src="${_projectContext}${_jsURL}/jquery/jquery.min.js"></script>
<script language="javascript" src="${_projectContext}${_jsURL}/global.js"></script>
</head>
<body>
<div style="text-align: center;margin-left: auto;margin-right: auto;">
<%-- 页面头部 begin --%>
<jsp:include page="/WEB-INF/jsp/common/inHead.jsp" flush="true" />
<%-- 页面头部 end --%>
<%-- <util:invoice var="invoiceData" param="${param.invoiceData}" method="decode" /> --%>
<div class="cartfloor cartlogo"></div>
<%-- 系统提示 begin --%>
<div class="cartfloor " style="text-align: center;margin-left: auto;margin-right: auto;">
     <div class="ngwc" style="text-align: center;margin-left: auto;margin-right: auto;">
    	<div class="ngwc-left"><img src="${_webSite}/pub/images/ziyuan/ziyuan_212.jpg" /></div>
        <div class="ngwc-right1">
        	<div class="ngwc-right1-top">
        	<span>
        		<util:urlUtil var="msg" param="${param.msg}" method="decode" />
				<c:if test="${empty msg}">
				     暂无信息
				</c:if>
				${msg}
			</span>
			</div>
            <div class="marb16"></div>
            <div class="ngwc-right1-bottom">
	            <a href="http://www.chinatet.com/op/member/course/buyedcourses.shtm?userType=1"><font color="#025DD0">·查看我的课程表</font></a>&nbsp;&nbsp;&nbsp;&nbsp;
	            <a href="http://www.chinatet.com"><font color="#025DD0">·返回平台首页</font></a>&nbsp;&nbsp;&nbsp;&nbsp;
	            <a href="http://www.chinatet.com/op/user/ware.shtm?userType=1"><font color="#025DD0">·返回学员中心</font></a>
            </div>
        </div>
    </div>
</div>
</div>
<div align="center">
	<span id="invoice" style="color: red">
<!-- 		申请发票如有问题，请联系客服，您的发票申请错误信息： -->
	</span>
</div>
<%-- 系统提示begin --%>

<div class="floor">
<script type="text/javascript" src="${_projectContext}${_jsURL}/footer.js"></script>
</div>
</body>
<script>
/* 	$(function(){
		var isNeedInvoice = '${param.isNeedInvoice}';
		if(isNeedInvoice=='1'){  //需要发票
			if('${param.state}'!=null&&'${param.state}'!='1'){
				$("#invoice").append("发票申请失败，您可在个人中心重新申请或直接联系客服。");
			}else{
				$("#invoice").hide();
			}
		}else{
			$("#invoice").hide();
		}
	}); */
</script>