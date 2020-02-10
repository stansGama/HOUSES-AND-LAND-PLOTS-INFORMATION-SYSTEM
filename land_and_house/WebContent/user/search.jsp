<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="database.*"%>
<%@ page import="business.*"%>
<%@ page import="controler.Search"%>
<%@ page import="java.util.*"%>

<%
	HttpSession userSession = request.getSession();
	User user = (User) userSession.getAttribute("user");
	if (user == null) {
		response.sendRedirect("/land_and_house/login.jsp");
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

	<!-- Top section ends -->
	<%@ include file="/user/includes/header.html"%>


	<!--Content starts -->
	<div class="container">
		<div class="row justify-content-center">
			<%@ include file="/user/includes/search.html"%>
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
							<small class="text-muted">Last updated 3 mins ago</small>
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
						<small class="text-muted">Last updated 3 mins ago</small>
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
<%-- <%@ include file="/user/includes/footer.html" %> --%>
	<script type="text/javascript"
		src="/land_and_house/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript"
		src="/land_and_house/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/land_and_house/js/general.js"></script>
</body>
</html>