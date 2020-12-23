<%@ page language="java"
	import="java.io.*,java.sql.*,javax.sql.*,javax.naming.*"%>
<%@ page import="org.springframework.jdbc.core.JdbcTemplate" %>
<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	/** sqlserver 链接方式Statement执行插入； **/
	out.println("执行开始！<br>");
	Connection   conn=null;
	Statement  stmt=null;
	Connection connDes=null;
	Statement  stmtDes=null;
	long start_time = System.currentTimeMillis();
	System.out.println("开始时间："+System.nanoTime());
	try
	{
		//the information of source database;
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
		String url="jdbc:sqlserver://192.168.192.240:1433; DatabaseName=erp_jianshejiaowu";
		String user="erp_dp";
		String password="3DD609B7-FED0-49FA-9F21-5E08A4F7609E";
		conn=DriverManager.getConnection(url,user,password);
//		conn.setAutoCommit(false);
		stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
		String base_sql="select * from A_admin_user_info";
		ResultSet rs = stmt.executeQuery(base_sql);

		//the information of destination database;
		String urlDes="jdbc:sqlserver://192.168.172.54:1433; DatabaseName=erp_jianshejiaowu";
		String userDes="erp_dp";
		String passwordDes="3DD609B7-FED0-49FA-9F21-5E08A4F7609E";
		connDes=DriverManager.getConnection(urlDes,userDes,passwordDes);
//		connDes.setAutoCommit(false);
		stmtDes=connDes.createStatement();
		String des_sql="insert into A_admin_user_info(id,username,password) values(";
		stmtDes.addBatch("set IDENTITY_INSERT A_admin_user_info on");
		connDes.commit();
		stmtDes.addBatch("truncate table A_admin_user_info");
		while (rs.next()){
			String insert_sql="";
			insert_sql=des_sql+rs.getString("id")+","+
			"'"+rs.getString("username")+"','"
			+rs.getString("password")+"')";
			System.out.println("insert_sql==="+insert_sql);
			stmtDes.addBatch(insert_sql);
		}
		stmtDes.addBatch("set IDENTITY_INSERT A_admin_user_info off");
		int b[] = stmtDes.executeBatch();
		for (int a:b) {
			System.out.println(a);
		}
		System.out.println("b||||"+b.length);
		connDes.commit();
		System.out.println("结束时间："+System.nanoTime());

		stmtDes.close();
		connDes.close();

		stmt.close();
		conn.close();
	}     
	catch(Exception e)
	{
		e.printStackTrace();
	}finally {
		stmt.close();
		conn.close();
		out.println("执行完毕！");
	}
	%>
</body>
</html>