<%@tag import="java.net.*"%>
<%@tag import="java.io.*"%>
<%@ attribute
    name="serverURL"
    type="java.lang.String"
    required="true"
    description="请求的服务器路径"
%>
<%@ attribute
    name="var"
    type="java.lang.String"
    required="true"
    description="返回的字符串"
%>
<%
    StringBuffer responseTxt=new StringBuffer();

   try {

       URL url = new URL(serverURL);
       URLConnection uc = url.openConnection();
       uc.setDoOutput(true);

       BufferedReader br = new BufferedReader(new InputStreamReader(uc.getInputStream(),"UTF-8"));
      
       String readOneLine;

       while ((readOneLine = br.readLine()) != null) {

           responseTxt.append(readOneLine);
       }

       br.close();
    } 
    catch(Exception e) {
       e.printStackTrace();
    }

    //System.out.println("---> responseTxt html is: "+responseTxt);
    jspContext.setAttribute(var, responseTxt.toString(), PageContext.REQUEST_SCOPE);    
%>