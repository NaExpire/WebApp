<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New User Registration</title>
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
  <h2>Enter User Information</h2>
  <form method="post" action="submitregistration.jsp">
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
    
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
</div>
</body>
</html>