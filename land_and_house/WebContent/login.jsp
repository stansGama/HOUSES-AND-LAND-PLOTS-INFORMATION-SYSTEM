<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Login</title>
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
					<li class="nav-item"> <a href="/land_and_house/register.jsp" class="nav-link ">Sign Up</a></li>
				</ul>
			</div>
		</div>
	</header>




	<div class="container-fluid">
		<div class="row justify-content-center">
			<div id="login" class="col-10 col-md-6 col-lg-5 border">
				<header >Fill the form below to login</header>
				<p class="text-danger font-weight-bold"> ${message} </p>
				<form class="form-horizontal" method="post" action="login">
				<input type="hidden" name="action" value="login" >
					<div class="form-group">
						<label>Email</label>
						<input class="form-control" type="text" name="email" placeholder="Username" title="username" required>
					</div>
					<div class="form-group">
						<label>Password</label>
						<input class="form-control" type="password" name="password" placeholder="Password" title="Password" required>
					</div>
					<div class="form-group ">
						<input class="btn btn-success col-4 offset-8" type="submit" name="login" value="Login">
						<a class="" href="#">Forget Password?</a>
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
	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/land_and_house/js/general.js"></script>
</body>
</html>