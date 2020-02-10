<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="database.*"%>
<%@ page import="business.*"%>
<%@ page import="controler.Search"%>
<%@ page import="java.util.*"%>

<%
HttpSession userSession = request.getSession();
User user = (User)userSession.getAttribute("user");
if(user != null){
response.sendRedirect("/land_and_house/user/search.jsp");
}else{
}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>search result</title>
<link rel="stylesheet" type="text/css"
	href="/land_and_house/css/bootstrap.min.css">
<link href="/land_and_house/css/all.min.css" type="text/css"
	rel="stylesheet">
<link href="/land_and_house/css/general.css" type="text/css"
	rel="stylesheet">
</head>
<body>

	<header class="navbar navbar-expand-sm" id="topbar">

		<div class="container-fluid">
			<!--  logo start -->
			<div class="navbar-brand">
			<a href="/land_and_house/" class="nav-link"><i class="fa fa-home fa-lg"></i> HOLA</a>
		</div>
			<!--  logo end -->
			<span class="float-sm-right">
				<a href="#advance-search" id="search-btn">
					<i class="p-2 fa fa-search fa-1x"></i> Search
				</a>
			</span>
			<div class="float-sm-right">
				<ul class="navbar-nav">
					<li class="nav-item"><a href="/land_and_house/login.jsp" class="nav-link ">Login</a></li>
					<li class="nav-item"> <a href="/land_and_house/register.jsp" class="nav-link ">Sign Up</a></li>
				</ul>
			</div>
		</div>
	</header>
	<!-- Top section ends -->


	<!--Content starts -->
	<div class="container">
		<div class="row justify-content-center">
			<div id="advance-search" class="filter col-12 col-md-10 rounded border mt-4" style="display: none;">

	<header class="w-100">Advanced Search</header>
	<form class="form-horizontal col-12 row no-gutters" action="search.jsp">

		<fieldset class="col-12 form-row">
			<legend>Search Location</legend>
			<div class="col-12 form-row">
				<div class="form-group col-9">
					<input type="search" name="location" placeholder="city/district/ward/street" class="form-control form-control-lg">
				</div>
				<div class="form-group col-3">
					<input type="submit" name="search" value="Search" class="btn btn-primary form-control form-control-lg">
				</div>
			</div>
		</fieldset>


		<div class="form-group col-md-6">
			<label class="mr-2">Property type</label>
			<select class="form-control form-control-sm w-50" name="property-type" id="property-type-search">
				<option selected>house</option>
				<option>land-plot</option>
			</select>
		</div>

		<fieldset class="col-md-6">
			<div class="col form-row">
				<div class="form-group col-6">
					<label class="">Min Price</label>
					<input type="number" name="price-min" class="form-control form-control-sm">
				</div>
				<div class="form-group col-6">
					<label class="">Max Price</label>
					<input type="number" name="price-max" class="form-control form-control-sm">
				</div>
			</div>
		</fieldset>


		<fieldset id="house-features-search" class="col-12 form-row">
			<legend>House Features</legend>
			<div class="col-12 form-row align-items-end">
				<div class="form-group col-6 col-md-3 ">
					<label class="mr-2">Number Bedroom</label>
					<select class="form-control form-control-sm" name="bedroom">
						<option selected value="0">ALL</option>
						<option value="1">1+</option>
						<option value="2">2+</option>
						<option value="3">3+</option>
						<option value="4">4+</option>
						<option value="5">5+</option>
						<option value="6">6+</option>
						<option value="7">7+</option>
					</select>
				</div>
				<div class="form-group col-6 col-md-3">
					<label class="mr-2">Number of toilets</label>
					<select class="form-control form-control-sm" name="toilet">
						<option selected value="0">ALL</option>
						<option value="1">1+</option>
						<option value="2">2+</option>
						<option value="3">3+</option>
						<option value="4">4+</option>
						<option value="5">5+</option>
						<option value="6">6+</option>
						<option value="7">7+</option>
					</select>
				</div>
				<div class="form-group col-6 col-md-3">
					<label class="mr-2">Electricity Supply</label>
					<select class="form-control form-control-sm" name="electricity">
						<option selected>BOTH</option>
						<option>YES</option>
						<option>NO</option>
					</select>
				</div>
				<div class="form-group col-6 col-md-3">
					<label class="mr-2">Water supply</label>
					<select class="form-control form-control-sm" name="water">
						<option selected>BOTH</option>
						<option>YES</option>
						<option>NO</option>
					</select>
				</div>
			</div>
		</fieldset>
	</form>
</div>
			<!-- Filters div ends -->

			
			
			
			
			<div style="height: max-content;" class="card-deck col-12">
			<header style="margin-top: 15px; margin-bottom: 15px;" class="col-12 card-header"> 
			Search results
			</header>
			<%
			String priceMin = request.getParameter("price-min") !=null?request.getParameter("price-min"):"";
			String priceMax = request.getParameter("price-max") != null?request.getParameter("price-max"):"";
			String location = request.getParameter("location") != null?request.getParameter("location"):"";
			String propertyType = request.getParameter("property-type") != null?request.getParameter("property-type"):"";
			String bedroom = request.getParameter("bedroom") !=null?request.getParameter("bedroom"):"";
			String toilet =request.getParameter("toilet") != null?request.getParameter("toilet"):"";
			String water =request.getParameter("water") != null?request.getParameter("water"):"";
			String electricity = request.getParameter("electricity");
			ArrayList<Property> properties = PropertyDb.getProperties(); 
			if(!location.isEmpty()){
			long min= 0;
			long max=-1;
			int bedroomNo = 0;
			int toiletNo = 0;
			if(!priceMin.isEmpty() || !priceMax.isEmpty() || !bedroom.isEmpty() || !toilet.isEmpty()){
				try{
					min = Long.parseLong(priceMin);
				}catch (NumberFormatException e){
				}
				try{
					max = Long.parseLong(priceMax);
				}catch (NumberFormatException e){
				}
				try{
					bedroomNo = Integer.parseInt(bedroom);
				}catch (NumberFormatException e){
				}
				try{
					toiletNo = Integer.parseInt(toilet);
				}catch (NumberFormatException e){
				}
				
			}
			properties = Search.search(properties, location, min, max);
			if(properties.isEmpty()){ out.print("<h3>Oooops Sorry No result found that matches your search</h3>");}
			if(propertyType.toLowerCase().equals("house")){
				ArrayList<Property> houses = Search.searchHouse(properties, bedroomNo, toiletNo, water, electricity);
				if(houses.isEmpty()){ out.print("<h3>Oooops Sorry No result found that matches your search</h3>");}
				for(Property property:houses){
					TreeMap<Integer,String[]> picture_map = property.getPictures();
					String[] pictures = picture_map.get(1);%>
					
					<div class="card-div col-12 col-md-6 col-lg-4">
					<div  class="card h-100">
						<img src="/land_and_house/uploads/<% out.print(pictures[0]); %>" class="h-50 card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">House for sale</h5>
							<span>price: <%out.print(property.getPrice()); %>Tzs</span>
							<span>Owner <%out.print(property.getOwner()); %></span>
							<span>Location: <%out.print(property.getCity()+ " " + property.getDistrict()); %></span>
							<a class="btn btn-primary stretched-link"
							href="viewproperty.jsp?id=<% out.print(property.getProperty_id()); %>">View Details</a>
						</div>
						<div class="card-footer">
							<small class="text-muted"></small>
						</div>
					</div>
				</div>
				
				<%}
			} if(propertyType.toLowerCase().equals("land-plot")){
				for(Property property: properties){
					if(property.getType().equals("2")){
					TreeMap<Integer,String[]> picture_map = property.getPictures();
					String[] pictures = picture_map.get(1);%>
					<div class="card-div col-12 col-md-6 col-lg-4">
				<div  class="card h-100">
					<img src="/land_and_house/uploads/<% out.print(pictures[0]); %>" class="h-50 card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Land-plot for sale</h5>
						<span>price: <%out.print(property.getPrice()); %>Tzs</span>
						<span>Owner <%out.print(property.getOwner()); %></span>
						<span>Location: <%out.print(property.getCity()+ " " + property.getDistrict()); %></span>
						<a class="btn btn-primary stretched-link"
						href="viewproperty.jsp?id=<% out.print(property.getProperty_id()); %>">View Details</a>
					</div>
					<div class="card-footer">
						<small class="text-muted"></small>
					</div>
				</div>
			</div>
					
				<%	}
				}
			}
				
			}else{
				out.print("<h3>Please enter location.. <br>No result found that matches your search</h3>");
			}
			%>
		</div>
			
		</div>
	</div>
	<!-- Contents ends -->
<!-- 	<footer class="footer">
<div class="container">
		<span class="">&copy; 2019 Mzumbe university</span>
	</div>
</footer> -->

	<script type="text/javascript"
		src="/land_and_house/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript"
		src="/land_and_house/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/land_and_house/js/general.js"></script>
</body>
</html>