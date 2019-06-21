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
String tc=request.getParameter("txttc");
String bolum=request.getParameter("txtbolum");
String ka=request.getParameter("txtka");
String sifre=request.getParameter("txtsifre");

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
		pst = con.prepareStatement("INSERT INTO ogrenciler (ogr_ad,ogr_tc,ogr_bolum,ogr_ka,ogr_sifre) VALUES (?,?,?,?,?)");
	    pst.setString(1, ad);
	    pst.setString(2, tc);
	    pst.setString(3, bolum);
	    pst.setString(4, ka);
		pst.setString(5,sifre);
		pst.executeUpdate();
		//pst.close();
		
		out.println("Veriler kaydedilmistir");
		response.sendRedirect("ogrenciListesi.jsp");
	}
}
catch(Exception e){
	System.out.println("Unable to connect to database.");
}
%>
</body>
</html>