<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href="css/login_style.css" type="text/css" rel="stylesheet">

<title>Insert title here</title>
</head>
<body>
<div class="login">
  <div class="heading">
    <h2>Ogrenci Giris</h2>
    <form action="ogrLoginKontrol.jsp">

      <div class="input-group input-group-lg">
        <span class="input-group-addon"><i class="fa fa-user"></i></span>
        <input type="text" class="form-control" placeholder="Username or email" name="ogr_ka">
          </div>

        <div class="input-group input-group-lg">
          <span class="input-group-addon"><i class="fa fa-lock"></i></span>
          <input type="password" class="form-control" placeholder="Password" name="ogr_sifre">
        </div>

        <button type="submit" class="float">Giris</button>
       </form>
 		</div>
 </div>
</body>
</html>