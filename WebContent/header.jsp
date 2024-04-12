<%@page import="com.shashi.beans.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.shashi.service.impl.*, com.shashi.service.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Logout Header</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<style type="text/css">
	
	
	

	
	
	.hotel-background {
    background-image: url('https://as1.ftcdn.net/v2/jpg/06/42/44/42/1000_F_642444216_pBQb0bhgPXt930kekD98qD6kLncPyr06.jpg'); /* Add the path to your background image */
    background-size: cover;
    background-position: center;
}


	
	
    .hotel-background {
        background-size: cover;
        background-position: center;
        animation: slide 20s linear infinite;
    }



    @keyframes slide {
        0% {
            background-image: url('images/food4.jpg');
        }
        25% {
           background-image: url('images/food3.jpg');
        }
        50% {
           background-image: url('images/food4.jpg');
        }
        75% {
           background-image: url('images/food3.jpg');
        }
        100% {
            background-image: url('images/food1.jpg');
        }
    }


	
	
	
	
	</style>
	
	

</head>
<body style="background-color: #E6F9E6;">


	<!--Company Header Starting  -->
<div class="container-fluid text-center hotel-background" style="margin-top: 45px; color: white; padding: 110px;">
   <h1 style="font-size: 55px; font-family: 'Arial', sans-serif; text-shadow: 2px 2px 4px #000000; letter-spacing: 2px; color: #ffffff;">PrimeEats</h1>
    <h6 style="font-size: 25px; font-family: 'Arial', sans-serif; text-shadow: 2px 2px 4px #000000; letter-spacing: 2px; color: #ffffff;">Thank you for choosing PrimeEats !</h6>
    <form class="form-inline" action="index.jsp" method="get">
        <div class="input-group">
            <input type="text" class="form-control" size="50" name="search" placeholder="Search Items" required>
            <div class="input-group-btn">
                <input type="submit" class="btn btn-danger" value="Search" />
            </div>
        </div>
    </form>
    <br>
    <p align="center" style="color: yellow; font-weight: bold; margin-top: 5px; margin-bottom: 5px;" id="message"></p>
</div>
<!-- Company Header Ending -->

	<%
	/* Checking the user credentials */
	String userType = (String) session.getAttribute("usertype");
	if (userType == null) { //LOGGED OUT
	%>

	<!-- Starting Navigation Bar -->
	<nav class="navbar navbar-default navbar-fixed-top   custom-navbar">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp"><span class="glyphicon glyphicon-cutlery">&nbsp;</span>PrimeEats</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="login.jsp">Login</a></li>
					<li><a href="register.jsp">Register</a></li>
					<li><a href="index.jsp">index</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Category <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
						<li><a href="index.jsp?type=South_Indian_Food">South Indian Food</a></li>
							<li><a href="index.jsp?type=Maharastra's_Food">Maharastra's Food</a></li>
							<li><a href="index.jsp?type=breakfast">Breakfast</a></li>
							<li><a href="index.jsp?type=Nonveg">Non-Veg Food</a></li>
							<li><a href="index.jsp?type=Punjabi">Punjabi Food</a></li>
							<li><a href="index.jsp?type=chinese">Chainese Food</a></li>
						</ul></li>
						
						<li><a href="index.jsp">Home</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<%
	} else if ("customer".equalsIgnoreCase(userType)) { //CUSTOMER HEADER

	int notf = new CartServiceImpl().getCartCount((String) session.getAttribute("username"));
	%>
	
	
	
	

	<%
	/* Checking the user credentials */
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");

	if (userName == null || password == null) {

		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
	}

	UserService dao = new UserServiceImpl();
	UserBean user = dao.getUserDetails(userName, password);
	if (user == null)
		user = new UserBean("Test User", 98765498765L, "test@gmail.com", "ABC colony, Pune", 87659, "lksdjf");
	%>
	
	
	
	
	
	
	<nav class="navbar navbar-default navbar-fixed-top ">

		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="userHome.jsp"><span
					class="glyphicon glyphicon-home">&nbsp;</span>   Welcome to PrimeEats, <span style="font-weight: bold; color: #FF5733;"><%= user.getName() %></span></a>
			</div>

			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="userHome.jsp"><span
							class="">Food-Menu</span></a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Category <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="userHome.jsp?type=South_Indian_Food">South Indian Food</a></li>
							<li><a href="userHome.jsp?type=Maharastra's_Food">Maharastra's Food</a></li>
							<li><a href="userHome.jsp?type=breakfast">Breakfast</a></li>
							<li><a href="userHome.jsp?type=Nonveg">Non-Veg Food</a></li>
							<li><a href="userHome.jsp?type=Punjabi">Punjabi Food</a></li>
							<li><a href="userHome.jsp?type=chinese">Chainese Food</a></li>
						</ul></li>
					<%
					if (notf == 0) {
					%>
					<li><a href="cartDetails.jsp"> <span
							class="glyphicon glyphicon-shopping-cart"></span>Cart
					</a></li>

					<%
					} else {
					%>
					<li><a href="cartDetails.jsp"
						style="margin: 0px; padding: 0px;" id="mycart"><i
							data-count="<%=notf%>"
							class="fa fa-shopping-cart fa-3x icon-white badge"
							style="background-color: #333; margin: 0px; padding: 0px; padding-bottom: 0px; padding-top: 5px;">
						</i></a></li>
					<%
					}
					%>
					<li><a href="orderDetails.jsp">Orders</a></li>
					<li><a href="userProfile.jsp">Profile</a></li>
					<li><a href="./LogoutSrv">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<%
	} else { //ADMIN HEADER
	%>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="adminViewProduct.jsp"><span
					class="fa-solid fa-utensils">&nbsp;</span>PrimeEats</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="adminViewProduct.jsp">Food Items</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Category <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="adminViewProduct.jsp?type=South_Indian_Food">South Indian Food</a></li>
							<li><a href="adminViewProduct.jsp?type=Maharastra's_Food">Maharastra's Food</a></li>
							<li><a href="adminViewProduct.jsp?type=breakfast">Breakfast</a></li>
							<li><a href="adminViewProduct.jsp?type=Nonveg">Non-Veg Food</a></li>
							<li><a href="adminViewProduct.jsp?type=Punjabi">Punjabi Food</a></li>
							<li><a href="adminViewProduct.jsp?type=chinese">Chainese Food</a></li>
						</ul></li>
					
					<li><a href="shippedItems.jsp">Delivery Status</a></li>
					<li><a href="unshippedItems.jsp">Orders</a></li>
					<!-- <li><a href=""> <span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;Cart</a></li> -->
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Update Items <span
							class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="addProduct.jsp">Add Food Item</a></li>
							<li><a href="removeProduct.jsp">Remove Food Item</a></li>
							<li><a href="updateProductById.jsp">Update Food Item</a></li>
						</ul></li>
					<li><a href="./LogoutSrv">Logout</a></li>

				</ul>
			</div>
		</div>
	</nav>
	<%
	}
	%>
	<!-- End of Navigation Bar -->
</body>
</html>