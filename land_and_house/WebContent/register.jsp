<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Sign up</title>
	<link rel="stylesheet" type="text/css" href="/land_and_house/css/bootstrap.min.css">
	<link href="/land_and_house/css/all.min.css" type="text/css" rel="stylesheet">
	<link href="/land_and_house/css/general.css" type="text/css" rel="stylesheet">
</head>
<body>

	<header class="navbar navbar-expand-sm" id="topbar">

		<div class="container-fluid">
			<!--  logo start -->
			<div class="navbar-brand">
			<a href="/land_and_house/" class="nav-link"><i class="fa fa-home fa-lg"></i> HOLA</a>
		</div>
			<!--  logo end -->
			<!-- Category -->
			<div class="float-sm-right">
				<ul class="navbar-nav">
					<li class="nav-item"> <a href="/land_and_house/login.jsp" class="nav-link ">Login</a></li>
				</ul>
			</div>
		</div>
	</header>

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 mt-2" style="text-align: center;">
				<h2>Thanks for choosing to join us</h2>
			</div> 	
			<div id="register" class="col-12 col-md-5 border m-2">
				<header>Fill the form below to join our network</header>
				<p class=> ${message} </p>
				<form class="" method="post" action="register">
					<div class="row form-group">
						<label class="col-2">Email</label>
						<div class="col-10">
							<input class="form-control" type="text" name="email" placeholder="Email Address" title="username" required>
						</div>
					</div>
					<div class="row form-group">
							<label class="col-2">First name</label>
						<div class="col-10">
						
							<input class="form-control" type="text" name="first-name" placeholder="First name" title="username" required>
						</div>
					</div>
					<div class="row form-group">
						<label class="col-2">Last name</label>
						<div class="col-10">
							
							<input class="form-control" type="text" name="last-name" placeholder="Last name" title="username" required>
						</div>
					</div>
					<div class="row form-group">
							<label class="col-2">Phone number</label>
						<div class="col-10">
						
							<input class="form-control" type="text" name="phone" placeholder="07XXXXXXXX" title="username" required>
						</div>
					</div>
					<div class="row form-group">
								<label class="col-2">Password</label>
						<div class="col-10">
					
							<input class="form-control" type="password" name="password" placeholder="Password" title="Password" required>
						</div>
					</div>
					<div class="row form-group">
							<label class="col-2">Verify Password</label>
						<div class="col-10">
						
							<input class="form-control" type="password" name="password2" placeholder="Verify Password" title="Password" required>
						</div>
					</div>
					
					
					<div class="form-group ">
						<input class="btn btn-success" type="submit" name="register" value="Sign-Up Now">
					</div>
				</form>
			</div>
		</div>
	</div>
<!-- 	<footer class="footer">
	<div class="container">
		<span class="">&copy; 2019 Mzumbe university</span>
	</div>
</footer> -->
	<script type="text/javascript" src="/land_and_house/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/land_and_house/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/land_and_house/js/general.js"></script>
</body>
</html>
