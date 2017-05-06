<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Restaurant Registration</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/update-ajax.js"></script>
</head>
<body style = "background-color:#00C5A1;">
<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="index.jsp">Cafe Redux</a>
	</div>
	<ul class="nav navbar-nav navbar-right">
		<li><a href="register.jsp">Register User</a><li>
		<li><a href="registerrestaurant.jsp">Register Restaurant</a><li>
		<li><a href="getapp.jsp">Get App</a><li>
		<li><a href="index.jsp">Admin</a><li>
	</ul>
</nav>
<div class="container">
  <h2>Enter Restaurant Information</h2>
  <form method="post" action="submitrestaurant.jsp">
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" name="email" placeholder="Enter email">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Enter password">
    </div>
    <div class="form-group">
      <label for="fn">First Name:</label>
      <input type="text" class="form-control" id="fn" name="fn" placeholder="Enter first name">
    </div>
    <div class="form-group">
      <label for="ln">Last Name:</label>
      <input type="text" class="form-control" id="ln" name="ln" placeholder="Enter last name">
    </div>
    <div class="form-group">
      <label for="name">Restaurant Name:</label>
      <input type="text" class="form-control" id="name" name="name" placeholder="Enter restaurant name">
    </div>
    <div class="form-group">
      <label for="descr">Description:</label>
      <textarea rows="4" class="form-control" id="descr" name="descr" >Enter restaurant description</textarea>
    </div>
    <div class="form-group">
      <label for="address">Address:</label>
      <input type="text" class="form-control" id="address" name="address" placeholder="Enter business address">
    </div>
    <div class="form-group">
      <label for="city">City:</label>
      <input type="text" class="form-control" id="city" name="city" placeholder="Enter city">
    </div>
    <div class="form-group">
      <label for="state">State:</label>
      <input type="text" class="form-control" id="state" name="state" placeholder="Enter state">
    </div>
    <div class="form-group">
      <label for="zip">Zip Code:</label>
      <input type="text" class="form-control" id="zip" name="zip" placeholder="Enter zip code">
    </div>
    <div class="form-group">
      <label for="phone">Phone Number:</label>
      <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter phone number">
    </div>
    
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
</div>
</body>
</html>