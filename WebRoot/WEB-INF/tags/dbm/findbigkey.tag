<%@tag language="java" pageEncoding="UTF-8"%>
<%@tag import="java.util.Map"%>
<%@tag import="java.util.HashMap"%>
<%@tag import="java.io.BufferedReader"%>
<%@tag import="java.io.InputStreamReader"%>
<%@tag import="java.util.concurrent.TimeUnit"%>
<%@tag import="java.util.*"%>
<%@attribute name="var" type="java.lang.String" required="true" description="操作结果变量"%>
<%@tag import="com.devops.common.StringUtil"%>
<%@attribute name="param" type="java.lang.Object" required="true" description="(Object) 获取表单提交的参数 JSTL的param对象"%>
<%
	Object objParameter = jspContext.getAttribute("param");
	String strVar = (String) jspContext.getAttribute("var");
	Map<Object, Object> paramMap = new HashMap<Object, Object>();
	paramMap = (Map) objParameter;
	String ip = StringUtil.nullToString(paramMap.get("ip")).trim();
	String port = StringUtil.nullToString(paramMap.get("port")).trim();
	String linenum = StringUtil.nullToString(paramMap.get("linenum")).trim();
	System.out.println("ip:" + ip);
	System.out.println("linenum:" + linenum);
	String shpath = "cd /opt/devops/analyredis/python && source vpython3/bin/activate && python findkeys.py "+ip+" "+port+" '' "+linenum;
	System.out.println("=======monitor cmd is===:"+shpath);
	boolean waitresult = false;
	String result = "";
	int tmpline = 1;
	try {
		Process ps = Runtime.getRuntime().exec( new String[]{ "/bin/sh" , "-c" ,shpath});
		ps.waitFor();
		BufferedReader br = new BufferedReader(new InputStreamReader(ps.getInputStream()));
		StringBuffer sb = new StringBuffer();
		String line;
		while ((line = br.readLine()) != null) {
			System.out.println("redismonitor-输出行数=="+tmpline+"and line info:" + line);
			sb.append(line).append("\n<br>");
			tmpline++;
		}
		result = sb.toString();
		ps.destroy();
		br.close();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
	}
	jspContext.setAttribute(var, result, PageContext.REQUEST_SCOPE);
%>