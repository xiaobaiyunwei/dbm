<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<%@ taglib tagdir="/WEB-INF/tags/login" prefix="login" %>
<login:getLoginUser var="loginUser"></login:getLoginUser>
<%-- 判断是否登陆 --%>
<c:if test="${empty loginUser}">  
    <login:getParamToUrl var="gotoURL" params="${param}" />
     <%-- 重新登录页面 --%>
    <c:redirect url="${_projectContext}/member/loginAgain.shtm?gotoURL=${gotoURL}" />
</c:if> 