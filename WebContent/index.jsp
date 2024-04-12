<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.shashi.service.impl.*, com.shashi.service.*,com.shashi.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>

<style>
/* Define CSS for the background image */
.discount-offer {
	border: solid red 10px;
	background-image: url('images/primeEatBanner.jpg');
	/* Specify the path to your background image */
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
	padding: 280px; /* Adjust padding as needed */
	color: white; /* Adjust text color as needed */
	text-align: center; /* Center the text */
	position: relative;
	overflow: hidden;
	transition: transform 0.3s ease;
}

/* Define CSS for the overlay (hover effect) */
.discount-offer::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%; //
	background-color: rgba(0, 0, 0, 0.5);
	/* Adjust the overlay color and opacity */
	opacity: 0;
	transition: opacity 0.3s ease;
}

/* Define CSS for the text inside the container */
.discount-offer h2, .discount-offer p {
	position: relative;
	z-index: 1;
}

/* Define CSS for the hover effect */
.discount-offer:hover::before {
	opacity: 1;
}

/* Define CSS for the hover effect on container */
.discount-offer:hover {
	transform: scale(1.05); /* Adjust the scale factor for zoom effect */
}

.cart-box {
	position: relative;
	overflow: hidden;
	transition: transform 0.4s ease;
}

/* Define CSS for the hover effect on the cart box */
.cart-box:hover {
	transform: scale(1.09); /* Adjust the scale factor for zoom effect */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add shadow on hover */
	border: solid black 2px;
	background-color: #bdefbd;
}

.productname {
	color: forestgreen;
	font-size: 18px;
	font-family: cursive;
}
</style>




<title>Hotel</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #E6F9E6;">



	<%
	/* Checking the user credentials */
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");
	String userType = (String) session.getAttribute("usertype");

	boolean isValidUser = true;

	if (userType == null || userName == null || password == null || !userType.equals("customer")) {

		isValidUser = false;
	}

	ProductServiceImpl prodDao = new ProductServiceImpl();
	List<ProductBean> products = new ArrayList<ProductBean>();

	String search = request.getParameter("search");
	String type = request.getParameter("type");
	String message = "All Food Items";
	if (search != null && !search.trim().isEmpty()) {
		products = prodDao.searchAllProducts(search);
		message = "Showing Results for '" + search + "'";
	} else if (type != null && !type.trim().isEmpty()) {
		products = prodDao.getAllProductsByType(type);
		message = "Showing Results for '" + type + "'";
	} else {
		products = prodDao.getAllProducts();
	}
	if (products.isEmpty()) {
		message = "No items found for the search '" + 
	((search != null && !search.trim().isEmpty()) ? search : type) + "'";
		products = prodDao.getAllProducts();
	}
	%>


	</div>

	<jsp:include page="header.jsp" />


	<br>
	<br>
	<br>
	<div class="alert alert-info" role="alert">

		<div class="text-center"
			style="font-size: 20px; font-family: 'Arial', sans-serif; letter-spacing: 2px; color: red;"><%=message%></div>

	</div>

	<div class="text-center" id="message"
		style="color: black; font-size: 14px; font-weight: bold;"></div>
	<br>
	<br>
	<!-- Start of Product Items List -->
	<div class="container">
		<div class="row text-center">

			<%
			for (ProductBean product : products) {
				int cartQty = new CartServiceImpl().getCartItemCount(userName, product.getProdId());
			%>
			<div class="col-sm-4" style='height: 350px;'>
				<div class="thumbnail cart-box">
					<img src="./ShowImage?pid=<%=product.getProdId()%>" alt="Product"
						style="height: 150px; max-width: 180px">
					<p class="productname"><%=product.getProdName()%>
					</p>
					<%
					String description = product.getProdInfo();
					description = description.substring(0, Math.min(description.length(), 100));
					%>
					<p class="productinfo"><%=description%>..
					</p>
					<p class="price">
						Rs
						<%=product.getProdPrice()%>
					</p>
					<form method="post">
						<%
					if (cartQty == 0) {
					%>
						<button type="submit"
							formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=1"
							class="btn btn-success">Add</button>
						&nbsp;&nbsp;&nbsp;
						<button type="submit"
							formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=1"
							class="btn btn-primary">Order Now</button>
						<%
						} else {
						%>
						<button type="submit"
							formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=0"
							class="btn btn-danger">Remove From Added List</button>
						&nbsp;&nbsp;&nbsp;
						<button type="submit" formaction="cartDetails.jsp"
							class="btn btn-success">Pay</button>
						<%
						}
						%>
					</form>
					<br />
				</div>
			</div>

			<%
			}
			%>

		</div>
	</div>
	<!-- ENd of Product Items List -->


	<!-- Add the discount offer with the background image -->
	<div class="discount-offer"></div>

	<%@ include file="footer.html"%>

</body>
</html>