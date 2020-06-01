<%@ page language="java"
	import="java.io.*,java.sql.*,javax.sql.*,javax.naming.*"%>
<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
	/** sqlserver 链接方式Statement执行插入； **/
	try     
	{     
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		String url="jdbc:sqlserver://192.168.190.11:3306; DatabaseName=reuri";
		String user="root";
		String password="123qwe";
		Connection   conn=   DriverManager.getConnection(url,user,password);
		conn.setAutoCommit(false);
		Statement   stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
		String base_sql="insert into IVR_MENU_INFO (IVR_MENU_ID,CALLER_NUMBER,CALLED_NUMBER,SSP_ID,IVR_MENU_TYPE_CODE,CHANGE_CHOICE) values (";
		String str[]={",'good'",",'great'",",'wonderful'",",'awesome'",",'fantastic'",",'beautiful'",",'perfect'",",'terrific'"};
		long start_time = System.currentTimeMillis();		
		for(int i=1;i<=5000000;i++){
			String insert_sql="";
			int index =(int)(Math.random()*str.length);
			insert_sql=base_sql+i+",'10'"+",'8',"+i+str[index]+",'1')";			
			stmt.addBatch(insert_sql);
			if(i%1000==0){
				stmt.executeBatch();
				conn.commit();
				System.out.println("正在执行第"+i+"条记录！");
			}
		}				
		System.out.println("开始时间："+start_time);
		System.out.println("结束时间："+System.currentTimeMillis());
		stmt.close();
		conn.close();
	}     
	catch(Exception e)
	{
		out.println(e);
	}

	%>
</body>
</html>