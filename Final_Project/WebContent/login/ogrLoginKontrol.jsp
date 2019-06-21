<%@page import="javax.websocket.Session"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<import com.mysql.jdbc.Connection;>
<%@ page import="java.sql.* "%>
</head>
<body>
<%
Connection con;
PreparedStatement pst;
ResultSet rs;
String ogr_ka = request.getParameter("ogr_ka");   
String ogr_sifre = request.getParameter("ogr_sifre");
    try{
    	
        Class.forName("com.mysql.jdbc.Driver");
        con=(Connection)DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/aof_db","root", "gulsum14");  
        if(!con.isClosed()){
	        String sorgu="select * from ogrenciler";	    
	        pst = con.prepareStatement(sorgu);
	        rs = pst.executeQuery();
	        while(rs.next())
	        {
	        	String ka=rs.getString("ogr_ka");
	        	String sifre=rs.getString("ogr_sifre");
	        	int id_ogr=rs.getInt("ogr_id");
	        	String ogrAd=rs.getString("ogr_ad");
	        	
	        	if(ogr_ka.equals(ka)&& ogr_sifre.equals(sifre)){
	        		response.sendRedirect("../ogrenci/ogrenci.jsp?id="+id_ogr+"&ad="+ogrAd);
	        		
	        		}
	        			
	        	 else{
	        		System.out.print("hatalı giris");
	        		response.sendRedirect("ogrenciLogin.jsp");	       		
	        	}
	        }
	     }      
   }
   catch(Exception e){       
       out.println("hata var");
   }      
%>
</body>
</html>