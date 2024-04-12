<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>


<style>
</style>

<title>Login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body
	style="background-image: url('images/loginback.jpg'); background-size: cover;">

	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp"> <a
					class="navbar-brand" href="index.jsp"><span
						class="glyphicon glyphicon-cutlery">&nbsp;</span>PrimeEats</a>
				</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="login.jsp">Login</a></li>
					<li><a href="register.jsp">Register</a></li>
					<li><a href="index.jsp">Dishes</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Category <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">

							<li><a href="adminViewProduct.jsp?type=South_Indian_Food">South
									Indian Food</a></li>
							<li><a href="adminViewProduct.jsp?type=Maharastra's_Food">Maharastra's
									Food</a></li>
							<li><a href="adminViewProduct.jsp?type=breakfast">Breakfast</a></li>
							<li><a href="adminViewProduct.jsp?type=Nonveg">Non-Veg
									Food</a></li>
							<li><a href="adminViewProduct.jsp?type=Punjabi">Punjabi
									Food</a></li>
							<li><a href="adminViewProduct.jsp?type=chinese">Chainese
									Food</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<%
	String message = request.getParameter("message");
	%>
	<div class="container">
		<div class="row"
			style="margin-top: 200px; margin-left: 2px; margin-right: 2px;">





			<form action="./LoginSrv" method="post"
				class="col-md-4 col-md-offset-4 col-sm-8 col-sm-offset-2"
				style="border: 2px solid black; border-radius: 10px; background-color: rgba(255, 229, 204, 0.7); padding: 10px;">
				<div style="font-weight: bold;" class="text-center">
					<h2
						style="font-size: 30px; font-family: 'Arial', sans-serif; text-shadow: 2px 2px 4px #000000; letter-spacing: 2px; color: #ffffff;">Login
						Form</h2>
					<% if (message != null) { %>
					<p style="color: blue;"><%=message%></p>
					<% } %>
				</div>
				<div class="row">
					<div class="col-md-12 form-group">
						<label for="last_name">Username</label> <input type="email"
							placeholder="Enter Username" name="username" class="form-control"
							id="last_name" required>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 form-group">
						<label for="last_name">Password</label> <input type="password"
							placeholder="Enter Password" name="password" class="form-control"
							id="last_name" required>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 form-group">
						<label for="userrole">Login As</label> <select name="usertype"
							id="userrole" class="form-control" required>
							<option value="customer" selected>CUSTOMER</option>
							<option value="admin">ADMIN</option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 text-center">
						<button type="submit" class="btn btn-success">Login</button>
					</div>
				</div>
			</form>







		</div>
	</div>



</body>
</html>