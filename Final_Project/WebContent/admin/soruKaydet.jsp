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
String txt=request.getParameter("txt");
String a=request.getParameter("a");
String b=request.getParameter("b");
String c=request.getParameter("c");
String d=request.getParameter("d");
int hoca_id=Integer.parseInt(request.getParameter("hoca_id"));
int ders_id=Integer.parseInt(request.getParameter("ders_id"));

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
		pst = con.prepareStatement("INSERT INTO soru (text,a,b,c,d,hoca_id,ders_id) VALUES (?,?,?,?,?,?,?)");
	    pst.setString(1, txt);
	    pst.setString(2, a);
	    pst.setString(3, b);
	    pst.setString(4, c);
	    pst.setString(5, d);
		pst.setInt(6,hoca_id);
		pst.setInt(7,ders_id);
		pst.executeUpdate();
		//pst.close();
		
		System.out.println("Soru kaydedilmistir");
		response.sendRedirect("soruListesi.jsp");
	}
}
catch(Exception e){
	System.out.println("Unable to connect to database.");
}
%>
</body>
</html>