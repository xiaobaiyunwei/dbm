<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
</script>
<% 
	response.setHeader("PRagma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>

<jsp:useBean id="paramMap" class="java.util.HashMap" scope="page">
			<c:set target="${paramMap}" property="id" value="${param.id}"></c:set>
			<c:set target="${paramMap}" property="name" value="${param.name}"></c:set>
			<c:set target="${paramMap}" property="age" value="${param.age}"></c:set>
			<c:set target="${paramMap}" property="phone" value="${param.phone}"></c:set>
			<c:set target="${paramMap}" property="describe" value="${param.describe}"></c:set>
</jsp:useBean>
${paramMap}
<Sql:sqlSession.update sqlMapId="demo_mysql" stmt="ns.sns.demo.updateSnsDemo" param="${paramMap}"/> 