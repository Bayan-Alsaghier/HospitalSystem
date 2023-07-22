<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
    String username=request.getParameter("name");
	String password=request.getParameter("password");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","root"); 
    Statement st= con.createStatement(); 
    st.executeUpdate("insert into login values ('"+username+"','"+password+"')");
%>
<br><br>
<b><center>You have successfuly registred to our system</center></b><br>

</body>
</html>