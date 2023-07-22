
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Manage Doctors</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		
			<!--CSS files -->
			
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
	<link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="assets/css/feathericon.min.css">
	<link rel="stylehseet" href="https://cdn.oesmith.co.uk/morris-0.5.1.css">
	<link rel="stylesheet" href="assets/plugins/morris/morris.css">
	<link rel="stylesheet" href="assets/css/style.css"> 
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	</head>
	<body>
	
		<!--initiate the DB connection -->
		
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
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
String Heart_Surgery = null;
String Brain_surgery= null;
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
		
				<!--left side nav bar -->
				
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
		
			<!-- - Starting the dashboard  page -->
		
		<div class="page-wrapper">
			<div class="content container-fluid">
				<div class="page-header">
					<div class="row">
						<div class="col-sm-12 mt-5">
							<h3 class="page-title mt-3">Manage Doctors</h3>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 d-flex">
						<div class="card card-table flex-fill">
						<div class="top-nav-search">
				             <form method="post" action="Doctor_Search.jsp">
				        <input type="text" class="form-control" placeholder="Search doctor name" name = "search">
				          	<button class="btn" type="submit"><i class="fas fa-search"></i></button>
			           	</form>
		          	</div>
							<div class="card-header">
								<button type="button" class="btn btn-primary float-right veiwbutton"data-bs-toggle="modal" data-bs-target="#myModal"> Add Doctors  </button>
   	
   	<!--Pop- up model to create a Doctor  -->
   
   <div class="container mt-5">
        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Doctor</h5>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="SuccessAddDoctor.jsp">
                            <div class="mb-3">
                                <label class="form-label required" >Name</label>
                                <input type="text" class="form-control" name ="name">
                            </div>
                             <div class="mb-3">
                                <label class="form-label required" >Major</label>
                                <input type="text" class="form-control" name="major" >
                            </div>
                                <div class="mb-3">
                                <label class="form-label required" >Create Password</label>
                                <input type="password" class="form-control" name="pswd" >
                            </div>
                          <div class="modal-footer">
                         <a href="SuccessAddDoctor.jsp"> <button type="submit" class="btn btn-primary" >Submit</button> </a>
                        <a href = "btn-close" ></a><button data-bs-dismiss="modal" class="btn btn-danger">Cancel</button>
                    </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
 </div>
 
 	<!--Reveal doctors information   -->
 	
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-hover table-center">
										<thead>
											<tr>
												<th>Doctor Name</th>
												<th>Specialization</th>
											</tr>
											
											 	<!--Fetch Data from DB to present the  doctors information in table  -->
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM doc_info";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
										</thead>
										<tbody>
											<tr>
											<td><%=resultSet.getString("dname")%></td>
											<td><%=resultSet.getString("dspec") %></td>
										    <td><a href="DeleteDoc.jsp?uname='<%=resultSet.getString("dname")%>'"><span style="font-size: 2em; color: Tomato;"><i class="far fa-trash-alt"></i></a></td>						
											</tr>
<% 
}
} catch (Exception e) {
e.printStackTrace();
}
%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
<%
String sql ="select count(dname), dspec from doc_info where dspec = 'Heart Surgery' group by dspec";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	Heart_Surgery =Integer.toString(resultSet.getInt(1));
}
%>
<%
String con ="select count(dname), dspec from doc_info where dspec = 'Brain surgery' group by dspec";
resultSet = statement.executeQuery(con);
while(resultSet.next()){
	Brain_surgery =Integer.toString(resultSet.getInt(1));
}
%>

 	<!--Start a graph that shows a doctors statistics   -->
			<div class="row">
					<div class="col-md-12 col-lg-6">
						<div class="card card-chart">
							<div class="card-header">
								<h4 class="card-title">Doctors  Statistics  Graph</h4> </div>
							<div class="card-body">
							<canvas id="DocInfo" width ="300" height = "200"></canvas>
							</div>
						</div>
					</div>
				 <div class="col-md-12 col-lg-6">
						<div class="card card-chart">
							<div class="card-header">
								<h4 class="card-title">Doctors Statistics </h4> </div>
							<div class="card-body">
								<div class="dash-widget-header">
									<div>
										<h3 class="card_widget_header"><%= Brain_surgery %></h3>
										<h6 class="text-muted">Brain Surgery Doctors</h6> </div>
									<div class="ml-auto mt-md-3 mt-lg-0"> <span class="opacity-7 text-muted"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="#009688" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user-plus">
									<path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
									<circle cx="8.5" cy="7" r="4"></circle>
									</svg></span> </div>
								</div>
							</div>
						<div class="card-body">
								<div class="dash-widget-header">
									<div>
										<h3 class="card_widget_header"><%= Heart_Surgery %></h3>
										<h6 class="text-muted">Heart Surgery Doctors</h6> </div>
									<div class="ml-auto mt-md-3 mt-lg-0"> <span class="opacity-7 text-muted"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="#009688" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user-plus">
									<path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
									<circle cx="8.5" cy="7" r="4"></circle>
									</svg></span> </div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
		<!--Java Script code to show up the Doctor chart -->
	<script>
	const labels = [
		  'Heart Surgery Doctors',
		  'Brain Surgery Doctors',
		];
		const data = {
				  labels: labels,
				  datasets: [{
				    label: 'Doctors Statistics ',
				    data: [<%= Heart_Surgery %>, <%= Brain_surgery%>],
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
				  type: 'pie',
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
		  document.getElementById('DocInfo'),
		  config
		);
</script>
	
		<!--Java Script files -->
		
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
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
