<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*" %>
<%@ page import="business.*" %>
<%@ page import="java.util.*" %>
<%
HttpSession userSession = request.getSession();
User user = (User)userSession.getAttribute("user");
if(user == null){
response.sendRedirect("/land_and_house/login.jsp");
} else{
if(request.getParameter("id") == null){
response.sendRedirect("/land_and_house/user/");
}else{

%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>property information</title>
	<link rel="stylesheet" type="text/css" href="/land_and_house/css/bootstrap.min.css">
	<link href="/land_and_house/css/all.min.css" type="text/css" rel="stylesheet">
	<link href="/land_and_house/css/general.css" type="text/css" rel="stylesheet">

</head>
<body>
	<!-- Top navigation bar starts -->
	<%@ include file="/user/includes/header.html" %>
	<!-- Top navigation bar ends -->

	<div class="container">
		<div id="row1" class="row justify-content-center">
			<%@ include file="/user/includes/search.html" %>
			<% 
			Property property = PropertyDb.getProperty(request.getParameter("id"));
			if(property.getProperty_id().isEmpty() || property.getOwner().isEmpty()){
				response.sendRedirect("/land_and_house/user/");
			}else{
				User propertyUser = UserDb.getProfile(property.getOwner());
			Set<Map.Entry<Integer, String[]>> pics = property.getPictures().entrySet();
			%>

			<h3>Property Details</h3>
			
			<div class="row col-12">

				<!-- infomation div starts -->
				<div class="property-info col-12 col-md-5 justify-content-center rounded border">

					<div class="w-100">
						<header class="col-12">General information of the property</header>

						<div class="col-md">
							<table class="table table-borderless table-hover">
								<tr>
									<th>Price:</th>
									<td><% out.print(property.getPrice()); %></td>
								</tr>
								<tr>
								<th>Size</th>
								<td><% out.print(property.getSize()); %></td>
							</tr>
								<tr>
									<th>Owner phone</th>
									<td><% out.print(propertyUser.getPhone()); %></td>
								</tr>
								<tr>
									<th>Owner email</th>
									<td><% out.print(property.getOwner()); %></td>
								</tr>

							</table>

						</div>
						<div class="col-md">
							<header>Location</header>
							<table class="table table-borderless table-hover">
								<tr>
									<th>Country</th>
									<td><% out.print(property.getCountry()); %></td>
								</tr>
								<tr>
									<th>Region/city</th>
									<td><% out.print(property.getCity()); %></td>
								</tr>
								<tr>
									<th>District</th>
									<td><% out.print(property.getDistrict()); %></td>
								</tr>
								<tr>
									<th>Ward</th>
									<td><% out.print(property.getWard()); %></td>
								</tr>
								<tr>
									<th>Street</th>
									<td><% out.print(property.getStreet()); %></td>
								</tr>

							</table>

						</div>
						<% if(property.getType().equals("1")){
						House house  = HouseDb.getHouse(property.getProperty_id());

						%>

						<div class="col-md">
							<header>Features</header>
							<table class="table table-borderless table-hover">
								<tr>
									<th>House number</th>
									<td><% out.print(house.getHouse_no()); %></td>
								</tr>
								<tr>
								<th>Year built</th>
								<td><% out.print(house.getYear_built()); %></td>
							</tr>
								<tr>
									<th>Total Floor</th>
									<td><% out.print(house.getFloor()); %></td>
								</tr>
								<tr>
									<th>Total bedrooms</th>
									<td><% out.print(house.getBedroom()); %></td>
								</tr>
								<tr>
									<th>Total livingrooms</th>
									<td><% out.print(house.getLivingroom()); %></td>
								</tr>
								
								<tr>
									<th>Total toilets</th>
									<td> <% out.print(house.getToilet()); %></td>
								</tr>
								<tr>
								<th>Has garage</th>
								<td><% out.print(house.getGarage()); %></td>
							</tr>
								<tr>
									<th>Water supply</th>
									<td><% out.print(house.getWater()); %></td>
								</tr>
								<tr>
									<th>Electricity supply</th>
									<td><% out.print(house.getElectricity()); %></td>
								</tr>
								<tr>
									<th>More house information</th>
									<td><% out.print(house.getOther_features()); %></td>
								</tr>
							</table>

						</div>
						<%} %>

						<% if(property.getType().equals("2")){
						Land land = LandDb.getLand(property.getProperty_id());
						%>

						<div class="col-md">
							<header>Features</header>
							<table class="table table-borderless table-hover">
								<tr>
								<th>Land Type</th>
								<td><% out.print(land.getLand_type()); %></td>
							</tr>
								<tr>
									<th>More Land information</th>
									<td><% out.print(land.getFeatures()); %></td>
								</tr>
							</table>

						</div>
						<%} %>
					</div>


				</div>
				<!-- information div ends -->

				<!-- image div starts -->
				<div class="property-info col-12 col-md-7 justify-content-center rounded border">
					<header class="col-12"><i class="fas fa-images fa-lg"></i> Property pictures</header>

					<% for(Map.Entry<Integer, String[]> pic:pics) { 
					%>
					<div class="img-div col-12">
						<span class="col-12">
							<img src="/land_and_house/uploads/<% out.print(pic.getValue()[0]); %>" class="img-thumbnail w-100">
						</span>
						<span class="col-12 mb-4"><% out.print(pic.getValue()[1]); %></span>
					</div>
					<%} %>
				<!-- <div class="img-div col-12">
					<img src="/land_and_house/img/sa5.jpg" class="img-thumbnail">
					<span class="col-10">Photo caption 2</span>
				</div>
				<div class="img-div col-12">
					<img src="/land_and_house/img/sa6.jpg" class="img-thumbnail">
					<span class="col-10">Photo caption 3</span>
				</div>
				<div class="img-div col-12">
					<img src="/land_and_house/img/sa5.jpg" class="img-thumbnail">
					<span class="col-10">Photo caption 4</span>
				</div> -->
				<i id="back" class="fas fa-chevron-left fa-4x" ></i>
				<i id="next" class="float-right fas fa-chevron-right fa-4x"></i>
				

				<div class="col-12">
					<form class="form form-horizontal mt-2" method="POST" action="comment">
						<div class="form-group">
							<label>Comment this house</label>
							<input type="hidden" name="id"  value=<% out.print(property.getProperty_id()); %>>
							<textarea class="form-control" name="comment" placeholder="write your comment">

							</textarea>
						</div>
						<div class="form-group col-8">
							<input type="submit" name="post" value="Comment" class="form-control btn btn-primary w-50">
						</div>
					</form>
					<div>
						<header>Previous comments</header>
						<%
						ArrayList<Comment> comments = property.getComments();
						if(comments.isEmpty()){
							out.print("<p>No comments on this property</p>");
						}else{
						for(Comment comment:comments) { %>
						<div class="card">
							<div class="card-header mb-2">
								<% out.print(comment.getCommenter()); %><span class="float-right"><% out.print(comment.getTime()); %></span>
							</div>
							<div class="card-body">
								<p class="card-text"><% out.print(comment.getComment()); %></p>
							</div>
						</div>
						<%
						}}
						%>
						<a href="#" class="float-right">View more</a>
					</div>
				</div>
			</div>
			<!-- 	image div ends -->
			
		</div>
	<%} %>
	</div>
</div>





<%@ include file="/user/includes/footer.html" %>
<% } } %>
<script type="text/javascript" src="/land_and_house/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/land_and_house/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/land_and_house/js/general.js"></script>
<script type="text/javascript" src="/land_and_house/js/viewproperty.js"></script>
</body>
</html>