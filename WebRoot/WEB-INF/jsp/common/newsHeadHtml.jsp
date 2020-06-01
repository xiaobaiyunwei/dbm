<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util" %>	
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<script type="text/javascript" src="${_projectContext}${_jsURL}/cdel/jquery.cookie.js"></script>
<link type="text/css" href="${_projectContext}${_cssURL}/jquery.autocomplete.css" rel="stylesheet" />
<script type="text/javascript" src="${_projectContext}${_jsURL}/cdel/cookiemng.js"></script>
<%@ taglib tagdir="/WEB-INF/tags/login" prefix="login" %>
<script type="text/javascript">
// var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
// document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F7d0fbc0c349e03460dbbe9207fa1fbd6' type='text/javascript'%3E%3C/script%3E"));
window.onload=function(){
	loadScript();
}
function loadScript(){
	var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://"); 
	var script = document.createElement ("script");
	script.type = "text/javascript";
	script.src = _bdhmProtocol + "hm.baidu.com/h.js?7d0fbc0c349e03460dbbe9207fa1fbd6";
	document.body.appendChild (script);
}
</script>

<div style="background:url(${_projectContext}/images/head/head-01.jpg) repeat-x;">
<div class="xhead">
    <div class="title">
         <div class="title-left"><span id="login-info" class="login-info"></span> </div>
        <div class="title-right">
<%--             <div class="title-right-01">
                <span OnMouseOver="CDEL.Global.player('hany1');" onMouseOut="CDEL.Global.clocer('hany1');" style=" cursor:pointer; padding:6px 25px 6px 0;">全部课程分类</span>
                <div class="xhdivbox">
                <div id="hany1" class="xhmore" OnMouseOver="CDEL.Global.player('hany1');" onMouseOut="CDEL.Global.clocer('hany1');">
                    <div class="xhmore-top">
                        <a href="${_webSite}/kuaiji/" target="_self">会　　计</a><br/>
                        <a href="${_webSite}/yixue/" target="_self">医　　学</a><br/>
                        <a href="${_webSite}/jianzhu/" target="_self">建　　筑</a><br/>
                        <a href="${_webSite}/falv/" target="_self">法　　律</a><br/>
                        <a href="${_webSite}/zhiyepeixun/" target="_self">公务员、职业培训</a><br/>
                        <a href="${_webSite}/zhongxiaoxue/" target="_self">小学、初中、高中</a><br/>
                        <a href="${_webSite}/zikao/" target="_self">自学考试</a><br/>
                        <a href="${_webSite}/chengkao/" target="_self">成人高考</a><br/>
                        <a href="${_webSite}/kaoyan/" target="_self">考　　研</a><br/>
                        <a href="${_webSite}/waiyu/" target="_self">外语、留学</a><br/>
                        <a href="${_webSite}/jisuanji/" target="_self">计算机、互联网</a><br/>
                        <a href="${_webSite}/zhichang/" target="_self">职场、生活、其他</a><br/>
                    </div>
                </div>
                </div>
            </div> --%>


            <div class="title-right-02">
		        <span id="login-info1" class="login-info"></span> 
		       <%--  <a href="${_webSite}${_faqConText}?flag=1" target="_blank">你问我答${_uid }</a> | --%> 
		        <a href="${_webSite}${_opConText }/user/ware.shtm?userType=1" target="_blank">学员中心</a> | 
		        <a href="${_webSite}${_opConText }/user/ware.shtm?userType=2" target="_blank">教师中心</a> 
            </div>
        </div>
    </div>
    <!--logo 搜索-->
    <div class="xxhead">
        <div class="logo"><a href="${_webSite}" target="_blank"><img src="${_projectContext}/images/head/head-02.jpg" /></a></div>
        <div class="zx"><img src="/pub/images/ziyuan/wlkc_101.jpg" /></div>
    </div>
    <!--logo 搜索结束-->
</div>
</div>
