<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<import com.mysql.jdbc.Connection;>
<%@ page import="java.sql.* "%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Connection con;
PreparedStatement pst;
ResultSet rs;
String hoca_ka = request.getParameter("hoca_ka");   
String hoca_sifre = request.getParameter("hoca_sifre");
    try{
    	
        Class.forName("com.mysql.jdbc.Driver");
        con=(Connection)DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/aof_db","root", "gulsum14");  
        if(!con.isClosed()){
	        String sorgu="select * from hocalar";	    
	        pst = con.prepareStatement(sorgu);
	        rs = pst.executeQuery();
	        while(rs.next())
	        {
	        	String ka=rs.getString("hoca_ka");
	        	String sifre=rs.getString("hoca_sifre");
	        	int hocaId=rs.getInt("hoca_id");
	        	String hocaAd=rs.getString("hoca_ad");
	        	
	        	if(hoca_ka.equals(ka)&& hoca_sifre.equals(sifre)){
	        		response.sendRedirect("../hoca/hoca.jsp?id="+hocaId+"&ad="+hocaAd);
	        		
	        		}
	        			
	        	 else{
	        		System.out.print("hatalı giris");
	        		response.sendRedirect("hocaLogin.jsp");	       		
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