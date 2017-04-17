<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script src="js/jquery-3.1.1.min.js"></script>
<script>
$(document).ready(function() {
	$("#opt-deals").click(function() {
		$(".option-deals").css("visibility", "visible");
	});
});
</script>
<style>
</style>
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
	<div class="search-form">
		<form name="search" action="results.jsp">
			<div class="search-table">
				<select name="table">
					<option value="users">Users</option>
					<option value="restaurants">Restaurants</option>
					<option value="menus">Menus</option>
					<option id="opt-deals" value="deals">Deals</option>
				</select>
			</div><br />
			<div class="search-basic">Find text matching: 
				<input type="text" name="text" />
			</div><br />
			<div class="search-advanced">Restaurant: 
				<select name="restaurant">
					<option></option>
					<option value="lolos">Lolo's Chicken and Waffles</option>
					<option value="kebab">Flaming Kebab</option>
				</select>
			</div><br />
			<div class="search-cost">Value: 
				<select name="gtlt">
					<option></option>
					<option value="gt">&gt;</option>
					<option value="lt">&lt;</option>
				</select>
				<input type="text" name="money" />
			</div><br />
			<input type="submit" value="Search" />
		</form>
	</div>
</div>
</body>
</html>