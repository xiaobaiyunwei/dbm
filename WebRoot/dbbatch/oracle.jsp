<%@ page language="java"
	import="java.io.*,java.sql.*,javax.sql.*,javax.naming.*"%>
<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	/** Oracle 链接方式 **/
	try     
	{     
		Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
		String url="jdbc:oracle:thin:@192.168.190.245:1521:CDCD";
		String user="G12ETEST";
		String password="test123";
		Connection   conn=   DriverManager.getConnection(url,user,password);
		conn.setAutoCommit(false);
		//Statement   stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
		String base_sql="insert into IVR_MENU_INFO (IVR_MENU_ID,CALLER_NUMBER,CALLED_NUMBER,SSP_ID,IVR_MENU_TYPE_CODE,CHANGE_CHOICE)" 
				+"values (?,?,?,?,?,?)";
		PreparedStatement insertStat = conn.prepareStatement(base_sql);
	
		String str[]={"good","great","wonderful","awesome","fantastic","beautiful","perfect","terrific"};
		long start_time = System.currentTimeMillis();
		
		for(int i=1;i<=5000000;i++){
			String insert_sql="";
			int index =(int)(Math.random()*str.length);			
			insertStat.setInt(1, i);
			insertStat.setString(2, "10");
			insertStat.setString(3, "8");
			insertStat.setInt(4, i);
			insertStat.setString(5, str[index]);
			insertStat.setString(6, "1");			
			insertStat.addBatch();
			if(i%1000==0){
				insertStat.executeBatch();
				conn.commit();
				System.out.println("正在执行第"+i+"条记录！");
			}
		}				
		System.out.println("开始时间："+start_time);
		System.out.println("结束时间："+System.currentTimeMillis());
		insertStat.close();
		conn.close();
	}     
	catch(Exception e)
	{
		out.println(e);
	}

	%>
</body>
</html>