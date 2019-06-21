<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
}

li a, .dropbtn {
    display: inline-block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
    background-color: red;
}

li.dropdown {
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
}
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}
</style>

<import com.mysql.jdbc.Connection;>
<%@ page import="java.sql.* "%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<ul>
<li><a href="admin.jsp">Anasayfa</a></li>
   <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">Hoca Islemleri</a>
    <div class="dropdown-content">
      <a href="hocaListesi.jsp">Hoca Listesi</a>
      <a href="hocaEkle.jsp">Hoca Ekle</a>
    </div>
  </li>
  <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">Ogrenci Islemleri</a>
    <div class="dropdown-content">
      <a href="ogrenciListesi.jsp">Ogrenci Listesi</a>
      <a href="ogrenciEkle.jsp">Ogrenci Ekle</a>
    </div>
  </li>
  <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">Ders Islemleri</a>
    <div class="dropdown-content">
      <a href="dersListesi.jsp">Tum Dersler</a>
      <a href="dersEkle.jsp">Ders Ekle</a>
    </div>
  </li>
  <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">Soru Islemleri</a>
    <div class="dropdown-content">
      <a href="soruListesi.jsp">Tum Sorular</a>
      <a href="soruEkle.jsp">Soru Ekle</a>
    </div>
  </li>
</ul>

<% int d_id=Integer.parseInt(request.getParameter("d_id"));
//String ad=request.getParameter("ad");
Connection con;
PreparedStatement pst;
ResultSet rs;
try {
	Class.forName("com.mysql.jdbc.Driver");
    con=(Connection)DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/aof_db","root", "gulsum14");  
	if(!con.isClosed()){
		%>
		<font size="+2">
		<% 
	
		PreparedStatement preStmt;
		preStmt = con.prepareStatement("select * from ogrenciler where ogr_id in (select ogr_id from ogr_al_ders where ders_id="+d_id+")");
	    rs = preStmt.executeQuery();
	%>
	<table id="customers">
	  <tr>
	    <th colspan="5">Dersi Alan Ogrenciler </th>
	  </tr>
	  <tr>
	  	<th>Ad</th>
	  	<th>T.C</th>
	  	<th>Bolum</th>
	  	<th>Kullanici Ad</th>
	  	<th>Sifre</th>
	  </tr>
	  
	<%
		while (rs.next()) {
	    %>
		<tr>
		    <td ><%=rs.getString("ogr_ad")%></td>
		    <td ><%=rs.getString("ogr_tc")%></td>
		    <td ><%=rs.getString("ogr_bolum")%></td>
		    <td ><%=rs.getString("ogr_ka")%></td>
		    <td ><%=rs.getString("ogr_sifre")%></td>
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