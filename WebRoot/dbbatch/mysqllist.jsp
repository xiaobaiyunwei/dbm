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
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			String url = "jdbc:mysql://192.168.192.217:3306/test";
			String user = "root";
			String password = "****9999";
			Connection conn = DriverManager.getConnection(url, user, password);
			conn.setAutoCommit(false);
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			String base_sql = "select * from company";
			ResultSet rs = stmt.executeQuery(base_sql);
			while (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				System.out.println(id + "--" + id + "--" + name);
			}
			stmt.close();
			conn.close();
		} catch (Exception e) {
			out.println(e);
		}
	%>
</body>
</html>