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
int h_id=Integer.parseInt(session.getAttribute("hoca_id").toString());
String h_ad=request.getParameter("txthad");
String h_bolum=request.getParameter("txthbolum");
String h_mail=request.getParameter("txthmail");
String h_tel=request.getParameter("txthtel");
String h_ka=request.getParameter("txthka");
String h_sifre=request.getParameter("txthsifre");

try {
	String connectionURL = "jdbc:mysql://127.0.0.1:3306/aof_db";  
	Connection connection = null; 
	Statement   stmt  = null;
	ResultSet   rs  = null; 
	Class.forName("com.mysql.jdbc.Driver"); 
	connection = DriverManager.getConnection(connectionURL, "root", "gulsum14");
	
	String sorgu = "UPDATE hocalar SET hoca_ad='"+h_ad+"',hoca_bolum='"+h_bolum+"',mail='"+h_mail+"',tel='"+h_tel+"',hoca_ka='"+h_ka+"',hoca_sifre='"+h_sifre+"' where hoca_id="+h_id+"";
	PreparedStatement psmt = connection.prepareStatement(sorgu);
	/*psmt.setString(1,ad);
	psmt.setString(2, yazar);
	psmt.setInt(3, Integer.valueOf(id));*/
	psmt.executeUpdate();
	//out.println("Veri updated....");
	response.sendRedirect("hocaListesi.jsp");


}
catch(Exception ex){
out.println("Hata vardir"+ex.getMessage());
}
%>
</body>
</html>