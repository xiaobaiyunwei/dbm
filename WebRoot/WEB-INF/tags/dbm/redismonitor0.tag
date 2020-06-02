<%@ tag language="java" pageEncoding="UTF-8"%>
<%@tag import="java.util.Map"%>
<%@tag import="java.util.HashMap"%>
<%@tag import="java.io.BufferedReader"%>
<%@tag import="java.io.InputStreamReader"%>
<%@tag import="java.util.concurrent.TimeUnit"%>
<%@tag import="java.util.*"%>
<%@ attribute name="var" type="java.lang.String" required="true" description="操作结果变量"%>
<%@tag import="com.devops.common.StringUtil"%>
<%@ attribute name="param" type="java.lang.Object" required="true" description="(Object) 获取表单提交的参数 JSTL的param对象"%>
<%
	Object objParameter = jspContext.getAttribute("param");
	String strVar = (String) jspContext.getAttribute("var");
	Map<Object, Object> paramMap = new HashMap<Object, Object>();
	paramMap = (Map) objParameter;
	String ip = StringUtil.nullToString(paramMap.get("ip"));
	String port = StringUtil.nullToString(paramMap.get("port"));
	Integer linenum = Integer.valueOf(paramMap.get("linenum").toString());
	System.out.println("ip:" + ip);
	System.out.println("linenum:" + linenum);
	String shpath = "/bin/sh /opt/devops/cmd/redis1.sh " + ip + " " + port;
	String cmd[] = shpath.split(" ");
	boolean waitresult = false;
	String result = "";
	int tmpline = 1;
	try {
		List cmdlist = java.util.Arrays.asList(cmd);
		System.out.println("shpath:" + cmd.length);
		ProcessBuilder pb = new ProcessBuilder(cmdlist);
		Process ps = pb.start();
		//Process ps = Runtime.getRuntime().exec(shpath);
		//int waitresult=ps.waitFor();
		waitresult = ps.waitFor(3, TimeUnit.SECONDS);
		BufferedReader br = new BufferedReader(new InputStreamReader(ps.getInputStream()));
		StringBuffer sb = new StringBuffer();
		String line;
		while ((line = br.readLine()) != null) {
			System.out.println("redismonitor-输出行数=="+tmpline+"===：" + linenum + "line info:" + line);
			//out.println(linenum+line+"<br>out");
			sb.append(line).append("\n<br>");
			if (tmpline > linenum) {
				break;
			}
			tmpline++;
		}
		result = sb.toString();
		br.close();
		ps.destroy();
		pb.directory();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
	}
	System.out.println("waitresult===========" + waitresult);
	jspContext.setAttribute(var, tmpline, PageContext.REQUEST_SCOPE);
%>