<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<import com.mysql.jdbc.Connection;>
<%@ page import="java.sql.* "%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Connection con;
PreparedStatement pst;
ResultSet rs;
String admin_ka = request.getParameter("admin_ka");   
String admin_sifre = request.getParameter("admin_sifre");
    try{
    	
        Class.forName("com.mysql.jdbc.Driver");
        con=(Connection)DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/aof_db","root", "gulsum14");  
        if(!con.isClosed()){
	        String sorgu="select * from admin";	    
	        pst = con.prepareStatement(sorgu);
	        rs = pst.executeQuery();
	        while(rs.next())
	        {
	        	String ka=rs.getString("admin_ka");	        	
	        	String sifre=rs.getString("admin_sifre");
	        	//int hocaId=rs.getInt("hoca_id");
	        	String adminAd=rs.getString("admin_ad");
	        	session.setAttribute("admin_ad", adminAd);
	        	
	        	if(admin_ka.equals(ka)&& admin_sifre.equals(sifre)){
	        		response.sendRedirect("../admin/admin.jsp");
	        		
	        		}
	        			
	        	 else{
	        		System.out.print("Hatalı Giris");
	        		response.sendRedirect("adminLogin.jsp");	       		
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