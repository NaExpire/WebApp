<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="naexpire.DBManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Browse</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/update-ajax.js"></script>
<script>
$(document).ready(function() {

	var hits = 0;
	$(".table-element").click(function() {
		if (hits % 2 == 0) {
			var i = $(this).text();
	    	$(this).html('<input type="text" class="in" value="' + i + '" /> <span class="done">Done</span>');
	        hits = hits + 1;
	    }
	    else {
	    	var j = $(this).children('.in').val();
	        $(this).html(j);
	        hits = hits + 1;
	    }
	});
	
	$(".submit-all").click(function() {
		$(".in").each(function() {
			var k = $(this).val();
			$(this).parent().html(k);
		});
	});
	
	$(".new-password").click(function() {

		var r = confirm("Set new password?");
	    if (r) {
			alert("New password: " + newpw());
	        $(this).text(fakehash());
	    }
	    else {
	    	alert("Password will remain the same.");
	    }
	    

	});
	
	function editfield() {
		
	}
	
	function submitedit() {
		
	}

	function newpw() {
	    var text = "";
	    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

	    for( var i=0; i < 5; i++ )
	        text += possible.charAt(Math.floor(Math.random() * possible.length));

	    return text;
	}

	function fakehash() {

		var text = "";
	    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

	    for( var i=0; i < 16; i++ )
	        text += possible.charAt(Math.floor(Math.random() * possible.length));

	    return text;

	}
	
});
</script>
</head>
<body>
<div class="row">
<div class="col-lg-12">
	<div class="top-menu">
		<span class="welcome">Welcome, Clinton!</span>
		<span class="top-menu-item"><a href="logout.jsp">Log Out</a></span>
		<span class="top-menu-item"><a href="stats.jsp">Stats</a></span>
		<span class="top-menu-item"><a href="search.jsp">Search</a></span>
		<span class="top-menu-item"><a href="browse.jsp">Browse</a></span>
		<span class="top-menu-item"><a href="index.jsp">Home</a></span>
	</div>
</div>
</div>
<div class="row">
	<div class="content">
		<div class="col-lg-3">
			<div class="left-menu">
				<h4>Tables</h4>
				<span class="left-menu-item"><a href="browse.jsp?table=users">Users</a></span><br />
				<span class="left-menu-item"><a href="browse.jsp?table=restaurants">Restaurants</a></span><br />
				<span class="left-menu-item"><a href="browse.jsp?table=menu">Menu Items</a></span><br />
				<span class="left-menu-item"><a href="browse.jsp?table=deals">Deals</a></span>
			</div>
		</div>
		<div class="col-lg-9">
		<div class="content-main">
			<% if (request.getParameter("table") == null) {
				out.println("Please select a table from the list on the left.");
			}
			else if (request.getParameter("table").equals("users")) {
				out.println("<h2 class=\"table-header\">Users table</h2>");
				out.println("<table class=\"db-table\">");
				out.println("<tr><th>id</th><th>Type</th><th>E-Mail</th><th>Password</th><th>Frst Name</th><th>Last Name</th><th>Registration Date</th><th>Last Login</th><th>Card Number</th><th>Card Expiration Date</th><th>Card Zip</th></tr>");
				DBManager dbm = new DBManager();
				String[][] res = dbm.getUsers();
				if (res == null) {
					out.print("<tr>");
					out.print("<td>2</td><td class=\"table-element\">stevekx86@gmail.com</td><td class=\"table-element\">customer</td><td class=\"new-password\">$2a$14$RHwEcB41ufx11GYZu6WjC.hLCDetXm8jjsd8O282gbtV.tT6/QYM2</td><td class=\"table-element\">Steve</td><td class=\"table-element\">King</td><td class=\"table-element\">2017-04-03</td><td></td><td></td><td></td><td></td>");
					out.print("</tr>");
					out.print("<tr>");
					out.print("<td>3</td><td class=\"table-element\">xgh@asu.edu</td><td class=\"table-element\">customer</td><td class=\"new-password\">$14$.dE5b/UWlv2aOxD6febKQ.futfB2jeWF5xThfQZioNOF3Fvfr.M1a</td><td class=\"table-element\">food</td><td class=\"table-element\">fghd</td><td class=\"table-element\">2017-04-03</td><td></td><td></td><td></td><td></td>");
					out.print("</tr>");
					out.print("<tr>");
					out.print("<td>4</td><td class=\"table-element\">dfd@ddc.edu</td><td class=\"table-element\">customer</td><td class=\"new-password\">$2a$14$3Eqdjbo5VWHOIJVXyyhQS.Y9cTyLJlFqHSwLLCLaVm5ymw4sxZP6e</td><td class=\"table-element\">weeer</td><td class=\"table-element\">weeee</td><td class=\"table-element\">2017-04-03</td><td></td><td></td><td></td><td></td>");
					out.print("</tr>");
				}
				else {
					for (String[] record : res) {
						out.println("<tr>");
						int i = 0;
						for (String rec : record) {
							if (i == 0) {
								out.println("<td class=\"new-password\">" + rec + "</td>");
							}
							else if (i == 0) {
								out.println("<td>" + rec + "</td>");
							}
							else {
								out.println("<td class=\"table-element\">" + rec + "</td>");
							}
							i++;
						}
						out.println("</tr>");
					}
				}
				out.println("</table><br />");
				out.println("<button class=\"submit-all\">Submit</button>");			
			}
			else if (request.getParameter("table").equals("restaurants")) {
				out.println("<h2 class=\"table-header\">Restaurants table</h2>");
				out.println("<table class=\"db-table\">");
				out.println("<tr><th>id</th><th>Name</th><th>Description</th><th>Registration Date</th><th>Address</th><th>City</th><th>State</th><th>Zip Code</th></tr>");
				DBManager dbm = new DBManager();
				String[][] res = dbm.getRestaurants();
				if (res == null) {
					
				}
				else {
					for (String[] record : res) {
						out.println("<tr>");
						for (String rec : record) {
							out.println("<td>" + rec + "</td>");
						}
						out.println("</tr>");
					}
				}
				out.println("</table>");
			}
			else if (request.getParameter("table").equals("menu")) {
				out.println("<h2 class=\"table-header\">Menu Items table</h2>");
				out.println("<table class=\"db-table\">");
				out.println("<tr><th>id</th><th>Name</th><th>Registration Date</th><th>Address</th><th>City</th><th>State</th><th>Zip Code</th><th>Owner ID</th><th>items</th><th>Pickup Time</th><th>Price</th><th>pickup-max</th><th>pickup-remaining</th></tr>");
				DBManager dbm = new DBManager();
				String[][] res = dbm.getUsers();
				if (res == null) {
					
				}
				out.println("</table>");
			}
			else if (request.getParameter("table").equals("deals")) {
				out.println("<h2 class=\"table-header\">Deals table</h2>");
				out.println("<table class=\"db-table\">");
				out.println("<tr><th>id</th><th>Name</th><th>Description</th><th>Restaurant</th><th>Cost</th></tr>");
				DBManager dbm = new DBManager();
				String[][] res = dbm.getUsers();
				if (res == null) {
					
				}
				out.println("</table>");
			} %>
		</div>
		</div>
	</div>
</div>
</body>
</html>