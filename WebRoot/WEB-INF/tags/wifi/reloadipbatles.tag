<%@tag import="org.apache.log4j.Logger"%>
<%@tag import="javax.servlet.jsp.tagext.TagSupport"%>
<%@tag import="java.util.HashMap,java.util.Map"%>
<%@tag import="com.devops.common.StringUtil"%>
<%@tag import="java.util.concurrent.TimeUnit"%>
<%@tag import="java.io.BufferedReader,java.io.InputStreamReader"%>
<%@tag import="java.util.*"%>
<%@ attribute name="param" type="java.lang.Object" required="true" description="(Object) 获取表单提交的参数 JSTL的param对象"%>
<%@ attribute name="var" type="java.lang.String" required="true" description="返回值"%>
<%
	Object objParameter = jspContext.getAttribute("param");
	String strVar = (String) jspContext.getAttribute("var");
	Map<Object, Object> paramMap = new HashMap<Object, Object>();
	paramMap = (Map) objParameter;
	//clientIp实际为连接外网的dns，起初是准备绑定用户ip的，后来改为mac地址参数名称就没有做调整。
	String clientIp = StringUtil.nullToString(paramMap.get("clientIp"));
	String dns = StringUtil.nullToString(paramMap.get("dns"));
	String mac = StringUtil.nullToString(paramMap.get("mac"));
	System.out.println(dns+"||"+mac+"||"+clientIp);
	String shpath = "/bin/sh /opt/devops/cmd/setiptables.sh " + mac + " " +clientIp  + " " + dns ;
	String cmd[] = shpath.split(" ");
	System.out.println("shpath========:"+shpath);
	String result = "0";
	boolean waitresult = false;
	try {
		List cmdlist = java.util.Arrays.asList(cmd);
		ProcessBuilder pb = new ProcessBuilder(cmdlist);
		Process ps = pb.start();
		//Process ps = Runtime.getRuntime().exec(shpath);
		//int waitresult=ps.waitFor();
		waitresult = ps.waitFor(3, TimeUnit.SECONDS);
		BufferedReader br = new BufferedReader(new InputStreamReader(ps.getInputStream()));
		StringBuffer sb = new StringBuffer();
		String line;
		while ((line = br.readLine()) != null) {
			sb.append(line);
			
			System.out.println("reloadiptables result is:"+line);
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
	System.out.println("the result of setting iptables===========" + result);
	jspContext.setAttribute(var, result, PageContext.REQUEST_SCOPE);
%>

