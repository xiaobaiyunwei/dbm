<%@ tag language="java" pageEncoding="UTF-8"%>
<%@tag import="java.util.Map"%>
<%@tag import="java.util.HashMap"%>
<%@tag import="java.io.BufferedReader"%>
<%@tag import="java.io.InputStreamReader"%>
<%@tag import="java.util.concurrent.TimeUnit"%>
<%@tag import="java.util.*"%>
<%@ attribute name="var" type="java.lang.String" required="true"
	description="操作结果变量"%>
<%@tag import="com.devops.common.StringUtil"%>
<%@ attribute name="param" type="java.lang.Object" required="true"
	description="(Object) 获取表单提交的参数 JSTL的param对象"%>
<%
	Object objParameter = jspContext.getAttribute("param");
	String strVar = (String) jspContext.getAttribute("var");	
	Map<Object, Object> paramMap = new HashMap<Object, Object>();
	paramMap = (Map) objParameter;
	String describe = StringUtil.nullToString(paramMap.get("describe"));
	
	boolean waitresult = false;
	String result = "";	
	System.out.println("执行命令:" + describe);
	try {
		Process ps = Runtime.getRuntime().exec(describe);
		waitresult=ps.waitFor(6, TimeUnit.SECONDS);
		BufferedReader br = new BufferedReader(new InputStreamReader(ps.getInputStream()));
		StringBuffer sb = new StringBuffer();
		String line;		
		int linei=1;
		while ((line = br.readLine()) != null) {			
			sb.append(line).append("\n<br>");
			linei++;
		}
		result = sb.toString();
		br.close();
		ps.destroy();		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
	}
	System.out.println("detail waitresult===========" + waitresult);
	jspContext.setAttribute(var, result, PageContext.REQUEST_SCOPE);
%>