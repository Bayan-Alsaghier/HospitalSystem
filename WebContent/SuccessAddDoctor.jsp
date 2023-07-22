<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>S.U.C.C.E.S.S</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
    String name=request.getParameter("name");
	String major=request.getParameter("major");
	String pswd=request.getParameter("pswd");
	Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_database","root","root"); 
Statement st= con.createStatement(); 
st.executeUpdate("insert into doc_info values ('"+name+"','"+major+"','"+pswd+"')"); 
%>
<br><br>
<b><center>Success</center></b><br>
<center><a href="plogin.jsp">Back to login page</a></center><br>
<center><a href="/HospDBMS">Home</a></center>

</body>
</html>