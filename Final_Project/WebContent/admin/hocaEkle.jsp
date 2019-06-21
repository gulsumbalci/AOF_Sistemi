<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<import com.mysql.jdbc.Connection;>
<%@ page import="java.sql.* "%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style>
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
</style>

</head>
<body>
<div>
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
</div>
<div>
<form action="hocaKaydet.jsp" method="post">
<table id="customers">
<tr>
<th colspan="2" align="center">Hoca Ekleme</th>
</tr>
<tr>
<td>Hoca Adi:</td>
<td><input type="text" name="txtad"></input></td>
</tr>
<tr>
<td>Hoca Bolum:</td>
<td><input type="text" name="txtbolum"></input></td>
</tr>
<tr>
<td>Mail Adresi:</td>
<td><input type="text" name="txtmail"></input></td>
</tr>
<tr>
<td>Telefon Numarasi:</td>
<td><input type="text" name="txttel"></input></td>
</tr>
<tr>
<td>Kullanici Adi:</td>
<td><input type="text" name="txtka"></input></td>
</tr>
<tr>
<td>Sifre:</td>
<td><input type="text" name="txtsifre"></input></td>
</tr>
<tr><td colspan="2" align="center" ><input type="submit" value="Kaydet"></td></tr>
</table>
</form>
</div>
</body>
</html>