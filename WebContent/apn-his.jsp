
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Appointments</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<!--CSS  Libraries -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
	<link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="assets/css/feathericon.min.css">
	<link rel="stylehseet" href="https://cdn.oesmith.co.uk/morris-0.5.1.css">
	<link rel="stylesheet" href="assets/plugins/morris/morris.css">
	<link rel="stylesheet" href="assets/css/style.css"> 
	</head>
	<body>
	
	<!--initiate the connection with the DB using JDBC -->
	
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "hospital_database";
String userId = "root";
String password = "root";
String sql=null;
try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
// Control the id page that appear on the url to control the DB presentation of the data 
int id=Integer.parseInt(request.getParameter("id"));
String a=null;
if(id==1)
{ 
sql ="SELECT * FROM apn_info";
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<!--initiate the connection with the DB using JDBC -->
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
			<!--left side navbar -->
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
			<!-- -Main page contents  -->
		<div class="page-wrapper">
			<div class="content container-fluid">
				<div class="page-header">
					<div class="row">
						<div class="col-sm-12 mt-5">
							<h3 class="page-title mt-3">Manage Appointments</h3>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 d-flex">
						<div class="card card-table flex-fill">
					   <div class="top-nav-search">
				           <form method="post" action="Apn_Searchjsp.jsp">
				          	<input type="text" class="form-control" placeholder="Search patient appointment" name ="search">
				          	<button class="btn" type="submit"><i class="fas fa-search"></i></button>
				        </form>
			         </div>
							<div class="card-header">
								<button type="button" class="btn btn-primary float-right veiwbutton"data-bs-toggle="modal" data-bs-target="#myModal"> Create Appointment  </button>
  
  
  	<!--Pop-up model to  create new appointment -->
   <div class="container mt-5">
        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Create Appointment </h5>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="successbapn.jsp">
                            <div class="mb-3">
                                <label class="form-label required" >Patient Name</label>
                                <input type="text" class="form-control" name ="pname">
                            </div>
                       <div class="mb-3">
                                <label class="form-label required" >Doctor Name</label>
                                <input type="text" class="form-control" name ="dname">
                            </div>
                             <div class="mb-3">
                                <label class="form-label required" >Doctor Major</label>
                                <input type="text" class="form-control" name="dspec" >
                            </div>
                                <div class="mb-3">
                                <label class="form-label required" >Appointment  Date </label>
                                <input type="date" class="form-control" name="date" >
                            </div>
                              <div class="mb-3">
                                <label class="form-label required" >Appointment  Time </label>
                                <input type="time" class="form-control" name="time" >
                            </div>
                          <div class="modal-footer">
                         <a href="successbapn.jsp"> <button type="submit" class="btn btn-primary" >Submit</button> </a>
                        <a href = "btn-close" ></a><button data-bs-dismiss="modal" class="btn btn-danger">Cancel</button>
                    </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
 </div>	
 
 	 	<!--Main page contents -->
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-hover table-center">
										<thead>
											<tr>
												<th><b>Patient Name</b></th>				
	                                          <th><b>Doctor Name</b></th>
                                              <th><b>Specialization</b></th>	
	                                             <th><b>Date</b></th>	
	                                               <th><b>Time</b></th>	
											</tr>
				<!--Fetch data from the DB and present it on main page -->															
<%
try{ 
	
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
										</thead>
										<tbody>
											<tr>
											<td><%=resultSet.getString("pname") %></td>
                                            <td><%=resultSet.getString("dname") %></td>
                                             <td><%=resultSet.getString("spec") %></td>
                                              <td><%=resultSet.getString("apdate") %></td>
                                              <td><%=resultSet.getString("aptime")%></td>
                                              <td><a href="DeleteApo.jsp?uname='<%=resultSet.getString("aptime")%>'"><span style="font-size: 2em; color: Tomato;"><i class="far fa-trash-alt"></i></a></td>	
											</tr>
<% 
}
} catch (Exception e) {
e.printStackTrace();
System.out.println("asasdf");
}
%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Java Script Libraries -->
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
