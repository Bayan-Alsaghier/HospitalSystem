<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Doctor login</title>
    	<!-- CSS Files-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/doctor_style.css">
</head>
<body class="img js-fullheight" style="background-image: url(images/bg.jpg);">   
      <section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Doctor Log in</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
		      	<h3 class="mb-4 text-center">Have an account?</h3>
		      	 	<!-- Doctor Log in Form-->
		      	<form class="signin-form" method="post" action="/HospDBMS/Doclogin">
		      		<div class="form-group">
		      			<input type="text" class="form-control"  name="uname"  placeholder="Username" required>
		      		</div>
	            <div class="form-group">
	              <input id="password-field" type="password" class="form-control"  name="pwd"  placeholder="Password" required>
	            </div>
	            <div class="form-group">
	            	<button type="submit" class="form-control btn btn-primary submit px-3" name="submit">Sign In</button>
	            </div>
	              	 	<!-- Error fucntion to check the validity of user input and reveal error in case of mismaching  with DB-->
	             <b>   <font color="red"> ${error}</font> </b>
	          </form>
	          </div>
	          </div>
	          </div>
	          </div>
	          </section>
	          	<!-- Java Script Files-->
<script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>

</body>
</html>