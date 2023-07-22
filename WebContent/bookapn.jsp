
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>User  | Book Appointment</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		
	    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
	    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
	    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
	    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
	    <link rel="stylesheet" href="assets/css/feathericon.min.css">
	   <link rel="stylehseet" href="https://cdn.oesmith.co.uk/morris-0.5.1.css">
	   <link rel="stylesheet" href="assets/plugins/morris/morris.css">
	   <link rel="stylesheet" href="assets/css/style.css"> 
	</head>
	<body>
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
				<a href="index.jsp" class="logo"> <img src="assets/images/logo.png" width="50" height="70" alt="logo"> <span class="logoclass">Sama Hospital</span> </a>
				<a href="index.jsp" class="logo logo-small"> <img src="assets/images/logo.png" alt="Logo" width="30" height="30"> </a>
			</div>
			<ul class="nav user-menu">
						<div class="noti-content"> 
						</div>
			</ul>
		</div>
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
			<!-- - Starting main  page -->
		<div class="page-wrapper">
<div class="content container-fluid">
<div class="page-header mt-5">
<div class="row">
<div class="col">
<h3 class="page-title">Book Appointment</h3>
</div>
</div>
</div>
<div class="row">
<div class="col-lg-12">
<div class="card">
<div class="card-body">

	<!-- - Form to create an appointment -->
	
	
 <form class="ui form" method="post" action="successbapn.jsp">
 <%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM patients_info where name='"+Name+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%> 
	<!-- - Get the patient name from the DB to prevent the user from modifying  -->
 <div class="form-group row">
<label class="col-form-label col-md-2">Patient Name</label>
<div class="col-md-10">
<input class="form-control datepicker" name="pname"  required="required"  readonly="readonly"  value="<%=resultSet.getString("name") %>">
</div>
</div>
  <%
}
} catch (Exception e){
e.printStackTrace();
}
%>
<div class="form-group row">
<label class="col-form-label col-md-2">Doctor Major </label>
<div class="col-md-10">
<select name="dspec" class="form-control" required="required">
		                                                      <option value="">Select Specialization</option>
																<option value="Brain surgery">Brain surgery</option>
																<option value="Heart surgery">Heart surgery</option>
																<option value="Plastic surgery">Plastic surgery</option>
																<option value="Cancer treatment">Cancer treatment</option>					
																<option value="Basic treatment">Basic treatment</option>
</select>
</div>
</div>														
<div class="form-group row">
<label class="col-form-label col-md-2">Doctors</label>
<div class="col-md-10">
<select name="dname" class="form-control" required="required">
						<option value="">Select Doctor</option>
						<option value="Doc1">Doc1</option>
						<option value="Doc2">Doc2</option>
						<option value="Doc3">Doc3</option>
						</select>
</div>
</div>
<div class="form-group row">
<label class="col-form-label col-md-2">Date</label>
<div class="col-md-10">
<input class="form-control datepicker" name="date"  required="required" type="date">
</div>
</div>
<div class="form-group row">
<label class="col-form-label col-md-2">Time</label>
<div class="col-md-10">
<input class="form-control" name="time" type ="time" required="required">
</div>
</div>



               <center> <a href="successubapn.jsp">
                   <button class="btn btn-primary" type="submit" name="submit" >Book Appointment </button></a>
</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	<!--Java Script files  -->
	
	<script data-cfasync="false" src="../../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
	<script src="assets/js/jquery-3.5.1.min.js"></script>
	<script src="assets/js/popper.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/plugins/raphael/raphael.min.js"></script>
	<script src="assets/plugins/morris/morris.min.js"></script>
	<script src="assets/js/chart.morris.js"></script>
	<script src="assets/js/script.js"></script>
	
	</body>
</html>
