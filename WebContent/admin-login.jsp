<html lang="en">
	<head>
	<title>Admin Login</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	
	<!-- CSS Files-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="css/ad.css">
	<link rel="stylesheet" type="text/css" href="css/ad2.css">	
	</head>
	<body>		
	<!-- Admin Login Form !-->
		<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" method="post" action="/HospDBMS/admin-login">
					<span class="login100-form-title p-b-43">
						Admin Log In
					</span>
					<!-- Error function that checks the appears in case that user enters invalide password or username -->
					<font color="red"><p>${error}</p></font>
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="username" >
						<span class="focus-input100"></span>
						<span class="label-input100">Username</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input class="input100" type="password" name="password" >
						<span class="focus-input100"></span>
						<span class="label-input100">Password</span>
					</div>
					<div class="container-login100-form-btn">
						<button class="login100-form-btn" name="submit">
							Login
						</button>
					</div>
				</form>
				<div class="login100-more" style="background-image: url('images/staff2.jpg');">
				</div>
			</div>
		</div>
	</div>
<!-- Javascript  Files-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/select2/select2.min.js"></script>
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<script src="vendor/countdowntime/countdowntime.js"></script>
	<script src="js/main.js"></script>
		
		
		
		
		
		
		
		
		
	</body>
	<!-- end: BODY -->
</html>