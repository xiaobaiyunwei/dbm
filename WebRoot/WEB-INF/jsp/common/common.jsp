<%@ page pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib tagdir="/WEB-INF/tags/sql" prefix="Sql" %>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>


<%--引用js文件，通过修改value为/js_min 切换成部署路径 --%>
<c:set var="_jsURL" value="/js"></c:set>
<%--引用css文件，通过修改value为/css_min 切换成部署路径 --%>
<c:set var="_cssURL" value="/css"></c:set>

<%-- 单点服务器--对公路径 --%>
<c:set var="_SSOServiceURL" value="http://portal.cdeledu.com/auth"></c:set>
<c:set var="_SSOServiceURLs" value="https://portal.cdeledu.com/auth"></c:set>
<%-- 单点服务器--对私路径 --%>
<c:set var="_SSOPrivateService" value="http://portal.cdeledu.com/api"></c:set>
<%-- 单点服务器--获取密码路径 --%>
<c:set var="_SSOPrivatePasswordService" value="http://portal.cdeledu.com/lib/ucGetInfo.php"></c:set>
<%-- 单点服务器--对私密钥 --%>
<c:set var="_SSOPrivateKey" value="fJ3UjIFyTu"></c:set>



<%-- 当前Context --%>
<c:set var="_currConText" value="${pageContext.request.contextPath}"></c:set>
<%-- 当前projectContext --%>
<c:set var="_projectContext" value="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }"></c:set>
<%-- 当前_webContext --%>
<c:set var="_webContext" value="http://${pageContext.request.serverName }:${pageContext.request.serverPort }"></c:set>


