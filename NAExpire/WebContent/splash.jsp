<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="naexpire.DBManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to NAExpire</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/update-ajax.js"></script>
<script>
$(document).ready(function() {
	
	var cycleImage = function(n) {
		
		if (n == 3) {
			$("#imgthree").fadeOut(850);
			$("#imgfour").fadeIn(850);
		}
		else if (n == 0) {
			$("#imgfour").fadeOut(850);
			$("#imgone").fadeIn(850);
		}
		else if (n == 1) {
			$("#imgone").fadeOut(850);
			$("#imgtwo").fadeIn(850);
		}
		else {
			$("#imgtwo").fadeOut(850);
			$("#imgthree").fadeIn(850);
		}
	};
	
	counter = 0;
	setInterval(function() {
		counter = counter % 4;
		cycleImage(counter);
		counter++;
	},2000);

	// while (1) {cycleImage();}
	
});
</script>
</head>
<%

	DBManager dbm = new DBManager();
	String phone = "";
	String email = "";
	String about = "";
	String sustainable = "";
	
	String[][] contacts = dbm.getContact();
	for (String[] contact : contacts) {
		
		if (contact[0].equals("phone")) {
			phone = contact[1];
		}
		else if (contact[0].equals("email")) {
			email = contact[1];
		}
		
	}
	
	String[][] contents = dbm.getSplash();
	for (String[] content : contents) {
		
		if (content[0].equals("about")) {
			about = content[1];
		}
		else if (content[0].equals("sustainable")) {
			sustainable = content[1];
		}
		
	}

%>
<body style = "background-color:#00C5A1;">
<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="index.jsp">Cafe Redux</a>
	</div>
	<ul class="nav navbar-nav navbar-right">
		<li><a href="register.jsp">Register User</a><li>
		<li><a href="registerrestaurant.jsp">Register Restaurant</a><li>
		<li><a href="getapp.jsp">Get App</a><li>
		<li><a href="login.jsp">Admin</a><li>
	</ul>
</nav>
<div class = "container" style="padding-top:50px;">
	<center>
	<img src="img/CafeRedux-White-Transparent.jpg" style="width:881px;height:221px;" style="margin-bottom:12px;"><br />
	</center>
	<div class="row">
		<div class="imagge-carousel">
			<div style="position:absolute;" class="carousel-imagge" id="imgone"><img src="img/1.jpg"></div>
			<div style="position:absolute;" class="carousel-imagge" id="imgtwo"><img src="img/2.jpg"></div>
			<div style="position:absolute;" class="carousel-imagge" id="imgthree"><img src="img/3.jpg"></div>
			<div style="position:absolute;" class="carousel-imagge" id="imgfour"><img src="img/4.jpg"></div>
		</div>
	</div>
</div><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
<div class="container">
	<div class="row">
		<div class="col-lg-4">
			<div class="panel panel-default">
				<div class="panel-heading">About Us</div>
				<div class="panel-body"><%= about %></div>
			</div>
		</div>
		<div class="col-lg-4">
			<div class="panel panel-default">
				<div class="panel-heading">Sustainable Development</div>
				<div class="panel-body"><%= sustainable %></div>
			</div>
		</div>
		<div class="col-lg-4">
			<div class="panel panel-default">
				<div class="panel-heading">Contact Us</div>
				<div class="panel-body"><b>Phone: </b><a href="tel:<%= phone %>"><%= phone %></a><br /><br /></div>
				<div class="panel-body"><b>Email: </b><a href="mailto:<%= email %>"><%= email %></a><br /></div>
			</div>
		</div>
	</div>
</div>
</body>
</html>