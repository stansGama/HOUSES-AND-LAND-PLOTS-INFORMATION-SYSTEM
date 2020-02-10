<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="database.*"%>
<%@ page import="business.*"%>
<%@ page import="java.util.*"%>
<%
HttpSession userSession = request.getSession();
User user = (User) userSession.getAttribute("user");

if (user == null) {
response.sendRedirect("/land_and_house/login.jsp");
} else {
ArrayList<Property> properties = PropertyDb.getUserProperties(user);
	%>
	<!DOCTYPE html>
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>PropertyInfo</title>
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
				<header class="display-4">My properties</header>
				<hr class="my-4">
				<nav aria-label="breadcrumb" class="col-12">
					<ol class="breadcrumb">
						<li class="breadcrumb-item">
							<a href="/land_and_house/user/profile.jsp">Profile</a>
						</li>
						<li class="breadcrumb-item active" aria-current="page">My Properties</li>
					</ol>
				</nav>
			</div>
		</div>
		<div class="container">
			<div class="row justify-content-center">
			<%@ include file="/user/includes/search.html" %>
				
				<p> ${ message } </p>
				<div class="table-responsive">
					<table class="table table-hover table-bordered">
					<thead class="thead-light">
						<tr>
							<th>#</th>
							<th class="d-none d-md-table-cell">Id</th>
							<th>Price</th>
							<th>Type</th>
							<th class="d-none d-md-table-cell">Country</th>
							<th class="d-none d-md-table-cell">City/Region</th>
							<th class="d-none d-md-table-cell">District</th>
							<th class="d-none d-md-table-cell">Ward</th>
							<th class="d-none d-md-table-cell">Street</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<%
						if (!properties.isEmpty()) {
						int i =1;
						for (Property property : properties) {
						%>
						<tr>
							<td> <% out.print(i); %></td>
							<td class="d-none d-md-table-cell">
								<%
								out.print(property.getProperty_id());
								%>
							</td>
							<td>
								<%
								out.print(property.getPrice());
								%>
							</td>
							<td>
								<%
								out.print(property.getType().equals("1") ? "House" : "Land");
								%>
							</td>
							<td class="d-none d-md-table-cell">
								<%
								out.print(property.getCountry());
								%>
							</td>
							<td class="d-none d-md-table-cell">
								<%
								out.print(property.getCity());
								%>
							</td>
							<td class="d-none d-md-table-cell">
								<%
								out.print(property.getDistrict());
								%>
							</td>
							<td class="d-none d-md-table-cell">
								<%
								out.print(property.getWard());
								%>
							</td>
							<td class="d-none d-md-table-cell">
								<%
								out.print(property.getStreet());
								%>
							</td>
							<td><a
								href="/land_and_house/user/property.jsp?id=<%out.print(property.getProperty_id());%>"
								class="btn btn-primary">View more</a></td>
							</tr>
							<%
						i++;}
					} else {%>
					<tr><td>No property Available</td></tr>
					<% } %>
				</tbody>

			</table>
				</div>
				
		</div>

	</div>
<%-- <%@ include file="/user/includes/footer.html" %> --%>
	<script type="text/javascript"
	src="/land_and_house/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript"
	src="/land_and_house/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/land_and_house/js/general.js"></script>


</body>
</html>
<%
}
%>
