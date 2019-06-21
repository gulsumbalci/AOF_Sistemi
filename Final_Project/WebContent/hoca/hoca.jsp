<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<import com.mysql.jdbc.Connection;>
<%@ page import="java.sql.* "%>

<link href="css/table_style.css" type="text/css" rel="stylesheet">
<link href="css/menu_style.css" type="text/css" rel="stylesheet">

</head>
<body>
<%
//int id_o=Integer.parseInt(request.getParameter("id"));
//String ad=request.getParameter("ad");
//System.out.print(id_o);

Connection con;
PreparedStatement pst;
ResultSet rs;
try {
	Class.forName("com.mysql.jdbc.Driver");
    con=(Connection)DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/aof_db","root", "gulsum14");  
	if(!con.isClosed()){
		%>
		<font size="+2" color="green">
		<% 
	
		PreparedStatement preStmt;
		preStmt = con.prepareStatement("select * from dersler");
	    rs = preStmt.executeQuery();
	%>

		<ul>
		  <li><a href="#"><% out.print(request.getParameter("ad")); %></a></li>
		  <li><a href='hocaBilgiDuzenle.jsp?h_id=<%= Integer.parseInt(request.getParameter("id")) %>&h_ad=<%= request.getParameter("ad")%>'>Bilgilerimi Duzenle</a></li>
		  <li><a href="../login/hocaLogin.jsp">Cikis</a>
		  </li>
		</ul>
<div>

	<table id="customers">
	  <tr>
	    <th>Tum Dersler Id</th>
	    <th>Tum Dersler Ad</th>
	    <th>Soru Girme</th>
	  </tr>
	  
	<%
		while (rs.next()) {
	    %>
		<tr>
		    <td><%=rs.getInt("ders_id")%></td>
		    <td ><%=rs.getString("ders_ad")%></td>
		    <td><a href="soruGir.jsp?h_id=<%=Integer.parseInt(request.getParameter("id")) %>&d_id=<%= rs.getInt("ders_id")%>&h_ad=<%= request.getParameter("ad")%>">Soru Gir</a></td>
	        </tr> 	  
		<%	
		}	
		%>
		</table>
</div>
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