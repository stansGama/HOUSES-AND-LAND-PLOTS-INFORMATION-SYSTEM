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
user = new User();
}else{
user = UserDb.getProfile(user.getEmail());
}
%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>My profile</title>
	<link rel="stylesheet" type="text/css" href="/land_and_house/css/bootstrap.min.css">
	<link href="/land_and_house/css/all.min.css" type="text/css" rel="stylesheet">
	<link href="/land_and_house/css/general.css" type="text/css" rel="stylesheet">
</head>
<body>
	<%@ include file="/user/includes/header.html" %>
	<div class="mb-3 jumbotron jumbotron-fluid w-100">
		<div class="container">
			<header class="display-4">User Profile Information</header>
			<hr class="my-4">
		</div>
	</div>

	<div class="container">
		<div class="row content justify-content-center">
			<%@ include file="/user/includes/search.html" %>


			


			<div class="col-12 col-md-8 profile">
				${ message }
				<div class="profile-header">
					<header >Profile Details</header>
					<span class="icon"><i class="fa fa-user-cog"></i></span>
				</div>
				<table class="table">
					<tr>
						<th>First name</th>
						<td><% out.print(user.getFirst_name()); %></td>
						<td>
							<a href="#" id="firstName" class="edit">Edit <i class="fa fa-edit"></i></a>
						</td>
					</tr>
					<tr class="hide" aria-labelledby="firstName">
						<td>
							<form class="form-horizontal" method="POST" action="editprofile">
								<input type="hidden" name="action" value="firstName">
								<div class="form-group">
									<label>Change to</label>
									<input type="text" name="new"  class="form-control">
								</div>
								<div class="form-group">
									<label>Password</label>
									<input type="password" name="password" class="form-control">
								</div>
								<div class="form-group">
									<input type="submit" name="change" value="change" class="col-4 btn btn-success form-control">
									<button class="col-4 btn btn-primary form-control cancel">Cancel <i class="fa fa-times"></i></button>
								</div>	
							</form>
						</td>
					</tr>
					<tr>
						<th>Last name</th>
						<td> <% out.print(user.getLast_name()); %> </td>
						<td>
							<a href="#" id="lastName" class="edit">Edit <i class="fa fa-edit"></i></a>
						</td>
					</tr>
					<tr class="hide" aria-labelledby="lastName">
						<td>
							<form class="form-horizontal" method="POST" action="editprofile">
								<input type="hidden" name="action" value="lastName">
								<div class="form-group">
									<label>Change to</label>
									<input type="text" name="new"  class="form-control">
								</div>
								<div class="form-group">
									<label>Password</label>
									<input type="password" name="password" class="form-control">
								</div>
								<div class="form-group">
									<input type="submit" name="change" value="change" class="col-4 btn btn-success form-control">
									<button class="col-4 btn btn-primary form-control cancel">Cancel <i class="fa fa-times"></i></button>
								</div>	
							</form>
						</td>
					</tr>
					<tr>
						<th>Birth date</th>
						<td> <% out.print(user.getDob()); %></td>
						<td>
							<a href="#" id="dob" class="edit">Edit <i class="fa fa-edit"></i></a>
						</td>
					</tr>
					<tr class="hide" aria-labelledby="dob">
						<td>
							<form class="form-horizontal" method="POST" action="editprofile">
								<input type="hidden" name="action" value="dob">
								<div class="form-group">
									<label>Change to</label>
									<input type="date" name="new"  class="form-control">
								</div>
								<div class="form-group">
									<label>Password</label>
									<input type="password" name="password" class="form-control">
								</div>
								<div class="form-group">
									<input type="submit" name="change" value="change" class="col-4 btn btn-success form-control">
									<button class="col-4 btn btn-primary form-control cancel">Cancel <i class="fa fa-times"></i></button>
								</div>	
							</form>
						</td>
					</tr>
					<tr>
						<th>email</th>
						<td><% out.print(user.getEmail()); %></td>
					</tr>
					<tr>
						<th>Phone number</th>
						<td> <% out.print(user.getPhone()); %></td>
						<td>
							<a href="#" id="phone" class="edit">Edit <i class="fa fa-edit"></i></a>
						</td>
					</tr>
					<tr class="hide" aria-labelledby="phone">
						<td>
							<form class="form-horizontal" method="POST" action="editprofile">
								<input type="hidden" name="action" value="phoneNumber" >
								<div class="form-group">
									<label>Change to</label>
									<input type="text" name="new"  class="form-control">
								</div>
								<div class="form-group">
									<label>Password</label>
									<input type="password" name="password" class="form-control">
								</div>
								<div class="form-group">
									<input type="submit" name="change" value="change" class="col-4 btn btn-success form-control">
									<button class="col-4 btn btn-primary form-control cancel">Cancel <i class="fa fa-times"></i></button>
								</div>	
							</form>
						</td>
					</tr>
					<tr>
						<th>Country</th>
						<td> <%out.print(user.getCountry()); %></td>
						<td>
							<a href="#" id="country" class="edit">Edit <i class="fa fa-edit"></i></a>
						</td>
					</tr>
					<tr class="hide" aria-labelledby="country">
						<td>
							<form class="form-horizontal" method="POST" action="editprofile">
								<input type="hidden" name="action" value="country">
								<div class="form-group">
									<label>Change to</label>
									<input type="text" name="new"  class="form-control">
								</div>
								<div class="form-group">
									<label>Password</label>
									<input type="password" name="password" class="form-control">
								</div>
								<div class="form-group">
									<input type="submit" name="change" value="change" class="col-4 btn btn-success form-control">
									<button class="col-4 btn btn-primary form-control cancel">Cancel <i class="fa fa-times"></i></button>
								</div>	
							</form>
						</td>
					</tr>
					<tr>
						<th>City/Region</th>
						<td><% out.print(user.getCity()); %> </td>
						<td>
							<a href="#" id="city" class="edit">Edit <i class="fa fa-edit"></i></a>
						</td>
					</tr>
					<tr class="hide" aria-labelledby="city">
						<td>
							<form class="form-horizontal" method="POST" action="editprofile">
								<input type="hidden" name="action" value="city">
								<div class="form-group">
									<label>Change to</label>
									<input type="text" name="new"  class="form-control">
								</div>
								<div class="form-group">
									<label>Password</label>
									<input type="password" name="password" class="form-control">
								</div>
								<div class="form-group">
									<input type="submit" name="change" value="change" class="col-4 btn btn-success form-control">
									<button class="col-4 btn btn-primary form-control cancel">Cancel <i class="fa fa-times"></i></button>
								</div>	
							</form>
						</td>
					</tr>
					<tr>
						<th>District</th>
						<td> <% out.print(user.getDistrict()); %></td>
						<td>
							<a href="#" id="district" class="edit">Edit <i class="fa fa-edit"></i></a>
						</td>
					</tr>
					<tr class="hide" aria-labelledby="district">
						<td >
							<form class="form-horizontal" method="POST" action="editprofile">
								<input type="hidden" name="action" value="district">
								<div class="form-group">
									<label>Change to</label>
									<input type="text" name="new"  class="form-control">
								</div>
								<div class="form-group">
									<label>Password</label>
									<input type="password" name="password" class="form-control">
								</div>
								<div class="form-group">
									<input type="submit" name="change" value="change" class="col-4 btn btn-success form-control">
									<button class="col-4 btn btn-primary form-control cancel">Cancel <i class="fa fa-times"></i></button>
								</div>	
							</form>	
						</td>
					</tr>
				</table>
			</div>

			<div class="col-12 col-md-4 profile">
				<div class="profile-header">
					<header>Other links</header>
					<span class="icon"><i class="fa fa-external-link-alt"></i></span>
				</div>
				<div class="profile-link">
					<a class="edit" href="#" id="changePassword">Change password <i class="fa fa-lock"></i></a>
				</div>
				<form class="form-horizontal hide" aria-labelledby="changePassword" method="POST" action="editprofile">
					<div class="form-group">
						<input type="hidden" name="action" value="password">
						<label>Current password</label>
						<input type="password" name="password" class="form-control" required>
					</div>
					<div class="form-group">
						<label>New password</label>
						<input type="password" name="new" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Verify password</label>
						<input type="password" name="newVerify" class="form-control" required>
					</div>
					<div class="form-group">
						<input type="submit" name="change-password" value="Change password" class="btn btn-success form-control">
					</div>
				</form>

				<div class="profile-link">
					<a href="/land_and_house/user/properties.jsp">My properties <i class="fa fa-book"></i></a>
				</div>
				<div class="profile-link">
					<a href="/land_and_house/user/addproperty.jsp">Add properties <i class="fa fa-book-medical"></i></a>
				</div>
			</div>

		</div>
	</div>
<%@ include file="/user/includes/footer.html" %>
	<script type="text/javascript" src="/land_and_house/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/land_and_house/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/land_and_house/js/general.js"></script>
	<script type="text/javascript" src="/land_and_house/js/profile.js"></script>
</body>
</html>