package com.devops.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	public static String formatDate(Date date)
	{
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return dateFormat.format(date);
	}
    /**
     * 按YYYY-MM-DD HH:MM:SS格式返回今天的日期.
     * 
     * @return String
     */
    public static String getToday() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 规定日期格式
        Date date = new Date(); // 将符合格式的String转换为Date
        String today = formatter.format(date); // 将Date转换为符合格式的String
        return today;
    }

    /**
     * 计算出与指定时间papaDay n天之后的时间
     * 
     * @return
     * @throws ParseException
     */
    public static String getAddDay(String papaDay, int num) {
        /*
         * SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
         * long lpara = 0 ; try { lpara = sdf.parse(papaDay).getTime(); lpara =
         * lpara + 24 * 60 * 60 * 1000 * num; return sdf.format(new
         * Date(lpara)); } catch (ParseException e) { return null; }
         */
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar calender = Calendar.getInstance();
        try {
            calender.setTime(sdf.parse(papaDay));
            calender.add(Calendar.DATE, num);
            return sdf.format(calender.getTime());
        } catch (ParseException e) {
            return null;
        }
    }

    /**
     * 计算出与指定时间papaDay n月之后的时间
     * 
     * @return
     * @throws ParseException
     */
    public static String getAddMonth(String papaDay, int num) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar calender = Calendar.getInstance();
        try {
            calender.setTime(sdf.parse(papaDay));
            calender.add(Calendar.MONTH, num);
            return sdf.format(calender.getTime());
        } catch (ParseException e) {
            return null;
        }
    }

    /**
     * 按yyyy-MM-dd格式返回今天的日期.
     * 
     * @return String
     */
    public static String getToday1() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); // 规定日期格式
        Date date = new Date(); // 将符合格式的String转换为Date
        String today = formatter.format(date); // 将Date转换为符合格式的String
        return today;
    }
    /**
     * 按yyyy-MM-dd-HH格式返回今天的日期.
     * 
     * @return String
     */
    public static String getTodayHour() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH"); // 规定日期格式
        Date date = new Date(); // 将符合格式的String转换为Date
        String today = formatter.format(date); // 将Date转换为符合格式的String
        return today;
    }
    /**
     * 按yyyy年MM月dd日HH时mm分ss秒格式返回今天的日期.
     * 
     * @return String
     */
    public static String getToday2() {
        SimpleDateFormat formatter = new SimpleDateFormat(
                "yyyy年MM月dd日HH时mm分ss秒"); // 规定日期格式
        Date date = new Date(); // 将符合格式的String转换为Date
        String today = formatter.format(date); // 将Date转换为符合格式的String
        return today;
    }

    /**
     * 按yyyyMMddHHmmss格式返回今天的日期.
     * 
     * @return String
     */
    public static String getToday3() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss"); // 规定日期格式
        Date date = new Date(); // 将符合格式的String转换为Date
        String today = formatter.format(date); // 将Date转换为符合格式的String
        return today;
    }

    /**
     * 按yyyyMMddHHmmsssss格式返回今天的日期.
     * 
     * @return String
     */
    public static String getToday4() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS"); // 规定日期格式
        Date date = new Date(); // 将符合格式的String转换为Date
        String today = formatter.format(date); // 将Date转换为符合格式的String
        return today;
    }
    
    /**
     * 按yyyyMMddHHmmsssss格式返回今天的日期.
     * 
     * @return String
     */
    public static String getToday6() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmsssss"); // 规定日期格式
        Date date = new Date(); // 将符合格式的String转换为Date
        String today = formatter.format(date); // 将Date转换为符合格式的String
        return today;
    }
    
    public static String getToday5() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd"); // 规定日期格式
        Date date = new Date(); // 将符合格式的String转换为Date
        String today = formatter.format(date); // 将Date转换为符合格式的String
        return today;
    }    /**
     * 返回今天的年份.
     * 
     * @return String
     */
    public static String getYear() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy"); // 规定日期格式
        Date date = new Date(); // 将符合格式的String转换为Date
        String today = formatter.format(date); // 将Date转换为符合格式的String
        return today;
    }

    /**
     * 返回今天的月份.
     * 
     * @return String
     */
    public static String getMonth() {
        SimpleDateFormat formatter = new SimpleDateFormat("MM"); // 规定日期格式
        Date date = new Date(); // 将符合格式的String转换为Date
        String today = formatter.format(date); // 将Date转换为符合格式的String
        return today;
    }

    /**
     * 返回今天的日子数.
     * 
     * @return String
     */
    public static String getDay() {
        SimpleDateFormat formatter = new SimpleDateFormat("dd"); // 规定日期格式
        Date date = new Date(); // 将符合格式的String转换为Date
        String today = formatter.format(date); // 将Date转换为符合格式的String
        return today;
    }

    /**
     * 返回指定的日期格式
     * @param type
     * @return
     */
    public static String getDayFormat(String dateStr,String type) {
        SimpleDateFormat formatter = new SimpleDateFormat(type); // 规定日期格式
        Date date = getDateByString(dateStr); // 将符合格式的String转换为Date
        String today = formatter.format(date); // 将Date转换为符合格式的String
        return today;
    }
    
    /**
     * 计算给定的两个时间相差的秒数:end - start
     * @param start
     * @param end
     * @return
     */
    public static long getDiffNum(String start,String end){
    	 long quot = 0;
    	  SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	  try {
    	   Date d_start = ft.parse( start );
    	   Date d_end = ft.parse( end );
    	   quot = d_end.getTime() - d_start.getTime();
    	   quot = quot / 1000 ;
//    	   / 60 / 60 / 24;
    	  } catch (ParseException e) {
    	   e.printStackTrace();
    	  }
    	  return Math.abs(quot);
    }    
    
    public static long getDiffNum(Date start,Date end){
   	 long quot = 0;
   	  quot = end.getTime() - start.getTime();
   	  quot = quot / 1000 ;
//   	   / 60 / 60 / 24;
   	  return Math.abs(quot);
   }    
    
    /**
     * 
     * @param date1
     * @param date2
     * @return 0 相等 + 大于 - 小于
     */
    public static int compareDate(String date1, String date2){
    	SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	Calendar c1 = Calendar.getInstance();
    	Calendar c2 = Calendar.getInstance();
    	try {
			c1.setTime(ft.parse(date1));
			c2.setTime(ft.parse(date2));
		} catch (Exception e) {
		}
		int result = c1.compareTo(c2);
		return result;
    }
    
    public static String getTodayToString() {
        return getYear() + getMonth() + getDay();

    }

    
    public static Date getDateByString(String dateTimeStr) {
    	Date date = null; 
    	SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	try {
			date = ft.parse(dateTimeStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
    	
        return date;

    }
    
    public static Date getDateByString1(String dateTimeStr) {
    	Date date = null; 
    	SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM");
    	try {
			date = ft.parse(dateTimeStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
    	
        return date;

    }
    
    /**
     * @author zxs 2010-4-6
     * @see 对日期时间进行加减运算操作
     * @param date
     * @param type y = year m = month d = date h = hour m = minute s = second
     * @param num  正数加法 负数减法
     * @return
     */
    public static Date getDateSub(Date date,String type, int num){
    	Calendar calender = Calendar.getInstance();
        calender.setTime(date);
		if (type.equals("y")) {
			calender.add(Calendar.YEAR, num);				
		}
		if (type.equals("M")) {
			calender.add(Calendar.MONTH, num);				
		}
		if (type.equals("d")) {
			calender.add(Calendar.DATE, num);				
		}
		if (type.equals("h")) {
			calender.add(Calendar.HOUR, num);				
		}
		if (type.equals("m")) {
			calender.add(Calendar.MINUTE, num);				
		}
		if (type.equals("s")) {
			calender.add(Calendar.SECOND, num);				
		}
		return calender.getTime();
    }

    public static String getDateSub(String date,String type, int num){
    	Date day = getDateByString(date);
    	Calendar calender = Calendar.getInstance();
    	calender.setTime(day);
    	if (type.equals("y")) {
    		calender.add(Calendar.YEAR, num);				
    	}
    	if (type.equals("M")) {
    		calender.add(Calendar.MONTH, num);				
    	}
    	if (type.equals("d")) {
    		calender.add(Calendar.DATE, num);				
    	}
    	if (type.equals("h")) {
    		calender.add(Calendar.HOUR, num);				
    	}
    	if (type.equals("m")) {
    		calender.add(Calendar.MINUTE, num);				
    	}
    	if (type.equals("s")) {
    		calender.add(Calendar.SECOND, num);				
    	}
    	return getDateTOString(calender.getTime());
    }
    
    
    /**
     * date 类型转换为string类型
     * @param date
     * @return
     */
    public static String getDateTOString(Date date){
    	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 规定日期格式
        String today = formatter.format(date); // 将Date转换为符合格式的String
        return today;
    }
    
    public static void main(String[] args) {
    	Date today = new Date();
    	Date a = getDateSub(today, "h", -12);
    }
}
