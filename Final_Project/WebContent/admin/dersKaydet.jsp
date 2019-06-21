<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page import="java.sql.*" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String ad=request.getParameter("txtad");

Connection con;
PreparedStatement pst;
ResultSet rs;
Statement st;
/* System.out.print(o_id);
System.out.print(d_id);*/
try{
	Class.forName("com.mysql.jdbc.Driver");
    con=(Connection)DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/aof_db","root", "gulsum14");  
	
	if(!con.isClosed()){
		pst = con.prepareStatement("INSERT INTO dersler (ders_ad) VALUES (?)");
	    pst.setString(1, ad);
		pst.executeUpdate();
		//pst.close();
		
		out.println("Veriler kaydedilmistir");
		response.sendRedirect("dersListesi.jsp");
	}
}
catch(Exception e){
	System.out.println("Unable to connect to database.");
}
%>
</body>
</html>