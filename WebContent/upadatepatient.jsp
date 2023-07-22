<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Update Information</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--CSS files-->
	   <link rel="stylesheet" href="assets/css/bootstrap.min.css">
	    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
	    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
	    <link rel="stylesheet" href="assets/css/feathericon.min.css">
	   <link rel="stylehseet" href="https://cdn.oesmith.co.uk/morris-0.5.1.css">
	   <link rel="stylesheet" href="assets/plugins/morris/morris.css">
	   <link rel="stylesheet" href="assets/css/style.css"> 
	   <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
</head>
<body >

<!--Start the DB connection-->

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String Name = (String)session.getAttribute("Name");
String userID=null;
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "hospital_database";
String userId = "root";
String password = "root";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
         <div class="main-wrapper">
		<div class="header">
			<div class="header-left">
				<a href="adminpage.jsp" class="logo"> <img src="assets/images/logo.png" width="50" height="70" alt="logo"> <span class="logoclass">Sama Hospital</span> </a>
				<a href="adminpage.jsp" class="logo logo-small"> <img src="assets/images/logo.png" alt="Logo" width="30" height="30"> </a>
			</div>
			<ul class="nav user-menu">
						<div class="noti-content"> </div>
			</ul>
		</div>
		<!--left side nav bar-->
		<div class="sidebar" id="sidebar">
			<div class="sidebar-inner slimscroll">
				<div id="sidebar-menu" class="sidebar-menu">
					<ul>
						<li class="active"> <a href="patientpage.jsp"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a> </li>
						<li class="list-divider"></li>
						<li> <a href="upadatepatient.jsp"><i class="fas fa-user"></i> <span> Update Profile </span> </a>
						</li>
						<li> <a href="apn-his-ptnt.jsp?id=4"><i class="fa fa-history" aria-hidden="true"></i><span> View Appointments History </span> </a>
						</li>
						<li> <a href="bookapn.jsp"><i class="fa fa-calendar" aria-hidden="true"></i> <span> Book Appointment </span></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		
<!--Update patient information  form-->

<div class="page-wrapper">
<div class="content container-fluid">
<div class="page-header mt-5">
<div class="row">
<div class="col">
<h3 class="page-title">Update Your Information</h3>
</div>
</div>
</div>
<div class="row">
<div class="col-lg-12">
<div class="card">
<div class="card-header">
<h4 class="card-title">Update Your Information </h4>
</div>

<!--Fetch the data from the DB to present Name and ID number without allow the user to modify it -->
 <div class="card-body">
  <form class="ui form" method="post" action="successupdate.jsp?Name=<%=Name%>">
 <%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM patients_info where name='"+Name+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>         
<div class="form-group row">
<label class="col-form-label col-md-2">ID Number </label>
<div class="col-md-10">
<input type="text" name="aadhar"  class="form-control"  value="<%=resultSet.getString("aadhar") %>" readonly="readonly">
</div>
</div>
<div class="form-group row">
<label class="col-form-label col-md-2">Full Name</label>
<div class="col-md-10">
 <input type="text" name="name"  class="form-control" value="<%=resultSet.getString("name") %>">
</div>
</div>
<div class="form-group row">
<label class="col-form-label col-md-2">Email</label>
<div class="col-md-10">
  <input type="email" name="pemail" class="form-control"value="<%=resultSet.getString("email") %>">
</div>
</div>
<div class="form-group row">
<label class="col-form-label col-md-2">Contact number</label>
<div class="col-md-10">
 <input type="number" name="pno" class="form-control" value="<%=resultSet.getString("contact_no") %>">
</div>
</div>
<div class="form-group row">
<label class="col-form-label col-md-2">Address</label>
<div class="col-md-10">
 <input type="text" name="street" class="form-control" value="<%=resultSet.getString("street") %>">
</div>
</div>
<div class="form-group row">
<label class="col-form-label col-md-2">Area</label>
<div class="col-md-10">
 <input type="text" name="area" class="form-control"value="<%=resultSet.getString("locality") %>">
</div>
</div>          
<div class="form-group row">
<label class="col-form-label col-md-2">Password</label>
<div class="col-md-10">
 <input type="password" name="pwd" class="form-control"value="<%=resultSet.getString("password") %>">
</div>
</div>
  <%
}
} catch (Exception e){
e.printStackTrace();
}
%>
               <center><a href="successupdate.jsp">
               <button class="btn btn-primary" type="button">Update</button></a>
</form>
</div>
</div>
</div>
</div>
</div>
</div>
</div> 

<!--Java Script files-->

	<script data-cfasync="false" src="../../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
	<script src="assets/js/jquery-3.5.1.min.js"></script>
	<script src="assets/js/popper.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/plugins/raphael/raphael.min.js"></script>
	<script src="assets/plugins/morris/morris.min.js"></script>
	<script src="assets/js/chart.morris.js"></script>
	<script src="assets/js/script.js"></script>    
	<script src="assets/js/jquery-3.5.1.min.js"></script>
</body>
</html>