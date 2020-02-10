<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="database.*"%>
<%@ page import="business.*"%>
<%@ page import="java.util.*"%>
<%
	HttpSession userSession = request.getSession();
	User user = (User) userSession.getAttribute("user");
	String propertyId = request.getParameter("id");
	if (user == null) {
		response.sendRedirect("/land_and_house/login.jsp");
	} else {
		if (propertyId == null) {
			response.sendRedirect("/land_and_house/user/properties.jsp");
		}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>My profile</title>
<link rel="stylesheet" type="text/css"
	href="/land_and_house/css/bootstrap.min.css">
<link href="/land_and_house/css/all.min.css" type="text/css"
	rel="stylesheet">
<link href="/land_and_house/css/general.css" type="text/css"
	rel="stylesheet">
</head>
<body>
	<%@ include file="/user/includes/header.html"%>

	<div class="mb-3 jumbotron jumbotron-fluid w-100">
		<div class="container">
			<header class="display-4">Property Information</header>
			<hr class="my-4">
			<nav aria-label="breadcrumb" class="col-12">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a
						href="/land_and_house/user/profile.jsp">Profile</a></li>
					<li class="breadcrumb-item active"><a
						href="/land_and_house/user/properties.jsp">My properties</a></li>
					<li class="breadcrumb-item active" aria-current="page">Property
						Information</li>
				</ol>
			</nav>
		</div>
	</div>

	<div class="container">
		<div class="content row justify-content-center">
			<%@ include file="/user/includes/search.html"%>


			<header class="col-12"> ${ message } </header>
			<%
				Boolean availabe = false;
					ArrayList<Property> properties = PropertyDb.getUserProperties(user);
					for (Property property : properties) {
						if (property.getProperty_id().equals(propertyId)) {
							userSession.setAttribute("property", property);
							availabe = true;
			%>
			<!-- Property start -->
			<div class="property col-12 row m-2 justify-content-center">
				<!-- Property Image start -->
				<div class="profile col-12">
					<header class="col-12">
						<i class="fas fa-images fa-lg"></i> Property pictures
					</header>
					<%
						Set<Map.Entry<Integer, String[]>> pics = property.getPictures().entrySet();
									for (Map.Entry<Integer, String[]> pic : pics) {
					%>
					<div class="row justify-content-center m-2">
						<div class="img-div col-lg-8">
							<img
								src="/land_and_house/uploads/<%out.print(pic.getValue()[0]);%>"
								class="img-thumbnail w-100"> <span class="col-10 m-1">
								<%
									out.print(pic.getValue()[1]);
								%>
							</span>
						</div>
					</div>
					<%
						}
					%>
					<div>
						<button id="add-picture" class="edit btn btn-primary">
							Add picture</button>
					</div>
					<div class="hide col-12" aria-labelledby="add-picture">
						<form class="form-horizontal" method="POST" action="addphoto"
							enctype="multipart/form-data">
							<input name="action" value="add-picture" type="hidden">
							<div class="form-group">
								<label>Upload picture</label> <input type="file" name="pic"
									class="form-control-file">
							</div>
							<div class="form-group">
								<label>Photo caption</label>
								<textarea class="form-control" name="caption"></textarea>
							</div>
							<div class="form-group">
								<input type="submit" name="change" value="upload"
									class="col-4 btn btn-success form-control">
								<button class="col-4 btn btn-primary form-control cancel">
									Cancel <i class="fa fa-times"></i>
								</button>
							</div>
						</form>
					</div>

				</div>
				<!-- Property Image ends -->

				<!-- Property Informations Starts -->
				<div class="profile col-12 col-lg-10">
					<div>
						<div class="profile-header">
							<header>Property Details</header>
							<span class="icon"><i class="fa fa-user-cog"></i></span>
						</div>
						<table class="table table-hover">
							<tr>
								<th>Price</th>
								<td>
									<%
										out.print(property.getPrice());
									%>
								</td>
								<td><a href="#" id="price" class="edit">Edit <i
										class="fa fa-edit"></i></a></td>
							</tr>
							<tr class="hide" aria-labelledby="price">
								<td>
									<form class="form-horizontal" method="POST"
										action="editproperty">
										<input name="action" value="price" type="hidden">
										<div class="form-group">
											<label>Change to</label> <input type="number" name="new"
												class="form-control">
										</div>
										<div class="form-group">
											<input type="submit" name="change" value="change"
												class="col-4 btn btn-success form-control">
											<button class="col-4 btn btn-primary form-control cancel">
												Cancel <i class="fa fa-times"></i>
											</button>
										</div>
									</form>
								</td>
							</tr>
							<tr>
								<th>Size</th>
								<td>
									<%
										out.print(property.getSize());
									%>
								</td>
								<td><a href="#" id="size" class="edit">Edit <i
										class="fa fa-edit"></i></a></td>
							</tr>
							<tr class="hide" aria-labelledby="size">
								<td>
									<form class="form-horizontal" method="POST"
										action="editproperty">
										<input name="action" value="size" type="hidden">
										<div class="form-group">
											<label>Change to</label> <input type="number" name="new"
												class="form-control">
										</div>
										<div class="form-group">
											<input type="submit" name="change" value="change"
												class="col-4 btn btn-success form-control">
											<button class="col-4 btn btn-primary form-control cancel">
												Cancel <i class="fa fa-times"></i>
											</button>
										</div>
									</form>
								</td>
							</tr>
						</table>

					</div>

					<!-- Location details starts -->
					<div>
						<div class="profile-header">
							<header>Location</header>
							<span class="icon"><i class="fa fa-user-cog"></i></span>
						</div>
						<table class="table table-hover">
							<tr>
								<th>Country</th>
								<td>
									<%
										out.print(property.getCountry());
									%>
								</td>
								<td><a href="#" id="country" class="edit">Edit <i
										class="fa fa-edit"></i></a></td>
							</tr>
							<tr class="hide" aria-labelledby="country">
								<td>
									<form class="form-horizontal" method="POST"
										action="editproperty">
										<input name="action" value="country" type="hidden">
										<div class="form-group">
											<label>Change to</label> <input type="text" name="new"
												class="form-control">
										</div>
										<div class="form-group">
											<input type="submit" name="change" value="change"
												class="col-4 btn btn-success form-control">
											<button class="col-4 btn btn-primary form-control cancel">
												Cancel <i class="fa fa-times"></i>
											</button>
										</div>
									</form>
								</td>
							</tr>
							<tr>
								<th>Region/city</th>
								<td>
									<%
										out.print(property.getCity());
									%>
								</td>
								<td><a href="#" id="city" class="edit">Edit <i
										class="fa fa-edit"></i></a></td>
							</tr>
							<tr class="hide" aria-labelledby="city">
								<td>
									<form class="form-horizontal" method="POST"
										action="editproperty">
										<input name="action" value="city" type="hidden">
										<div class="form-group">
											<label>Change to</label> <input type="text" name="new"
												class="form-control">
										</div>
										<div class="form-group">
											<input type="submit" name="change" value="change"
												class="col-4 btn btn-success form-control">
											<button class="col-4 btn btn-primary form-control cancel">
												Cancel <i class="fa fa-times"></i>
											</button>
										</div>
									</form>
								</td>
							</tr>
							<tr>
								<th>District</th>
								<td>
									<%
										out.print(property.getDistrict());
									%>
								</td>
								<td><a href="#" id="district" class="edit">Edit <i
										class="fa fa-edit"></i></a></td>
							</tr>
							<tr class="hide" aria-labelledby="district">
								<td>
									<form class="form-horizontal" method="POST"
										action="editproperty">
										<input name="action" value="district" type="hidden">
										<div class="form-group">
											<label>Change to</label> <input type="text" name="new"
												class="form-control">
										</div>
										<div class="form-group">
											<input type="submit" name="change" value="change"
												class="col-4 btn btn-success form-control">
											<button class="col-4 btn btn-primary form-control cancel">
												Cancel <i class="fa fa-times"></i>
											</button>
										</div>
									</form>
								</td>
							</tr>
							<tr>
								<th>Ward</th>
								<td>
									<%
										out.print(property.getWard());
									%>
								</td>
								<td><a href="#" id="ward" class="edit">Edit <i
										class="fa fa-edit"></i></a></td>
							</tr>
							<tr class="hide" aria-labelledby="ward">
								<td>
									<form class="form-horizontal" method="POST"
										action="editproperty">
										<input name="action" value="ward" type="hidden">
										<div class="form-group">
											<label>Change to</label> <input type="text" name="new"
												class="form-control">
										</div>
										<div class="form-group">
											<input type="submit" name="change" value="change"
												class="col-4 btn btn-success form-control">
											<button class="col-4 btn btn-primary form-control cancel">
												Cancel <i class="fa fa-times"></i>
											</button>
										</div>
									</form>
								</td>
							</tr>
							<tr>
								<th>Street</th>
								<td>
									<%
										out.print(property.getStreet());
									%>
								</td>
								<td><a href="#" id="street" class="edit">Edit <i
										class="fa fa-edit"></i></a></td>
							</tr>
							<tr class="hide" aria-labelledby="street">
								<td>
									<form class="form-horizontal" method="POST"
										action="editproperty">
										<input name="action" value="street" type="hidden">
										<div class="form-group">
											<label>Change to</label> <input type="text" name="new"
												class="form-control">
										</div>
										<div class="form-group">
											<input type="submit" name="change" value="change"
												class="col-4 btn btn-success form-control">
											<button class="col-4 btn btn-primary form-control cancel">
												Cancel <i class="fa fa-times"></i>
											</button>
										</div>
									</form>
								</td>
							</tr>
						</table>
					</div>
					<!-- Location Ends -->
					<%
						if (property.getType().equals("1")) {
					%>
					<!-- Features Starts -->
					<div>
						<div class="profile-header">
							<header>Property Details</header>
							<span class="icon"><i class="fa fa-user-cog"></i></span>
						</div>
						<%
							House house = HouseDb.getHouse(property.getProperty_id());
						%>
						<table class="table table-hover">
							<tr>
								<th>House number</th>
								<td>
									<%
										out.print(house.getHouse_no());
									%>
								</td>
								<td><a href="#" id="house-no" class="edit">Edit <i
										class="fa fa-edit"></i></a></td>
							</tr>
							<tr class="hide" aria-labelledby="house-no">
								<td>
									<form class="form-horizontal" method="POST"
										action="editproperty">
										<input name="action" value="house-no" type="hidden">
										<div class="form-group">
											<label>Change to</label> <input type="text" name="new"
												class="form-control">
										</div>
										<div class="form-group">
											<input type="submit" name="change" value="change"
												class="col-4 btn btn-success form-control">
											<button class="col-4 btn btn-primary form-control cancel">
												Cancel <i class="fa fa-times"></i>
											</button>
										</div>
									</form>
								</td>
							</tr>
							<tr>
								<th>Year Built</th>
								<td>
									<%
										out.print(house.getYear_built());
									%>
								</td>
								<td><a href="#" id="year-built" class="edit">Edit <i
										class="fa fa-edit"></i></a></td>
							</tr>
							<tr class="hide" aria-labelledby="year-built">
								<td>
									<form class="form-horizontal" method="POST"
										action="editproperty">
										<input name="action" value="year-built" type="hidden">
										<div class="form-group">
											<label>Change to</label> <input type="text" name="new"
												class="form-control">
										</div>
										<div class="form-group">
											<input type="submit" name="change" value="change"
												class="col-4 btn btn-success form-control">
											<button class="col-4 btn btn-primary form-control cancel">
												Cancel <i class="fa fa-times"></i>
											</button>
										</div>
									</form>
								</td>
							</tr>
							<tr>
								<th>Number of floor</th>
								<td>
									<%
										out.print(house.getFloor());
									%>
								</td>
								<td><a href="#" id="house-type" class="edit">Edit <i
										class="fa fa-edit"></i></a></td>
							</tr>
							<tr class="hide" aria-labelledby="house-type">
								<td>
									<form class="form-horizontal" method="POST"
										action="editproperty">
										<input name="action" value="floor" type="hidden">
										<div class="form-group">
											<label>Change to</label> <input type="number" name="new"
												class="form-control">
										</div>
										<div class="form-group">
											<input type="submit" name="change" value="change"
												class="col-4 btn btn-success form-control">
											<button class="col-4 btn btn-primary form-control cancel">
												Cancel <i class="fa fa-times"></i>
											</button>
										</div>
									</form>
								</td>
							</tr>
							<tr>
								<th>Total bedrooms</th>
								<td>
									<%
										out.print(house.getBedroom());
									%>
								</td>
								<td><a href="#" id="bedroom" class="edit">Edit <i
										class="fa fa-edit"></i></a></td>
							</tr>
							<tr class="hide" aria-labelledby="bedroom">
								<td>
									<form class="form-horizontal" method="POST"
										action="editproperty">
										<input name="action" value="bedroom" type="hidden">
										<div class="form-group">
											<label>Change to</label> <input type="number" name="new"
												class="form-control">
										</div>
										<div class="form-group">
											<input type="submit" name="change" value="change"
												class="col-4 btn btn-success form-control">
											<button class="col-4 btn btn-primary form-control cancel">
												Cancel <i class="fa fa-times"></i>
											</button>
										</div>
									</form>
								</td>
							</tr>
							<tr>
								<th>Total livingrooms</th>
								<td>
									<%
										out.print(house.getLivingroom());
									%>
								</td>
								<td><a href="#" id="livingroom" class="edit">Edit <i
										class="fa fa-edit"></i></a></td>
							</tr>
							<tr class="hide" aria-labelledby="livingroom">
								<td>
									<form class="form-horizontal" method="POST"
										action="editproperty">
										<input name="action" value="livingroom" type="hidden">
										<div class="form-group">
											<label>Change to</label> <input type="number" name="new"
												class="form-control">
										</div>
										<div class="form-group">
											<input type="submit" name="change" value="change"
												class="col-4 btn btn-success form-control">
											<button class="col-4 btn btn-primary form-control cancel">
												Cancel <i class="fa fa-times"></i>
											</button>
										</div>
									</form>
								</td>
							</tr>
							<tr>
								<th>Total toilets</th>
								<td>
									<%
										out.print(house.getToilet());
									%>
								</td>
								<td><a href="#" id="toilet" class="edit">Edit <i
										class="fa fa-edit"></i></a></td>
							</tr>
							<tr class="hide" aria-labelledby="toilet">
								<td>
									<form class="form-horizontal" method="POST"
										action="editproperty">
										<input name="action" value="toilet" type="hidden">
										<div class="form-group">
											<label>Change to</label> <input type="number" name="new"
												class="form-control">
										</div>
										<div class="form-group">
											<input type="submit" name="change" value="change"
												class="col-4 btn btn-success form-control">
											<button class="col-4 btn btn-primary form-control cancel">
												Cancel <i class="fa fa-times"></i>
											</button>
										</div>
									</form>
								</td>
							</tr>
							<tr>
								<th>Garage</th>
								<td>
									<%
										out.print(house.getGarage());
									%>
								</td>
								<td><a href="#" id="garage" class="edit">Edit <i
										class="fa fa-edit"></i></a></td>
							</tr>
							<tr class="hide" aria-labelledby="garage">
								<td>
									<form class="form-horizontal" method="POST"
										action="editproperty">
										<input name="action" value="garage" type="hidden">
										<div class="form-group">
											<label>Change to</label> <select name="new"
												class="form-control">
												<option>--select--</option>
												<option>YES</option>
												<option>NO</option>
											</select>

										</div>
										<div class="form-group">
											<input type="submit" name="change" value="change"
												class="col-4 btn btn-success form-control">
											<button class="col-4 btn btn-primary form-control cancel">
												Cancel <i class="fa fa-times"></i>
											</button>
										</div>
									</form>
								</td>
							</tr>
							<tr>
								<th>Water supply</th>
								<td>
									<%
										out.print(house.getWater());
									%>
								</td>
								<td><a href="#" id="water" class="edit">Edit <i
										class="fa fa-edit"></i></a></td>
							</tr>
							<tr class="hide" aria-labelledby="water">
								<td>
									<form class="form-horizontal" method="POST"
										action="editproperty">
										<input name="action" value="water" type="hidden">
										<div class="form-group">
											<label>Change to</label> <select name="new"
												class="form-control">
												<option>--select--</option>
												<option>YES</option>
												<option>NO</option>
											</select>
										</div>
										<div class="form-group">
											<input type="submit" name="change" value="change"
												class="col-4 btn btn-success form-control">
											<button class="col-4 btn btn-primary form-control cancel">
												Cancel <i class="fa fa-times"></i>
											</button>
										</div>
									</form>
								</td>
							</tr>
							<tr>
								<th>Electricity supply</th>
								<td>
									<%
										out.print(house.getElectricity());
									%>
								</td>
								<td><a href="#" id="electric" class="edit">Edit <i
										class="fa fa-edit"></i></a></td>
							</tr>
							<tr class="hide" aria-labelledby="electric">
								<td>
									<form class="form-horizontal" method="POST"
										action="editproperty">
										<input name="action" value="electric" type="hidden">
										<div class="form-group">
											<label>Change to</label> <select name="new"
												class="form-control">
												<option>--select--</option>
												<option>YES</option>
												<option>NO</option>
											</select>
										</div>

										<div class="form-group">
											<input type="submit" name="change" value="change"
												class="col-4 btn btn-success form-control">
											<button class="col-4 btn btn-primary form-control cancel">
												Cancel <i class="fa fa-times"></i>
											</button>
										</div>
									</form>
								</td>
							</tr>
							<tr>
								<th>More information</th>
								<td>
									<%
										out.print(house.getOther_features());
									%>
								</td>
								<td><a href="#" id="other" class="edit">Edit <i
										class="fa fa-edit"></i></a></td>
							</tr>
							<tr class="hide" aria-labelledby="other">
								<td>
									<form class="form-horizontal" method="POST"
										action="editproperty">
										<input name="action" value="other" type="hidden">
										<div class="form-group">
											<label>Change to</label>
											<textarea name="new" class="form-control"></textarea>
										</div>

										<div class="form-group">
											<input type="submit" name="change" value="change"
												class="col-4 btn btn-success form-control">
											<button class="col-4 btn btn-primary form-control cancel">
												Cancel <i class="fa fa-times"></i>
											</button>
										</div>
									</form>
								</td>
							</tr>
						</table>
					</div>
					<!-- Features Ends -->
					<%
						} else if (property.getType().equals("2")) {
					%>
					<!-- Land features Starts -->
					<div>
						<div class="profile-header">
							<header>Property Details</header>
							<span class="icon"><i class="fa fa-user-cog"></i></span>
						</div>
						<%
							Land land = LandDb.getLand(property.getProperty_id());
						%>
						<table class="table table-hover ">
							<tr>
								<th>Land Type</th>
								<td>
									<%
										out.print(land.getLand_type());
									%>
								</td>
								<td><a href="#" id="land-type" class="edit">Edit <i
										class="fa fa-edit"></i></a></td>
							</tr>
							<tr class="hide" aria-labelledby="land-type">
								<td>
									<form class="form-horizontal" method="POST"
										action="editproperty">
										<input name="action" value="land-type" type="hidden">
										<div class="form-group">
											<label>Change to</label> <input type="text" name="new"
												class="form-control">
										</div>

										<div class="form-group">
											<input type="submit" name="change" value="change"
												class="col-4 btn btn-success form-control">
											<button class="col-4 btn btn-primary form-control cancel">
												Cancel <i class="fa fa-times"></i>
											</button>
										</div>
									</form>
								</td>
							</tr>

							<tr>
								<th>More information</th>
								<td>
									<%
										out.print(land.getFeatures());
									%>
								</td>
								<td><a href="#" id="other" class="edit">Edit <i
										class="fa fa-edit"></i></a></td>
							</tr>
							<tr class="hide" aria-labelledby="other">
								<td>
									<form class="form-horizontal" method="POST"
										action="editproperty">
										<input name="action" value="other-land" type="hidden">
										<div class="form-group">
											<label>Change to</label>
											<textarea name="new" class="form-control"></textarea>
										</div>
										<div class="form-group">
											<input type="submit" name="change" value="change"
												class="col-4 btn btn-success form-control">
											<button class="col-4 btn btn-primary form-control cancel">
												Cancel <i class="fa fa-times"></i>
											</button>
										</div>
									</form>
								</td>
							</tr>
						</table>
					</div>
					<!-- Land features Ends -->


					<%
						}
					%>

				</div>
				<!-- Property Infromation Ends -->

				<!-- Remove button -->
				<div class="m-2">
					<button id="delete-property" class="edit btn btn-danger">
						Remove property <i class="fa fa-times"></i>
					</button>
					<form class="hide form form-inline"
						aria-labelledby="delete-property" method="POST"
						action="editproperty">
						<p>Do really want to delete this property?</p>
						<input name="action" value="delete-property" type="hidden">
						<div class="form-group">
							<label>Password</label> <input type="password" name="password"
								class="form-control">
						</div>
						<div class="form-group col-12">
							<input type="submit" name="change" value="Yes"
								class="m-2 col-4 btn btn-success form-control">
							<button class="m-2 col-4 btn btn-primary form-control cancel">
								Cancel <i class="fa fa-times"></i>
							</button>
						</div>
					</form>
				</div>
				<!-- Remove button -->
			</div>
			<!-- Property End -->


			<%
				}
					}
			%>
			<div>
				<p>
					<%
						if (!availabe)
								out.print("Property not availbale");
					%>
				</p>
			</div>



		</div>
	</div>
<%@ include file="/user/includes/footer.html" %>
	<script type="text/javascript"
		src="/land_and_house/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript"
		src="/land_and_house/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/land_and_house/js/general.js"></script>
	<script type="text/javascript" src="/land_and_house/js/profile.js"></script>
	<script type="text/javascript" src="/land_and_house/js/viewproperty.js"></script>
</body>
</html>

<%
	}
%>

