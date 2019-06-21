<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int id=Integer.parseInt(session.getAttribute("s_id").toString());
String text=request.getParameter("txtsoru");
String a=request.getParameter("a");
String b=request.getParameter("b");
String c=request.getParameter("c");
String d=request.getParameter("d");

try {
	String connectionURL = "jdbc:mysql://127.0.0.1:3306/aof_db";  
	Connection connection = null; 
	Statement   stmt  = null;
	ResultSet   rs  = null; 
	Class.forName("com.mysql.jdbc.Driver"); 
	connection = DriverManager.getConnection(connectionURL, "root", "gulsum14");
	
	String sorgu = "UPDATE soru SET text='"+text+"',a='"+a+"',b='"+b+"',c='"+c+"',d='"+d+"' where soru_id="+id+"";
	PreparedStatement psmt = connection.prepareStatement(sorgu);
	psmt.executeUpdate();
	//out.println("Veri updated....");
	response.sendRedirect("soruListesi.jsp");


}
catch(Exception ex){
out.println("Hata vardir"+ex.getMessage());
}
%>
</body>
</html>