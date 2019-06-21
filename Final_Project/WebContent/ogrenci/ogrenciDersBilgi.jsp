<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="css/table_style.css" type="text/css" rel="stylesheet">
<link href="css/menu_style.css" type="text/css" rel="stylesheet">

<import com.mysql.jdbc.Connection;>
<%@ page import="java.sql.* "%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% int o_id=Integer.parseInt(request.getParameter("o_id"));
String ad=request.getParameter("ad");
Connection con;
PreparedStatement pst;
ResultSet rs;
try {
	Class.forName("com.mysql.jdbc.Driver");
    con=(Connection)DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/aof_db","root", "gulsum14");  
	if(!con.isClosed()){
		%>
		<font size="+2">
			<ul>
			  <li><a href="ogrenci.jsp?id=<%= Integer.parseInt(request.getParameter("o_id"))%>&ad=<%= request.getParameter("ad")%>">Anasayfa</a>
			  <li><a href="../login/ogrenciLogin.jsp">Cikis</a>
			  </li>
			</ul>
		<% 
	
		PreparedStatement preStmt;
		preStmt = con.prepareStatement("select * from dersler where ders_id in (select ders_id from ogr_al_ders where ogr_id="+o_id+")");
	    rs = preStmt.executeQuery();
	%>
	<table id="customers">
	  <tr>
	    <th>Alinan Dersler </th>
	  </tr>
	  
	<%
		while (rs.next()) {
	    %>
		<tr>
		    <td ><%=rs.getString("ders_ad")%></td>
	    </tr> 	  
		<%	
		}	
		%>
	</table>
		<%
		preStmt.close();
		con.close();
			
		}
	}
catch(Exception ex){
%>
</font>
<font size="+3" color="red">
<%
out.println("Unable to connect to database.");
}
%>
</body>
</html>