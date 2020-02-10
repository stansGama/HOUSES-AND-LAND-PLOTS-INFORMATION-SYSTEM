<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="database.*" %>
<%@ page import="business.*" %>
<%@ page import="java.util.*" %>
<%
HttpSession userSession = request.getSession();
User user = (User)userSession.getAttribute("user");
if(user == null){
response.sendRedirect("/land_and_house/login.jsp");
}

%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Add new property</title>
	<link rel="stylesheet" type="text/css" href="/land_and_house/css/bootstrap.min.css">
	<link href="/land_and_house/css/all.min.css" type="text/css" rel="stylesheet">
	<link href="/land_and_house/css/general.css" type="text/css" rel="stylesheet">
</head>
<body id="body">

	<%@ include file="/user/includes/header.html" %>

	<div class="mb-3 jumbotron jumbotron-fluid w-100">
		<div class="container">
			<h1 class="display-4">Property upload form</h1>
			<p class="lead">Please fill form below with appropriate information, avoid to confuse customers with wrong information</p>
			<hr class="my-4">
			<nav aria-label="breadcrumb" class="col-12">
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
						<a href="/land_and_house/user/profile.jsp">Profile</a>
					</li>
					<li class="breadcrumb-item active" aria-current="page">Add Properties</li>
				</ol>
			</nav>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="row col-12">

					<div class="col-12" style="margin-top:10px; ">
						<p> ${ message } </p>
					</div>
					<form class="row form-horizontal col-12" action="addproperty" method="post" enctype="multipart/form-data">
						<section class="property-section col-12 col-md-6">
							<header class="heading">Property Info</header>
							<div class="form-group">
								<label>Type of your property</label>
								<select class="form-control" id="type" name="type">
									<option>--select--</option>

									<% ArrayList<String[]> type = PropertyDb.getTypes();
									for(String[] types:type){%>
									<option><% out.print(types[1]);%></option>
									<%} %>
								</select>
							</div>

							<div class="form-group">
								<label>Name your price</label>
								<input type="number" name="price" class="form-control" required placeholder="ex. 10000000">
							</div>
							<div class="form-group">
								<label>Land-plot Size in m<sup>2</sup></label>
								<input type="number" name="size" class="form-control" >
							</div>

							<div class="form-group">
								<label>Upload image/picture of your property</label>
								<input type="file" name="pic" class="form-control-file">
							</div>
							<div>
								<label>Photo caption</label>
								<textarea rows="6" cols="" class="form-control" name="caption" placeholder="Write something about this photo"></textarea>
							</div>
						</section>
						<section class="location-section col-12 col-md-6">
							<header class="heading">Location of your property</header>
							<div class="form-group">
								<label>Country</label>
								<input type="text" name="country" value="Tanzania" class="form-control" readonly>				
							</div>
							<div class="form-group">
								<label>Region</label>
								<input type="text" name="region" class="form-control" required >
							</div>
							<div class="form-group">
								<label>District</label>
								<input type="text" name="district" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Ward</label>
								<input type="text" name="ward" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Street</label>
								<input type="text" name="street" class="form-control" required>
							</div>
						</section>



						<section class="col-12 col-md-6 land-info d-none">
							<header class="heading">Land Information</header>
							<div class="form-group">
								<label>Land type</label>
								<input type="text" name="land-type" class="form-control" >
							</div>
							<div class="form-group">
								<label>More about your land</label>
								<textarea rows="6" cols="" class="form-control" name="land-features" placeholder="Write more unique features of your land"></textarea>
							</div>

						</section>

						<section class=" row col-12 house-info d-none">
							<div class="col-12 col-md-6" >
								<header class="heading">House information</header>
								<div class="form-group">
									<label>House number</label>
									<input type="text" name="house-no" placeholder="ex. mor/mv/mz/ch/89" class="form-control">
								</div>
								<div class="form-group">
									<label>Year Built</label>
									<input type="number" name="year-built" class="form-control">
								</div>
								<div class="form-group">
									<label>Number of Floor</label>
									<input type="number" name="floor" class="form-control">
								</div>
								<div class="form-group">
									<label>Number of Bedrooms</label>
									<input type="number" name="bedroom" class="form-control">
								</div>
								<div class="form-group">
									<label>Number of Living rooms</label>
									<input type="number" name="living" class="form-control">
								</div>
								<div class="form-group">
									<label>Number of toilets</label>
									<input type="number" name="toilet" class="form-control">
								</div>
							</div>

							<div class="col-12 col-md-6">
								<div class="form-group">
									<header class="heading">House features</header>
									<label>Water Supply?</label>
									<select name="water" class="form-control">
										<option>--select--</option>
										<option>YES</option>
										<option>NO</option>
									</select>
								</div>
								<div class="form-group">
									<label>Electricity Supply?</label>
									<select name="electricity" class="form-control">
										<option>--select--</option>
										<option>YES</option>
										<option>NO</option>
									</select>
								</div>
								<div class="form-group">
									<label>Has Garage?</label>
									<select name="garage" class="form-control">
										<option>--select--</option>
										<option>YES</option>
										<option>NO</option>
									</select>
								</div>
								<div class="form-group">
									<label>More about your house</label>
									<textarea rows="6" cols="" class="form-control" name="house-features" placeholder="Write more unique features of your house"></textarea>
								</div>
							</div>

						</section>

						<div class="col-12">
							<span id="back-btn" class="btn btn-success d-none float-left">Back</span>
							<span id="next-btn" class="btn btn-success float-right">Next</span>
							<input type="submit" value="Add Property" class="btn btn-success d-none float-right">
						</div>
					</form>
				</div>
			</div>
		</div>
		<%@ include file="/user/includes/footer.html" %>
		<script type="text/javascript" src="/land_and_house/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="/land_and_house/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/land_and_house/js/general.js"></script>
	</body>
	</html>