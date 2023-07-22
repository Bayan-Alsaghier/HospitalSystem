<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
		<title>Sama Hospital</title>
		  	 	<!--CSS Files-->
		 <link rel="stylesheet" href="css/clock.css">
	    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
	    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
	    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
	    <link rel="stylesheet" href="assets/css/feathericon.min.css">
	   <link rel="stylehseet" href="https://cdn.oesmith.co.uk/morris-0.5.1.css">
	   <link rel="stylesheet" href="assets/plugins/morris/morris.css">
	   <link rel="stylesheet" href="assets/css/style.css"> 
</head>
<body >
		<div class="main-wrapper">
		<div class="header">
			<div class="header-left">
				<a href="index.jsp" class="logo"> <img src="assets/images/logo.png" width="50" height="70" alt="logo"> <span class="logoclass">Sama Hospital</span> </a>
			</div>
		<ul class="nav user-menu">
		<div class="noti-content">
		
		 <!--Clock that appear on the right side nav bar--> 
		
		<span>Time: </span>
		<span id="hours">00</span>
        <span>:</span>
        <span id="minutes">00</span>
        <span>:</span>
        <span id="seconds">00</span>
        <span id="session">AM</span>
			</div>
			</ul>
		</div>
		 <!--Left side nav bar--> 
		<div class="sidebar" id="sidebar">
			<div class="sidebar-inner slimscroll">
				<div id="sidebar-menu" class="sidebar-menu">
					<ul>
						<li class="list-divider"></li>
						<li> <a href="admin-login.jsp"><i class="fas fa-user"></i> <span> Admin Login </span> </a>
						</li>
						<li> <a href="Doclogin.jsp"><i class="fas fa-user-md"></i><span> Doctor Login</span> </a>
						</li>
						<li> <a href="plogin.jsp"><i class="fa fa-wheelchair"></i> <span> Patient Login </span></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	
		<!-- start main page that shows the images of the hospital !-->

<div class="page-wrapper">
<div class="content container-fluid">
<section class="container mt-5">
<h1 class="my-4 mt-5 text-center text-lg-left image_title">Our Hospital</h1>
<div class="row gallery">
<div class="col-lg-3 col-md-4 col-xs-6 thumb">
<figure><img class="img-fluid img-thumbnail" src="images/h1.jpeg" alt="Random Image"></figure>
</div>
<div class="col-lg-3 col-md-4 col-xs-6 thumb">
<figure><img class="img-fluid img-thumbnail" src="images/h2.jpg" alt="Random Image"></figure>
</div>
<div class="col-lg-3 col-md-4 col-xs-6 thumb">
<figure><img class="img-fluid img-thumbnail" src="images/h3.png"  alt="Random Image"></figure>
</div>
<div class="col-lg-3 col-md-4 col-xs-6 thumb">
<figure><img class="img-fluid img-thumbnail" src="images/h4.jpg"  alt="Random Image"></figure>
</div>
<div class="col-lg-3 col-md-4 col-xs-6 thumb">
<figure><img class="img-fluid img-thumbnail" src="images/h5.jpg" alt="Random Image"></figure>
</div>
<div class="col-lg-3 col-md-4 col-xs-6 thumb">
<figure><img class="img-fluid img-thumbnail" src="images/h6.jpg" alt="Random Image"></figure>
</div>
<div class="col-lg-3 col-md-4 col-xs-6 thumb">
<figure><img class="img-fluid img-thumbnail" src="images/h7.jpg"  alt="Random Image"></figure>
</div>
<div class="col-lg-3 col-md-4 col-xs-6 thumb">
<figure><img class="img-fluid img-thumbnail" src="images/h8.jpg" alt="Random Image"></figure>
</div>
</div>
</section>
</div>
</div>
</div>

  	 	<!--Java Script Files-->
    <script src="js/clock.js" defer></script>
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