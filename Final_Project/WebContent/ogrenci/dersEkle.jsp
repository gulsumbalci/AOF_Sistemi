<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="css/table_style.css" type="text/css" rel="stylesheet">
<link href="css/menu_style.css" type="text/css" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<import com.mysql.jdbc.Connection;>
<%@ page import="java.sql.* "%>
</head>
<body>
<%
int o_id=Integer.parseInt(request.getParameter("o_id"));
int d_id=Integer.parseInt(request.getParameter("d_id"));
session.setAttribute("o_id", o_id);
session.setAttribute("d_id", d_id);
session.setAttribute("ogrenciAd", request.getParameter("o_ad"));
%>

<ul>
  <li><a href="ogrenci.jsp?id=<%= Integer.parseInt(request.getParameter("o_id"))%>&ad=<%= request.getParameter("o_ad") %>">Anasayfa</a></li>
  <li><a href="../login/ogrenciLogin.jsp">Cikis</a></li>
</ul>

<form action="dersOnayla.jsp" method="post">
<table id="customers">
	<tr>
		<th colspan="2">Ders Onaylama</th>
	</tr>
	<tr>
		<td>Ders Ad:</td>
		<td><%= request.getParameter("d_ad") %></td>
	</tr>
	<tr>
		<td>Ogrenci Ad:</td>
		<td><%= request.getParameter("o_ad") %></td>
	</tr>
	<tr>
		<td colspan="2" align="left"><input type="submit" value="Onayla"></td>
	</tr>
</table>
</form>
</body>
</html>