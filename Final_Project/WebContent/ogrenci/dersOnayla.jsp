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
//out.print(session.getAttribute("o_id").toString());
//out.print(session.getAttribute("d_id").toString());
int o_id=Integer.parseInt(session.getAttribute("o_id").toString());
int d_id=Integer.parseInt(session.getAttribute("d_id").toString());
String ad=session.getAttribute("ogrenciAd").toString();

Connection con;
PreparedStatement pst;
ResultSet rs;
Statement st;
/* System.out.print(o_id);
System.out.print(d_id);*/
try{
	Class.forName("com.mysql.jdbc.Driver");
    con=(Connection)DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/aof_db","root", "gulsum14");  
	
	if(!con.isClosed()){
		pst = con.prepareStatement("INSERT INTO ogr_al_ders (ogr_id,ders_id) VALUES (?,?)");
	    //pst = con.prepareStatement("insert into alınan_dersler (ogr_id,ders_id) VALUES ("+o_id+","+d_id+")");
	   // pst = con.prepareStatement("INSERT INTO ogr_al_ders(ogr_id,ders_id) ("+o_id+","+d_id+")");
		pst.setInt(1, o_id);
		pst.setInt(2, d_id);
		pst.executeUpdate();
		//pst.close();
		
		/*st=con.createStatement();
		st.executeUpdate("insert into alınan_dersler (ogr_id,ders_id) VALUES ("+o_id+","+d_id+")");*/
		System.out.println("Veriler kaydedilmistir");
		response.sendRedirect("ogrenci.jsp?id="+o_id+"&ad="+ad);
	}
}
catch(Exception e){
	System.out.println("Unable to connect to database.");
}
%>
</body>
</html>