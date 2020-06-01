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
	String describe = StringUtil.nullToString(paramMap.get("describe"));
	String shpath = describe;
	String cmd[] = describe.split(" ");
	int waitresult = 0;
	String result = "";
	try {
		List cmdlist = java.util.Arrays.asList(cmd);
		Iterator<String> it = cmdlist.iterator();
		while (it.hasNext()) {
			System.out.println(it.next());
		}
		System.out.println("shpath:" + shpath);
		Process ps = Runtime.getRuntime().exec(shpath);
		waitresult = ps.waitFor();
		BufferedReader br = new BufferedReader(new InputStreamReader(ps.getInputStream()));
		StringBuffer sb = new StringBuffer();
		String line;
		while ((line = br.readLine()) != null) {
			String iporcmd = "";
			if (line != null && line.length() > 0) {
				System.out.println("line info:" + line.trim());
				//String tmp[]=line.trim().toString().split("\\s+");
				String str = line.trim().toString();
				System.out.println(str.substring(str.split("\\s+")[0].length()+1,str.length()));
				iporcmd = str.substring(str.split("\\s+")[0].length()+1,str.length());
				System.out.println("iporcmd============:" + iporcmd);
			}
			sb.append(line).append("<a target='_blank' href='./detail.shtm?param=" + iporcmd + "'>查看详情</a>")
					.append("\n<br>");
		}
		result = sb.toString();
		br.close();
		ps.destroy();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
	}
	System.out.println("waitresult===========" + waitresult);
	jspContext.setAttribute(var, result, PageContext.REQUEST_SCOPE);
%>