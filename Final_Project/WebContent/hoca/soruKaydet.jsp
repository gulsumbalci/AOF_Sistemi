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
int d_id=Integer.parseInt(session.getAttribute("d_id").toString());
int h_id=Integer.parseInt(session.getAttribute("h_id").toString());

String ad=session.getAttribute("h_ad").toString();

String soru=request.getParameter("txtsoru");
String a=request.getParameter("txta");
String b=request.getParameter("txtb");
String c=request.getParameter("txtc");
String d=request.getParameter("txtd");

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
		pst = con.prepareStatement("INSERT INTO soru (text,a,b,c,d,hoca_id,ders_id) VALUES (?,?,?,?,?,?,?)");
	    pst.setString(1, soru);
	    pst.setString(2, a);
	    pst.setString(3, b);
	    pst.setString(4, c);
	    pst.setString(5, d);
		pst.setInt(6,h_id);
		pst.setInt(7, d_id);
		pst.executeUpdate();
		//pst.close();
		
		out.println("Veriler kaydedilmistir");
		response.sendRedirect("hoca.jsp?id="+h_id+"&ad="+ad);
	}
}
catch(Exception e){
	System.out.println("Unable to connect to database.");
}
%>
</body>
</html>