<%@ page language="java" contentType="text/html; charset=ISO-8859-9" pageEncoding="ISO-8859-9"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%
/*int id = Integer.parseInt(session.getAttribute("id").toString());*/

%>
</head>

<body>
<% 
try {
	int id=Integer.parseInt(session.getAttribute("tut_id").toString());
	String ad = request.getParameter("txtad");
	String bolum = request.getParameter("txtbolum");
	String mail=request.getParameter("txtmail");
	String tel=request.getParameter("txttel");
	String ka=request.getParameter("txtka");
	String sifre=request.getParameter("txtsifre");
	
	String connectionURL = "jdbc:mysql://127.0.0.1:3306/aof_db";  
	Connection connection = null; 
	Statement   stmt  = null;
	ResultSet   rs  = null; 
	Class.forName("com.mysql.jdbc.Driver"); 
	connection = DriverManager.getConnection(connectionURL, "root", "gulsum14");
	
	String sorgu = "UPDATE hocalar SET hoca_ad='"+ad+"',hoca_bolum='"+bolum+"',mail='"+mail+"',tel='"+tel+"',hoca_ka='"+ka+"',hoca_sifre='"+sifre+"' where hoca_id="+id+"";
	PreparedStatement psmt = connection.prepareStatement(sorgu);
	/*psmt.setString(1,ad);
	psmt.setString(2, yazar);
	psmt.setInt(3, Integer.valueOf(id));*/
	psmt.executeUpdate();
	System.out.println("Veri updated....");
	response.sendRedirect("hoca.jsp?id="+id+"&ad="+ad);


}
catch(Exception ex){
out.println("Hata vardir"+ex.getMessage());
}
%>

</body> 
</html>