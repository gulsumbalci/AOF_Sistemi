<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link href="css/table_style.css" type="text/css" rel="stylesheet">
<link href="css/menu_style.css" type="text/css" rel="stylesheet">

</head>
<body>

<font size="+1">
<ul>
  <li><a href="hoca.jsp?id=<%= Integer.parseInt(request.getParameter("h_id"))%>&ad=<%= request.getParameter("h_ad")%>">Anasayfa</a>
  <li><a href="../login/hocaLogin.jsp">Cikis</a>
  </li>
</ul>

<%
int d_id=Integer.parseInt(request.getParameter("d_id").toString());
int h_id=Integer.parseInt(request.getParameter("h_id").toString());
session.setAttribute("d_id", d_id);
session.setAttribute("h_id", h_id);
session.setAttribute("h_ad", request.getParameter("h_ad"));
/*System.out.print(d_id);
System.out.print(h_id);*/
%>
<form action="soruKaydet.jsp" method="post">
<table id="customers">
	<tr>
		<th colspan="2"> Soru Girme Ekrani</th>
	</tr>

<tr>
<td>Soru Text:</td>
<td><textarea type="text" name="txtsoru" ></textarea></td>
</tr>

<tr>
<td>A</td>
<td><input type="text" name="txta"></td>
</tr>

<tr>
<td>B</td>
<td><input type="text" name="txtb"></td>
</tr>

<tr>
<td>C</td>
<td><input type="text" name="txtc"></td>
</tr>

<tr>
<td>D</td>
<td><input type="text" name="txtd"></td>
</tr>
<tr><td colspan="2" align="center"> <input type="submit" value="Kaydet"></td></tr>
</table>
</form>
</font>
</body>
</html>