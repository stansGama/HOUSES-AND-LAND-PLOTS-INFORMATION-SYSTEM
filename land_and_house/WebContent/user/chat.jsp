<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Chats</title>
	<link rel="stylesheet" type="text/css" href="/land_and_house/css/bootstrap.min.css">
	<link href="/land_and_house/css/all.min.css" type="text/css" rel="stylesheet">
	<link href="/land_and_house/css/general.css" type="text/css" rel="stylesheet">
</head>
<body>
	<%@ include file="/user/includes/header.html" %>
	<div class="container">
		<div class="row content justify-content-center">
		<%@ include file="/user/includes/search.html" %>
			<!-- Chats side bar -->
			<div class="w-25 h-100 rounded border" style="overflow-y: auto;background: antiquewhite;">
				<div style="padding: 20px;text-align: center;background: silver;">
					<header class="display-4">Chats</header>
				</div>
				<div style="overflow-y: scroll;height: 75%;">

					<div class="card mb-2">
						<h3 class="card-title">Stans@gmail</h3>
						<p class="card-text">Hello there can we talk business</p>
					</div>
					<div class="card mb-2">
						<h3 class="card-title">Stans@gmail</h3>
						<p class="card-text">Hello there can we talk business</p>
					</div>	
					
				</div>
			</div>
			<!-- Chats side bar ends -->
			<!-- Chat body start -->
			<div class="w-75 row no-gutters rounded border" style="background: snow;">
				<div class="w-100" style="background: #2c3e51;text-align: center;height: 100px;	color: aliceblue;">
					<header style="font-size: 2em;">Chat with Stans@gma</header>
				</div>
				<div class="col-12">
					<div class="card w-50 d-block">
						<div class="card-body">
							<p>Hello bro</p>
							<span class="float-right">2:40</span>
						</div>
					</div>
				</div>
				<div class="col-12">
					<div class="card w-50 d-inline-block float-right">
						<div class="card-body">
							<p>Hello bro</p>
							<span class="float-right">2:40</span>
						</div>

					</div>
				</div>
				<div class="col-12">
					<div class="card w-50 d-block ">
						<div class="card-body">
							<p>Hello bro</p>
							<span class="float-right">2:40</span>
						</div>
					</div>

				</div>
				<div class="col-12">
					<div class="card w-50 d-block float-right">
						<div class="card-body">
							<p>Hello bro</p>
							<span class="float-right">2:40</span>
						</div>
					</div>
				</div>
				<div class="col-12">
					<div class="card w-50 d-block float-right">
						<div class="card-body">
							<p>Hello bro</p>
							<span class="float-right">2:40</span>
						</div>

					</div>
				</div>

			</div>
			<!-- Chat body ends -->
		</div>
	</div>
	<%@ include file="/user/includes/footer.html" %>
	<script type="text/javascript" src="/land_and_house/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/land_and_house/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/land_and_house/js/general.js"></script>
</body>
</html>