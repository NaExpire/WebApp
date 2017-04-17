<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="naexpire.DBManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script src="js/jquery-3.1.1.min.js"></script>
</head>
<body>
<div class="top-menu">
	<span class="welcome">Welcome, Clinton!</span>
	<span class="top-menu-item"><a href="logout.jsp">Log Out</a></span>
	<span class="top-menu-item"><a href="stats.jsp">Stats</a></span>
	<span class="top-menu-item"><a href="search.jsp">Search</a></span>
	<span class="top-menu-item"><a href="browse.jsp">Browse</a></span>
	<span class="top-menu-item"><a href="index.jsp">Home</a></span>
</div>
<div class="content">
	<div class="title">
		NAExpire
	</div>
	<div class="content-columns">
		<div class="content-column">
			<h3>App Info</h3>
			<p>From here, you can access the major database tables, edit their contents, perform specialized searches, view the status of the system servers, sales, and registrations.</p>
			<p>Administrators can modify user accounts, reset passwords, and manually update settings.</p>
		</div>
		<div class="content-column">
			<h3>Basic Stats</h3>
			<table class="basic-stats">
			<tr><th></th><th>This Month</th><th>This Year</th><th>Total</th></tr>
			<tr><th>App DLs:</th><td>0</td><td>0</td><td>0</td></tr>
			<tr><th>New Users:</th><td>2</td><td>2</td><td>2</td></tr>
			<tr><th>New Restaurants:</th><td>2</td><td>2</td><td>2</td></tr>
			<tr><th>Deals Sold:</th><td>0</td><td>0</td><td>0</td></tr>
			<tr><th>Income:</th><td>$0.00</td><td>$0.00</td><td>$0.00</td></tr>
			</table>
		</div>
		<div class="content-column">
			<h3>Status</h3>
			<div class="status">
			<span class="status-label">Web Server</span><div class="green led"></div><br /><br />
			<span class="status-label">API Server</span><div class="green led"></div><br /><br />
			<span class="status-label">Database Server</span><div class="
			<%
				DBManager dbm = new DBManager();
				if (!dbm.testConnection()) {
					out.print("green");
				}
				else {
					out.print("red");
				}
			%>
			 led"></div><br /><br />
			<span class="status-label">Google App Server</span><div class="green led"></div><br /><br />
			</div>
		</div>
	</div>
</div>
</body>
</html>