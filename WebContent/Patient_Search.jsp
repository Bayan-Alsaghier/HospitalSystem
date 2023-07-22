
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Search Results</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		
			<!--CSS Files-->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
	<link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="assets/css/feathericon.min.css">
	<link rel="stylehseet" href="https://cdn.oesmith.co.uk/morris-0.5.1.css">
	<link rel="stylesheet" href="assets/plugins/morris/morris.css">
	<link rel="stylesheet" href="assets/css/style.css"> 
	</head>
	<body>
	
		<!--initiate the DB connection -->
		
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String search=request.getParameter("search");
String id = request.getParameter("id");
String userID=null;
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "hospital_database";
String userId = "root";
String password = "root";
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_database","root","root"); 
Statement st= con.createStatement(); 
String sql ="SELECT * FROM patients_info where name LIKE'%"+search+"%' ";
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
		
			<!--Start the navigation bar -->
			
		<div class="sidebar" id="sidebar">
			<div class="sidebar-inner slimscroll">
				<div id="sidebar-menu" class="sidebar-menu">
					<ul>
						<li class="active"> <a href="adminpage.jsp"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a> </li>
						<li class="list-divider"></li>
						<li> <a href="mangptnts.jsp"><i class="fa fa-wheelchair"></i>  <span> Patients </span> </a>
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
							<h3 class="page-title mt-3">Search Results</h3>
						</div>
					</div>
				</div>
							
				<div class="row">
					<div class="col-md-12 d-flex">
						<div class="card card-table flex-fill">
						 <div class="top-nav-search">
				                 <form method="post" action="Patient_Search.jsp">
				                    	<input type="text" class="form-control" placeholder="Search patient name " name = "search">
				                	<button class="btn" type="submit"><i class="fas fa-search"></i></button>
			                  	</form>
			                </div>
							<div class="card-header">
								<button type="button" class="btn btn-primary float-right veiwbutton"data-bs-toggle="modal" data-bs-target="#myModal"> Add Patient  </button>
   
   		<!--Pop-up model to add new patient -->
   		
   		<div class="container mt-5">
        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Patient</h5>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="success.jsp">
                           <div class="mb-3">
                                <label class="form-label required">ID Number</label>
                                <input type="number" class="form-control"  name="aadhar" >
                            </div>
                            <div class="mb-3">
                                <label class="form-label required" >Name</label>
                                <input type="text" class="form-control" name ="name">
                            </div>
                            <div class="mb-3">
                                <label class="form-label required" >Email</label>
                                <input type="email" class="form-control" name ="pemail">
                            </div>
                             <div class="mb-3">
                                <label class="form-label required" >Contact Number</label>
                                <input type="number" class="form-control" name="pno" >
                            </div>
                             <div class="mb-3">
                                <label class="form-label required" >Address</label>
                                <input type="text" class="form-control" name="street" >
                            </div>
                          <div class="mb-3">
                                <label class="form-label required" >Area</label>
                                <input type="text" class="form-control" name="area" >
                            </div>
                                <div class="mb-3">
                                <label class="form-label required" >Create Password</label>
                                <input type="password" class="form-control" name="pwd" >
                            </div>
                          <div class="modal-footer">
                         <a href="success.jsp"> <button type="submit" class="btn btn-primary" >Submit</button> </a>
                        <a href = "btn-close" ></a><button data-bs-dismiss="modal" class="btn btn-danger">Cancel</button>
                    </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
 </div>

	<!--present the patient data in form of table  -->
	
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-hover table-center">
										<thead>
											<tr>
												<th>Name</th>
												<th>Email</th>
												<th>Contact Number</th>
												<th>Street</th>
												<th class="text-center">Area</th>
												<th class="text-right">ID Number</th>
												<th> </th>
											</tr>
											
                                <!--Getting the patients information  from the DB  -->
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
											<td class="text-nowrap"><%=resultSet.getString("name") %></td>
											<td class="text-nowrap"><%=resultSet.getString("email") %></td>
											<td><%=resultSet.getString("contact_no") %></td>
											<td><%=resultSet.getString("street") %></td>
											<td><%=resultSet.getString("locality") %></td>
											<td><%=resultSet.getString("aadhar") %></td>
											<td><a href="delptnt.jsp?uname='<%=resultSet.getString("name")%>'"><span style="font-size: 2em; color: Tomato;"><i class="far fa-trash-alt"></i></a></td>					
											</tr>
<%
}
} catch (Exception e){
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
			</div>
		</div>
	</div>
	


<!--Java Script Files-->

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
