
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Admin Dashboard</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta content="" name="description" />
		<meta content="" name="author" />
	    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
	    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
	    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
	    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
	    <link rel="stylesheet" href="assets/css/feathericon.min.css">
	   <link rel="stylehseet" href="https://cdn.oesmith.co.uk/morris-0.5.1.css">
	   <link rel="stylesheet" href="assets/plugins/morris/morris.css">
	   <link rel="stylesheet" href="assets/css/style.css"> 
	   <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	</head>
	<body >
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
				<a href="adminpage.jsp" class="logo"> <img src="assets/images/logo.png" width="50" height="70" alt="logo"> <span class="logoclass">Sama Hospital</span> </a>
				<a href="adminpage.jsp" class="logo logo-small"> <img src="assets/images/logo.png" alt="Logo" width="30" height="30"> </a>
			</div>
			<ul class="nav user-menu">
		     	<div class="noti-content">
		     	 </div>
			</ul>
			
		</div>
		<!--- leftside navnar  !-->
		<div class="sidebar" id="sidebar">
			<div class="sidebar-inner slimscroll">
				<div id="sidebar-menu" class="sidebar-menu">
					<ul>
						<li class="active"> <a href="adminpage.jsp"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a> </li>
						<li class="list-divider"></li>
						<li> <a href="mangptnts.jsp"><i class="fa fa-wheelchair"></i> <span> Patients </span> </a>
						</li>
						<li> <a href="mngdoc.jsp"><i class="fas fa-user-md"></i><span> Doctors </span> </a>
						</li>
						<li> <a href="apn-his.jsp?id=1"><i class="fa fa-calendar" aria-hidden="true"></i> <span> Appointments </span></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
			<!-- - Starting  main dashboard page -->
		<div class="page-wrapper">
			<div class="content container-fluid">
				<div class="page-header">
					<div class="row">
						<div class="col-sm-12 mt-5">
							<h3 class="page-title mt-3">Good Morning!</h3>
						</div>
					</div>
				</div>
				
					<!--- Getting the data from the DB to present in page using predefined variables!-->
				<% String sql ="SELECT count(*) FROM patients_info";
resultSet = st.executeQuery(sql);
while(resultSet.next()){
	pt=Integer.toString(resultSet.getInt(1));
}
%>
				<div class="row">
					<div class="col-xl-3 col-sm-6 col-12">
						<div class="card board1 fill">
							<div class="card-body">
								<div class="dash-widget-header">
									<div>
										<h3 class="card_widget_header"><%=pt%></h3>
										<h6 class="text-muted">Total Patients</h6> </div>
									<div class="ml-auto mt-md-3 mt-lg-0"> <span class="opacity-7 text-muted"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="#009688" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user-plus">
									<path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
									<circle cx="8.5" cy="7" r="4"></circle>
									</svg></span> </div>
								</div>
							</div>
						</div>
					</div>
					<!--- Getting the data from the DB to present in page using predefined variables!-->
	<%
resultSet = st.executeQuery("select count(*) from apn_info");
while(resultSet.next()){
	at=Integer.toString(resultSet.getInt(1));
}
%>
					<div class="col-xl-3 col-sm-6 col-12">
						<div class="card board1 fill">
							<div class="card-body">
								<div class="dash-widget-header">
									<div>
										<h3 class="card_widget_header"><%=at %></h3>
										<h6 class="text-muted">Total Appointments</h6> </div>
									<div class="ml-auto mt-md-3 mt-lg-0"> <span class="opacity-7 text-muted">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="#009688" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-dollar-sign">
									</svg></span> </div>
								</div>
							</div>
						</div>
					</div>	
					
					<!--- Getting the data from the DB to present in page using predefined variables!-->													
<%
resultSet = st.executeQuery("select count(*) from doc_info");
while(resultSet.next()){
	dt=Integer.toString(resultSet.getInt(1));
}
%>      	<div class="col-xl-3 col-sm-6 col-12">
						<div class="card board1 fill">
							<div class="card-body">
								<div class="dash-widget-header">
									<div>
										<h3 class="card_widget_header"><%=dt %></h3>
										<h6 class="text-muted">Total Doctors</h6> </div>
									<div class="ml-auto mt-md-3 mt-lg-0"> <span class="opacity-7 text-muted">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="#009688" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-plus">
							     	<path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
									<circle cx="8.5" cy="7" r="4"></circle>
									</svg></span> </div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 col-lg-6">
						<div class="card card-chart">
							<div class="card-header">
								<h4 class="card-title">Hospital Statistics </h4> </div>
							<div class="card-body">
							<canvas id="myChart"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- Script Code that control the Chart-->
<script>
const labels = [
  'Total Doctors',
  'Total Patients',
  'Total Appointment',
];
const data = {
		  labels: labels,
		  datasets: [{
		    label: 'Hospital Statistics ',
		    data: [<%=dt %>, <%=pt%>, <%=at %>],
		    backgroundColor: [
		      'rgba(255, 99, 132, 0.2)',
		      'rgba(255, 159, 64, 0.2)',
		      'rgba(255, 205, 86, 0.2)',
		      'rgba(75, 192, 192, 0.2)',
		      'rgba(54, 162, 235, 0.2)',
		      'rgba(153, 102, 255, 0.2)',
		      'rgba(201, 203, 207, 0.2)'
		    ],
		    borderColor: [
		      'rgb(255, 99, 132)',
		      'rgb(255, 159, 64)',
		      'rgb(255, 205, 86)',
		      'rgb(75, 192, 192)',
		      'rgb(54, 162, 235)',
		      'rgb(153, 102, 255)',
		      'rgb(201, 203, 207)'
		    ],
		    borderWidth: 1
		  }]
		};
const config = {
		  type: 'bar',
		  data: data,
		  options: {
		    scales: {
		      y: {
		        beginAtZero: true
		      }
		    }
		  },
		};	
const myChart = new Chart(
  document.getElementById('myChart'),
  config
);
</script>
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
