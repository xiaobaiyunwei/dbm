package com.devops.common;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtil {
	// public boolean hasRedundant(String[] strs) {
	// if (null == strs || strs.length < 2)
	// return false;
	// boolean isRedundant = false;
	// for (int i = strs.length - 1; i > -1; i--)
	// for (int j = i - 1; j > -1; j--)
	// if (null != strs[i] && strs[i].equals(strs[j])) {
	// isRedundant = true;
	// break;
	// }
	// return isRedundant;
	// }
	public boolean hasRedundant(String[] strs) {
		if (null == strs || strs.length < 2)
			return false;
		boolean isRedundant = false;
		for (int i = strs.length - 1; i > -1; i--)
			for (int j = i - 1; j > -1; j--)
				if (null != strs[i] && strs[i].equals(strs[j])) {
					isRedundant = true;
					break;
				}
		return isRedundant;
	}

	/**
	 * 判断字符串string是否存在于数组strs中。
	 * 
	 * @param string
	 * @param strs
	 * @return
	 * @author 裴伟斌 2006-10-30
	 */
	public boolean isExisted(String string, String[] strs) {
		if (null == string || null == strs || strs.length < 1)
			return false;
		boolean isOverlapped = false;
		for (int i = 0; i < strs.length; i++)
			if (null != strs[i] && strs[i].equals(string)) {
				isOverlapped = true;
				break;
			}
		return isOverlapped;
	}

	/**
	 * 将字符串strSource用regex分割成数组，并判断字符串string是否在该数组里。
	 * 
	 * @param string
	 * @param strSource
	 * @param regex
	 * @return
	 * @author 裴伟斌 2006-10-30
	 */
	public boolean isExisted(String string, String strSource, String regex) {
		if (null == string || null == strSource || null == regex
				|| strSource.length() < 1)
			return false;
		return isExisted(string, strSource.split(regex));
	}

	/**
	 * 将字符串string用分割串regex分割成数组，并且剔除重复的，再重新用分割串regex组合起来。
	 * 
	 * @param string
	 * @param regex
	 * @return
	 * @author 裴伟斌 2006-10-26
	 */
	public String makeUnique(String string, String regex) {
		if (null == string)
			return null;
		if (null == regex)
			return string;
		if ("".equals(string.trim()) || "".equals(regex))
			return string;
		String result = "";
		String[] strs = string.split(regex);
		strs = removeNull(strs);
		int len = strs.length;
		boolean isRedundant[] = new boolean[len];
		for (int i = 0; i < len; i++)
			isRedundant[i] = false;
		for (int i = 0; i < len; i++) {
			if (isRedundant[i])
				continue;
			for (int j = i + 1; j < len; j++)
				if (!isRedundant[j] && null != strs[j]
						&& strs[j].equals(strs[i]))
					isRedundant[j] = true;
			if (!isRedundant[i])
				result += strs[i] + regex;
		}
		return result;
	}

	public static String toString(String[] str, String regex) {
		String string = "";
		for (int i = 0; i < str.length; i++) {
			if (str[i] != null && str[i].trim().length() > 0)
				string += "'" + str[i] + "'" + regex;
		}
		string = string.trim();
		if (string.endsWith(regex))
			string = string.substring(0, string.length() - 1);
		return string;
	}

	/**
	 * 将str1和str2的字符串用regex分割，剔除重复的子串，然后把两者合并。
	 * 
	 * @param str1
	 * @param str2
	 * @param regex
	 * @return
	 * @author 裴伟斌 2006-10-26
	 */
	public String appendUnique(String str1, String str2, String regex) {
		if (null == str1 && null == str2)
			return null;
		if (null == str1 && null != str2)
			return makeUnique(str2, regex);
		if (null == str2 && null != str1)
			return makeUnique(str1, regex);
		if (null == regex)
			return str1 + str2;
		return makeUnique(str1 + str2, regex);
	}

	/**
	 * 从数组strs1中将包含在数组strs2中的元素给剔除出去。
	 * 
	 * @param strs1
	 * @param strs2
	 * @return
	 * @author 裴伟斌 2006-10-26
	 */
	public String[] removeStrings(String[] strs1, String[] strs2) {
		if (null == strs1 || null == strs2 || strs1.length < 1
				|| strs2.length < 1)
			return strs1;
		int len1 = strs1.length;
		int len2 = strs2.length;
		boolean willBeRemoved;
		List remainList = new ArrayList();
		for (int i = 0; i < len1; i++) {
			willBeRemoved = false;
			for (int j = 0; j < len2; j++)
				if (null != strs2[j] && strs2[j].equals(strs1[i])) {
					willBeRemoved = true;
				}
			if (!willBeRemoved)
				remainList.add((String) strs1[i]);
		}
		return (String[]) remainList.toArray(new String[0]);
	}

	/**
	 * 用regex把str1和str2分割成数组之后，再从str1分割出来的数组中剔除包含在从str2种分割出来的数组中的元素。
	 * 最后返回用regex为分隔符拼成的数组字符串。
	 * 
	 * @param str1
	 * @param str2
	 * @param regex
	 * @return
	 * @author 裴伟斌 2006-10-26
	 */
	public String removeString(String str1, String str2, String regex) {
		if (null == str1 || null == str2 || "".equals(str2) || "".equals(str1)
				|| null == regex)
			return str1;
		String strs[] = removeStrings(str1.split(regex), str2.split(regex));
		String result = "";
		for (int i = 0; i < strs.length; i++)
			if (null != strs[i])
				result += strs[i] + regex;
		return result;
	}

	/**
	 * 将数组strs中为null或者为""的元素剔除
	 * 
	 * @param strs
	 * @return
	 * @author 裴伟斌 2006-10-26
	 */
	public String[] removeNull(String[] strs) {
		if (null == strs || strs.length < 1)
			return strs;
		List strList = new ArrayList();
		for (int i = 0; i < strs.length; i++) {
			if (null != strs[i] && !"".equals(strs[i].trim())) {
				strList.add((String) strs[i].trim());
			}
		}
		return (String[]) strList.toArray(new String[0]);
	}

	/**
	 * 改变str中strKeyList中的多个字符颜色为red
	 */
	public static String getSetRedString(String str, List strKeyList) {
		if (str == null)
			return null;
		if (strKeyList == null || strKeyList.size() < 0)
			return str;
		String flag = "";
		for (int i = 0; i < strKeyList.size(); i++) {
			flag = (String) strKeyList.get(i);
			if (flag != null && !flag.equals("")) {
				if (str.indexOf(flag) >= 0) {
					str = str.replaceAll(flag, "<font color='red'>" + flag
							+ "</font>");
				}
			}
		}
		return str;
	}

	/**
	 * 
	 * @作者:胡龙兵 时间：2007-11-3
	 * @方法描述：截取一个字符串指定长度的前几个字符
	 * @参数描述：
	 * @param src
	 *            要截取的字符串
	 * @param len
	 *            要截取的长度
	 * @return
	 */
	public static String getStr(String src, int length) {
		if (src == null)
			return null;
		int len = length - 3;
		if (src.getBytes().length <= len)
			return src;
		byte[] s = src.getBytes();
		int flag = 0;
		for (int i = 0; i < len; ++i) {
			if (s[i] < 0)
				flag++;
		}
		if (flag % 2 != 0)
			len--;
		byte[] d = new byte[len];
		System.arraycopy(s, 0, d, 0, len);
		String ss = new String(d) + "...";
		return ss;
	}

	/**
	 * 
	 * @作者:胡龙兵 时间：2007-11-3
	 * @方法描述：截取一个字符串指定长度的前几个字符
	 * @参数描述：
	 * @param src
	 *            要截取的字符串
	 * @param len
	 *            要截取的长度
	 * @return
	 */
	public static String getStrNo(String src, int length) {
		if (src == null)
			return null;
		int len = length - 3;
		if (src.getBytes().length <= len)
			return src;
		byte[] s = src.getBytes();
		int flag = 0;
		for (int i = 0; i < len; ++i) {
			if (s[i] < 0)
				flag++;
		}
		if (flag % 2 != 0)
			len--;
		byte[] d = new byte[len];
		System.arraycopy(s, 0, d, 0, len);
		String ss = new String(d);
		return ss;
	}

	/**
	 * 
	 * @作者:尹威 时间：2009-2-9
	 * @方法描述：将传入的null值该为空串
	 * @参数描述：
	 * @param src
	 *            要判断的对象
	 * @return
	 */
	public static String nullToString(Object obj) {
		if (obj == null || "null".equals(obj.toString())) {
			obj = "";
		}
		return String.valueOf(obj).trim();
	}

	/**
	 * 对关键字检索，字符截取的处理
	 * 
	 * @param searchkey
	 *            搜索的关键字
	 * @param targetStr
	 *            目标字符串
	 * @param num
	 *            截取的宽度
	 * @return
	 */
	public static String subStringSearchKey(String[] searchkey,
			String targetStr, int num) {
		String str = "";
		if (searchkey.length != 0 && !searchkey[0].equals("")
				&& nullToString(targetStr).length() != 0) {
			for (int i = 0; i <= searchkey.length - 1; i++) {
				int addressIndex = targetStr.indexOf(searchkey[i]);

				if (addressIndex != -1) {
					if (addressIndex >= num) {
						str += targetStr.substring(addressIndex - num,
								addressIndex + searchkey[i].length());
					} else {
						str += targetStr.substring(0, addressIndex
								+ searchkey[i].length());
					}

					if (targetStr.length() - addressIndex
							- searchkey[i].length() <= num) {
						str += targetStr.substring(addressIndex
								+ searchkey[i].length());
					} else {
						str += targetStr.substring(addressIndex
								+ searchkey[i].length(), addressIndex
								+ searchkey[i].length() + num);
					}
				} else {
					str = targetStr;
				}
			}

		} else {
			str = targetStr;
		}
		return str;
	}

	/**
	 * 把文本处理成html
	 * @param s
	 * @return
	 */
	public static String htmLEncode(String s) {
		char[] htmlChars = s.toCharArray();
		StringBuffer encodedHtml = new StringBuffer();
		for (int i = 0; i < htmlChars.length; i++) {
			switch (htmlChars[i]) {
			case '<':
				encodedHtml.append("&lt;");
				break;
			case '>':
				encodedHtml.append("&gt;");
				break;
			case '&':
				encodedHtml.append("&amp;");
				break;
			case '\'':
				encodedHtml.append("&#39;");
				break;
			case '"':
				encodedHtml.append("&quot;");
				break;
			case '\\':
				encodedHtml.append("&#92;");
				break;
			case (char) 133:
				encodedHtml.append("&#133;");
				break;
			default:
				encodedHtml.append(htmlChars[i]);
				break;
			}
		}
		return encodedHtml.toString();
	}
	
	/**
	 * 去掉字符串首尾的空格和';'
	 * @param string
	 * @return
	 */
	public static String getTrimStr(String string)
	{
		if(string==null || string.isEmpty())return "";
		string = string.trim();
		if(string.endsWith(";")){string = string.substring(0,string.length()-1);} 
		if(string.startsWith(";")){string = string.substring(1,string.length());}
		return string;
	}

	/**
	* creat by zxs at 2009-07-21
	* 取得两个时间段的时间间隔
	* return t2 与t1的间隔天数
	* throws ParseException 如果输入的日期格式不是0000-00-00 格式抛出异常
	*/
	public static int getBetweenDays(String t1,String t2) throws ParseException{
	DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	int betweenDays = 0;
	Date d1 = format.parse(t1);
	Date d2 = format.parse(t2);
	Calendar c1 = Calendar.getInstance();
	Calendar c2 = Calendar.getInstance();
	c1.setTime(d1);
	c2.setTime(d2);
	// 保证第二个时间一定大于第一个时间
	if(c1.after(c2)){
	c1 = c2;
	c2.setTime(d1);
	}
	int betweenYears = c2.get(Calendar.YEAR)-c1.get(Calendar.YEAR);
	betweenDays = c2.get(Calendar.DAY_OF_YEAR)-c1.get(Calendar.DAY_OF_YEAR);
	for(int i=0;i<betweenYears;i++){
	c1.set(Calendar.YEAR,(c1.get(Calendar.YEAR)+1));
	betweenDays += c1.getMaximum(Calendar.DAY_OF_YEAR);
	}
	return betweenDays;
	} 	

	


    /**
	 * @see 判断字符串是否为"" 是的话转为null 
	 * @param obj
	 * @return
	 */
	public static String stringToNull(String str) {
		if (str != null && "".equals(str)) {
			str = null;
		}
		return str;
	}	
	
	/**
	 * @see 判断字符串是否是数字
	 * @param str
	 * @return
	 */
	public static boolean isNumeric(String str) {
		if ("".equals(nullToString(str))) {
			return false;
		}
		Pattern pattern = Pattern.compile("[0-9]*");
		Matcher isNum = pattern.matcher(str);
		if (!isNum.matches()) {
			return false;
		}
		return true;
	} 

	/**
	 * @see 字符串转换为数字 不是数字的置为0
	 * @param str
	 * @return
	 */
	public static int string2Integer(String str){
		if (isNumeric(str)) {
			return Integer.parseInt(str);
		}else{
			return 0;
		}
	}

	/**
	 * @see 字符串转换为数字 不是数字的置为0
	 * @param str
	 * @return
	 */
	public static Short string2Short(String str){
		if (isNumeric(str)) {
			try {
				return Short.valueOf(str);	
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}
		}else{
			return 0;
		}
	}
	
	/**
	 * 字符串转换为布尔类型
	 * @param paramString
	 * @return
	 */
	public static Boolean strToBool(String paramString) {
		if (paramString == null)
			return null;
		Boolean localBoolean = null;
		try {
			localBoolean = new Boolean(paramString);
		} catch (Exception localException) {
			localBoolean = null;
		}
		return localBoolean;
	}
	
	
	// 此函数过滤用，防止SQL注入
	public static String stringFilter(String str){
		if(StringUtil.nullToString(str).equals("")){
			return str;
		}
		String paraValue= StringUtil.nullToString(str).replaceAll("'","’");
		paraValue= paraValue.replaceAll("--","－－");
//		String regEx = "[^A-Z0-9]*(update|select|insert|declare|execute|drop|sysobjects|alter|create|table_cursor)\s{1,}";
		return null;
	}
	
	public static String sqlDealStr(String str){
		if (str == null) {
			return str;
		}
		str = str.replaceAll("'","");
		str = str.replaceAll(" ","");
		str = str.replaceAll("@","");
		str = str.replaceAll("%","");
		str = str.replaceAll("\\+","");
		str = str.replaceAll(";","");	
		str = str.replaceAll("[\\pP‘’“”]", "");	
		return str;
	}
	public static void main(String args[]) {
/*		String b = getStr("是个wer蛋,是不是啊", 10);
		String str = "'hdhhd'";

		String sta = "asfdasfd是个wer蛋,是不是啊";
		String[] d = new String[] { "wer", "," };

		String ab = subStringSearchKey(d, sta, 5);
		System.out.println(ab);
		String t1 = "2008-05-09";
		String t2 = "2009-5-13";

		try {
		System.out.println(StringUtil.getBetweenDays(t1, t2));
		} catch (ParseException e) {
		e.printStackTrace();
		} */
	}
}
