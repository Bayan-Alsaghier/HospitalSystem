
<!DOCTYPE html>
<html lang="en">
	<head>
		<title> Patient Dashboard</title>
		<meta charset="utf-8" />
	    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
	    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
	    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
	    <link rel="stylesheet" href="assets/css/feathericon.min.css">
	   <link rel="stylehseet" href="https://cdn.oesmith.co.uk/morris-0.5.1.css">
	   <link rel="stylesheet" href="assets/plugins/morris/morris.css">
	   <link rel="stylesheet" href="assets/css/style.css"> 
	</head>
	<body>
	
	 	<!--Create DB connection -->
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_database","root","root"); 
Statement st= con.createStatement(); 
String pt=null,dt=null,at=null;
ResultSet resultSet;
%>
	<div class="main-wrapper">
		<div class="header">
			<div class="header-left">
				<a href="index.jsp" class="logo"> <img src="assets/images/logo.png" width="50" height="70" alt="logo"> <span class="logoclass">Sama Hospital</span> </a>
				<a href="index.jsp" class="logo logo-small"> <img src="assets/images/logo.png" alt="Logo" width="30" height="30"> </a>
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
		
		
			<!-- - Starting the main  page -->
		<div class="page-wrapper">
			<div class="content container-fluid">
				<div class="page-header">
					<div class="row">
						<div class="col-sm-12 mt-5">
							<h3 class="page-title mt-3">Good Morning!</h3>
						</div>
					</div>
				</div>
					</div>
				</div>
             </div>

	
		<!--Java Script Files -->
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
