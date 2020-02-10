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
	<title>Welcome</title>
	<link rel="stylesheet" type="text/css" href="/land_and_house/css/bootstrap.min.css">
	<link href="/land_and_house/css/all.min.css" type="text/css" rel="stylesheet">
	<link href="/land_and_house/css/general.css" type="text/css" rel="stylesheet">
</head>
<body>
	
	<!-- Top section ends -->
	<%@ include file="/user/includes/header.html" %>


	<!--Content starts -->
	<div class="container">
		<div class="row justify-content-center">
		<%@ include file="/user/includes/search.html" %>


			<!-- Recently added properties starts -->
			<div style="height: max-content;" class="card-deck col-12">
				<header style="margin-top: 15px; margin-bottom: 15px;" class="col-12 card-header">Check Out Recently Added Houses for sale </header>
				<%
				ArrayList<Property> properties = PropertyDb.getProperties();
				for(Property property: properties){
					if(property.getType().equals("1")){
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
				<%	}			
				}%>

			</div>
			
			<div style="height: max-content;" class="card-deck col-12">
				<header style="margin-top: 15px; margin-bottom: 15px;" class="col-12 card-header">Check Out Recently Added Lands-plots </header>
				<%
				for(Property property: properties){
					if(property.getType().equals("2")){
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
				<%	}			
				}%>

			</div>

			<!-- Most  Viewed added properties starts -->
			<div class="view">
			</div>
			<!-- Most viewed added properties ends -->


		</div>
	</div>
	<!-- Contents ends -->
<%@ include file="/user/includes/footer.html" %>
	<script type="text/javascript" src="/land_and_house/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/land_and_house/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/land_and_house/js/general.js"></script>
</body>
</html>