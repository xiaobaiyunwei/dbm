<%@tag import="java.io.UnsupportedEncodingException"%>
<%@ attribute
   	name="srcStr"
   	type="java.lang.String"
   	required="true"
   	description="需处理的参数值"
%>
<%@ attribute
   	name="var"
   	type="java.lang.String"
   	required="true"
   	description="返回值"
%>
<%@ attribute
   	name="len"
   	type="java.lang.String"
   	required="true"
   	description="要获得的长度"
%>
<%@tag pageEncoding="UTF-8"%>
<%	
	

	String strVar = (String) jspContext.getAttribute("var");
	String srcStr = (String) jspContext.getAttribute("srcStr");
	Integer istrlen = new Integer((String) jspContext.getAttribute("len"));
	String rtnVal="";

 
        final int charset = 3; //字符集编码   
        if (charset < 2 || 3 < charset)   
        {   
            throw new Exception("chinese_char_len可选值为2和3,2:Unicode编码,一个汉字占2个字节, 3:UTF-8编码,一个汉字占3个字节");   
        }   
        int index = istrlen - 1; //下标比总数少一个   
        if (null == srcStr || "".equals(srcStr))   
        {   
            rtnVal=srcStr;   
        }   
        if (index <= 0)   
        {   
            rtnVal=srcStr; 
        }   
  
        byte[] bt = null;   
        try  
        {   
            if (charset == 2)   
            {   
                bt = srcStr.getBytes();   
            }   
            else  
            {   
                bt = srcStr.getBytes("UTF-8");   
            }   
        }   
        catch (final UnsupportedEncodingException e)   
        {   
            e.getMessage();   
        }   
        if (null == bt)   
        {   
             rtnVal=srcStr;   
        }   
        if (index > bt.length - 1)   
        {   
            index = bt.length - 1; //防越界   
        }   
  
        //如果当前字节小于0，说明当前截取位置 有可能 将中文字符截断了   
        if (bt[index] < 0)   
        {   
            int jsq = 0;   
            int num = index;   
            while (num >= 0)   
            {   
                if (bt[num] < 0)   
                {   
                    jsq += 1; //计数   
                }   
                else  
                {   
                    break; //循环出口   
                }   
                num -= 1;   
            }   
  
            int m = 0;   
            if (charset == 2)   
            {   
                //Unicode编码   
                m = jsq % 2;   
                index -= m;   
                //这里是重点,去掉半个汉字(有可能是半个), m为0表示无一半汉字,   
                final String substrx = new String(bt, 0, index + 1); //当前被截断的中文字符整个不取      
                rtnVal=substrx;   
            }   
            else  
            {   
                // utf-8 编码   
                m = jsq % 3;   
                index -= m;   
                //这里是重点,去掉半个汉字(有可能是半个), m为0表示无一半汉字,   
                String substrx = null;   
                try  
                {   
                    substrx = new String(bt, 0, index + 1, "UTF-8");   
                }   
                catch (final UnsupportedEncodingException e)   
                {   
                    e.getMessage();   
                } //当前被截断的中文字符整个不取     
                rtnVal=substrx;   
            }   
        }   
        else  
        {   
            String substrx = null;   
            if (charset == 2)   
            {   
                //Unicode编码   
                substrx = new String(bt, 0, index + 1);   
                rtnVal=substrx;   
            }   
            else  
            {   
                // utf-8 编码   
                try  
                {   
                    substrx = new String(bt, 0, index + 1, "UTF-8");   
                }   
                catch (final UnsupportedEncodingException e)   
                {   
                    e.getMessage();   
                }   
                rtnVal=substrx;   
            }   
        }   


	
	jspContext.setAttribute(strVar, rtnVal, PageContext.REQUEST_SCOPE);
%>