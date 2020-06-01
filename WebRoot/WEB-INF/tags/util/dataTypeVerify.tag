<%@ attribute
	name="params"
	type="java.lang.Object"
	required="false"
	description="(String)" %>
	
<%@ attribute
	name="dataTypes"
	type="java.lang.Object"
	required="false"
	description="(String)" %>
	
<%@ attribute
	name="var"
	type="java.lang.String"
	required="false"
	description="(String) 查询结果存放的变量名" %>


<%@ include file="/WEB-INF/tags/sql/inc/taglibs.jsp" %>

<%@ tag 
    import="javax.servlet.jsp.PageContext, java.util.*,java.util.regex.*"
    dynamic-attributes="dynamicAttributes"
    description="打印收藏" %>
	
<%
	String strVar = (String) jspContext.getAttribute("var");
	Object objParameter = jspContext.getAttribute("params");
	Object dataTypeParameter = jspContext.getAttribute("dataTypes");
	
	int returnValue = 0;
	
	Map aMap = new HashMap();
	aMap = (Map) objParameter;
	
	Map bMap = new HashMap();
	bMap = (Map) dataTypeParameter;
	
	if (aMap != null && aMap.size() != 0){
		Iterator it = aMap.entrySet().iterator();
		Integer len = aMap.size();
		Integer i = 0;
	    while (it.hasNext()) {
		    Map.Entry entry = (Map.Entry) it.next();
		    Object key = entry.getKey();
		    Object value = entry.getValue();
		    boolean bo = false;
		    	
		    Object tvalue = bMap.get(key);
		    if (tvalue != null){
		    	if ("Integer".equals((String)tvalue)){
		    		Pattern pattern = Pattern.compile("[0-9]*");   
    				Matcher isNum = pattern.matcher((String)value);  
    				if (isNum.matches()){
    					bo = true;
    				}
	    			//bo = value instanceof Integer;
	    		} else if ("String".equals((String)tvalue)){
	    			bo = value instanceof String;
	    		}
		    }
		    if (bo == true){
		    	i += 1;
		    }
	   	}
	   	if (i == len){
			returnValue = 1; //正确
	   	} else {
	   		returnValue = 0; //错误
	   	}
	}
	jspContext.setAttribute(strVar, returnValue, PageContext.REQUEST_SCOPE);
%>