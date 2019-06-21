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
int id=Integer.parseInt(session.getAttribute("ogr_id").toString());
String ad=request.getParameter("txtad");
String tc=request.getParameter("txttc");
String bolum=request.getParameter("txtbolum");
String ka=request.getParameter("txtka");
String sifre=request.getParameter("txtsifre");

try {
	String connectionURL = "jdbc:mysql://127.0.0.1:3306/aof_db";  
	Connection connection = null; 
	Statement   stmt  = null;
	ResultSet   rs  = null; 
	Class.forName("com.mysql.jdbc.Driver"); 
	connection = DriverManager.getConnection(connectionURL, "root", "gulsum14");
	
	String sorgu = "UPDATE ogrenciler SET ogr_ad='"+ad+"',ogr_tc='"+tc+"',ogr_bolum='"+bolum+"',ogr_ka='"+ka+"',ogr_sifre='"+sifre+"' where ogr_id="+id+"";
	PreparedStatement psmt = connection.prepareStatement(sorgu);
	/*psmt.setString(1,ad);
	psmt.setString(2, yazar);
	psmt.setInt(3, Integer.valueOf(id));*/
	psmt.executeUpdate();
	//out.println("Veri updated....");
	response.sendRedirect("ogrenciListesi.jsp");


}
catch(Exception ex){
out.println("Hata vardir"+ex.getMessage());
}
%>
</body>
</html>