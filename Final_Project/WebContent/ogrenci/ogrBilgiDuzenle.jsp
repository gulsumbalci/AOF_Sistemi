<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<link href="css/table_style.css" type="text/css" rel="stylesheet">
<link href="css/menu_style.css" type="text/css" rel="stylesheet">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%int g_id=Integer.parseInt(request.getParameter("o_id")) ;
session.setAttribute("tut_id", request.getParameter("o_id"));
System.out.print(g_id);%>
</head>
<body>
<font size="+2">
<ul>
  <li><a href="ogrenci.jsp?id=<%= Integer.parseInt(request.getParameter("o_id"))%>&ad=<%= request.getParameter("ad")%>">Anasayfa</a>
  <li><a href="../login/ogrenciLogin.jsp">Cikis</a>
  </li>
</ul>

<%
try {

	String connectionURL = "jdbc:mysql://127.0.0.1:3306/aof_db"; 
	Connection connection = null; 

	//Load JDBC driver "com.mysql.jdbc.Driver" 
	Class.forName("com.mysql.jdbc.Driver"); 
	connection = (Connection) DriverManager.getConnection(connectionURL, "root", "gulsum14");


	if(!connection.isClosed()){
		PreparedStatement preStmt;
		String sorgu="select * from ogrenciler where ogr_id="+g_id+"";
		preStmt = connection.prepareStatement(sorgu);
		ResultSet rs = preStmt.executeQuery();%>
<form action="ogrGuncelle.jsp" method="post">
<table id="customers">
<tr> <th colspan="2">Ogrenci Bilgi Guncelleme</th></tr>
<% 
while(rs.next()){		
			%> 
<tr>
<td>Ad:</td>
<td><input type="text" value="<%=rs.getString("ogr_ad")%>" name="txtad"></<input></td>
</tr>
<tr>
<td>T.C:</td>
<td><input type="text" value="<%=rs.getString("ogr_tc")%>" name="txttc"></<input></td>
</tr>
<tr>
<td>Bolum:</td>
<td><input type="text" value="<%=rs.getString("ogr_bolum")%>" name="txtbolum"></<input></td>
</tr>
<tr>
<tr>
<td>Kullanici Ad:</td>
<td><input type="text" value="<%=rs.getString("ogr_ka")%>" name="txtka"></<input></td>
</tr>
<td>Sifre:</td>
<td><input type="text" value="<%=rs.getString("ogr_sifre")%>" name="txtsifre"></<input></td>
</tr>

<tr><td>
<input type="submit" value="G�ncelle" name="guncelle">
</td></tr>
<%}%>
</table>
</form>
<%}
}
catch(Exception e){}
%>
</font>
</body> 
</html>