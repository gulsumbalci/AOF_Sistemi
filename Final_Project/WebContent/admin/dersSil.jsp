<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<import com.mysql.jdbc.Connection;>
<%@ page import="java.sql.* "%>

</head>
<body>
<%
try{
	String connectionURL = "jdbc:mysql://127.0.0.1:3306/aof_db"; 
	Connection connection = null; 

	//Load JDBC driver "com.mysql.jdbc.Driver" 
	Class.forName("com.mysql.jdbc.Driver"); 
	connection = (Connection) DriverManager.getConnection(connectionURL, "root", "gulsum14");
	
	if(!connection.isClosed()){ 
		Statement   stmt  = null;
		ResultSet   rs  = null; 
		stmt = connection.createStatement();

		String sorgu = "delete from dersler where ders_id="+Integer.parseInt(request.getParameter("d_id"))+"";
		stmt.executeUpdate(sorgu);

		out.println("Tablodan ders silindi");
		response.sendRedirect("dersListesi.jsp");
	}
	
}
catch (Exception e){
	out.println("Hata olustu \t"+e.getMessage());
}
%>
</body>
</html>