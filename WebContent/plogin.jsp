<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Patient Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    	<!--CSS files-->
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/style_Plogin.css">
</head>
<body>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Patient  Login</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-7 col-lg-5">
					<div class="wrap">
						<div class="img" style="background-image: url(images/bg.jpg);"></div>
						<div class="login-wrap p-4 p-md-5">
			      	<div class="d-flex">
			      		<div class="w-100">
			      			<h3 class="mb-4">Sign In</h3>
			      		</div>
			      	</div>
			      	
			      	<!--Patient Login Form-->
			      	
							<form class="signin-form" method="post" action="Plogin">
			      		<div class="form-group mt-3">
			      		<font color="red"><p>${error}</p></font>
			      			<input type="text" name="uname"  class="form-control" required>
			      			<label class="form-control-placeholder" for="username">Username</label>
			      		</div>
		            <div class="form-group">
		              <input id="password-field" type="password"  name="pwd"  class="form-control" required>
		              <label class="form-control-placeholder" for="password">Password</label>
		              <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
		            </div>
		            <div class="form-group">
		            	<button name = "submit" type="submit" class="form-control btn btn-primary rounded submit px-3">Sign In</button>
		            </div>
		          </form>
		          <p class="text-center">Don't have an account? <a data-toggle="tab" href="newuser.html">Sign Up</a></p>
		        </div>
		      </div>
				</div>
			</div>
		</div>
	</section>
	    	<!--Java Script files-->
<script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>
</body>
</html>