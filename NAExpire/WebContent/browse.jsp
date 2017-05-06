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
var update = function($td) { // ajax call to update value of column in DB for row entry
	var newval = $td.children(".in").eq(0).val();
	var tdid = $td.attr("id");
	var res = tdid.split("-");
	if (res.length > 3) {
		res[2] = res[2].concat(res[3]);
	}
	$.get('AJAXer', {
            value : newval,
    		  column : res[2],
    		  table: res[0],
    		  id: res[1]
    }, function(responseText) {
            
    });
	var j = $td.children('.in').val();
    $td.html(j);
};
$(document).on('click', '.done', function() {
	update($(this).parent());
});
$(document).ready(function() {

	var update = function($td) { // ajax call to update value of column in DB for row entry
		var newval = $td.children(".in").eq(0).val();
    	var tdid = $td.attr("id");
    	var res = tdid.split("-");
    	if (res.length > 3) {
    		res[2] = res[2].concat(res[3]);
    	}
    	$.get('AJAXer', {
                value : newval,
        		  column : res[2],
        		  table: res[0],
        		  id: res[1]
        }, function(responseText) {
                
        });
    	var j = $td.children('.in').val();
        $td.html(j);
	};
	
	var hits = 0;
	$(".table-element").click(function() {
		if (hits % 2 == 0) {
			var i = $(this).text();
	    	$(this).html('<input type="text" class="in" value="' + i + '" /> <span class="done">Done</span>');
	        hits = hits + 1;
	    }
	});
	$(".submit-all").click(function() {
		$(".in").each(function() {
			update($(this).parent());
		});
	});
	
	$(".new-password").click(function() {
		alert("clicked new pw");
		var tdid = $(this).attr("id");
    	var res = tdid.split("-");
		var r = confirm("Set new password?");
	    if (r) {
	    	$.get('JAJAXer', {
	        		  id: res[1]
	        }, function(responseText) {
	        	alert("New password generated: " + responseText);
	        });
	    }
	    else {
	    	alert("Password will remain the same.");
	    }
	    

	});
	
});
</script>
</head>
<%

	Cookie cookie = null;
	Cookie[] cookies = null;
	cookies = request.getCookies();
	boolean loggedin;
	String first = "";
	if( cookies != null ){
	    for (int i = 0; i < cookies.length; i++){
	       cookie = cookies[i];
	       if(cookie.getName().equals("firstname")) {
	      	 
	      	 first=cookie.getValue();
	      	 Cookie firstname = new Cookie("firstname", first);
	   		 firstname.setMaxAge(60*60);
	   		 response.addCookie(firstname);
	      	 
	       }
	    }
	    if (first.equals("")) {
	    	response.sendRedirect("login.jsp");
	    }
	}
	else {
		
		response.sendRedirect("login.jsp");
		
	}

	String[] userColumns = { "id", "type", "email", "password", "firstname", "lastname", "registration-date", "last-login", "card-number", "card-expiration", "card-zip", "confirmed", "confirmation-code", "cart-id" };
	String[] restaurantColumns = { "id", "name", "description", "registration-date", "address", "city", "state", "zip", "ownerid", "items", "pickup-time", "price", "pickup-max", "pickup-remaining", "phone-number" };
	String[] menuColumns = { "id", "name", "description", "restaurantid", "price", "type" };
	String[] dealColumns = { "id", "meal-id", "deal-price", "quantity", "restaurant-id" };
	
	String[] tableNames = { "users", "restaurants", "deals", "menuitems" };
	
	int i = 0;
	
%>
<body>
<nav class="navbar navbar-inverse">
	<div class="navbar-header">Welcome, <%= first %>!</div>
	<ul class="nav navbar-nav navbar-right">
		<li><a href="splash.jsp">Home</a></li>
		<li><a href="browse.jsp">Browse</a></li>
		<li><a href="updatesplash.jsp">Splash</a></li>
		<li><a href="stats.jsp">Stats</a></li>
		<li><a href="logout.jsp">Log Out</a></li>
		<li>&nbsp;</li>
		<li>;  ;</li>
	</ul>
</nav>
<nav class="navbar navbar-inverse navbar-secondary-blue">
<div class="navbar-header">Tables</div>
<ul class="nav navbar-nav navbar-right">
	<li><a href="browse.jsp?table=users">Users</a></li>
	<li><a href="browse.jsp?table=restaurants">Restaurants</a></li>
	<li><a href="browse.jsp?table=menu">Menu Items</a></li>
	<li><a href="browse.jsp?table=deals">Deals</a></li>
</ul>
</nav>
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<% String pkey;
			if (request.getParameter("table") == null) {
				out.println("Please select a table from the list above.");
			}
			else if (request.getParameter("table").equals("users")) {
				out.println("<h2 class=\"table-header\">Users table</h2>");
				out.println("<table class=\"db-table\">");
				out.println("<tr><th>id</th><th>Type</th><th>E-Mail</th><th>Password</th><th>Frst Name</th><th>Last Name</th><th>Registration Date</th><th>Last Login</th><th>Card Number</th><th>Card Expiration Date</th><th>Card Zip</th><th>Confirmed</th><th>Confirmation Code</th><th>Cart ID</th></tr>");
				DBManager dbm = new DBManager();
				String[][] res = dbm.getUsers();
				if (res == null) {
					out.println("No records found.");
				}
				else {
					for (String[] record : res) {
						pkey = record[0];
						out.println("<tr>");
						i = 0;
						for (String rec : record) {
							if (i == 1 || i == 2 || i == 4 || i == 5) {
								out.println("<td class=\"table-element\" id=\"users-" + pkey + "-" + userColumns[i] + "\">" + rec + "</td>");
							}
							else if (i==3) {
								out.println("<td class=\"new-password\" id=\"users-" + pkey + "-" + userColumns[i] + "\">" + rec + "</td>");
							}
							else {
								out.println("<td class=\"users-" + userColumns[i] + "\">" + rec + "</td>");
							}
							i++;
						}
						out.println("</tr>");
					}
				}
				out.println("</table><br />");
				out.println("<button class=\"submit-all\">Submit</button>");			
			}
			else if (request.getParameter("table").equals("menu")) {
				out.println("<h2 class=\"table-header\">Menu table</h2>");
				out.println("<table class=\"db-table\">");
				out.println("<tr><th>id</th><th>Name</th><th>Description</th><th>Restaurant ID</th><th>Price</th><th>Type</th></tr>");
				DBManager dbm = new DBManager();
				String[][] res = dbm.getMenu();
				if (res == null) {
					
				}
				else {
					for (String[] record : res) {
						pkey = record[0];
						out.println("<tr>");
						i = 0;
						for (String rec : record) {
							if (i == 1 || i == 2 || i == 4) {
								out.println("<td class=\"table-element\" id=\"menuitems-" + pkey + "-" + menuColumns[i] + "\">" + rec + "</td>");
							}
							else {
								out.println("<td id=\"menuitems-" + menuColumns[i] + "\">" + rec + "</td>");
							}
							i++;
						}
						out.println("</tr>");
					}
				}
				out.println("</table>");
			}
			else if (request.getParameter("table").equals("restaurants")) {
				out.println("<h2 class=\"table-header\">Restaurants table</h2>");
				out.println("<table class=\"db-table\">");
				out.println("<tr><th>id</th><th>Name</th><th>Description</th><th>Registration Date</th><th>Address</th><th>City</th><th>State</th><th>Zip</th><th>Owner ID</th><th>Items</th><th>Pick-up Time</th><th>Price</th><th>Max Stock</th><th>Remaining Stock</th><th>Phone Number</th></tr>");
				DBManager dbm = new DBManager();
				String[][] res = dbm.getRestaurants();
				if (res == null) {
					out.println("No records found.");
				}
				else {
					for (String[] record : res) {
						pkey = record[0];
						out.println("<tr>");
						i = 0;
						for (String rec : record) {
							if (i == 1 || i == 2 || i == 4 || i == 5 || i == 6 || i == 7 || i == 10 || i == 14) {
								out.println("<td class=\"table-element\" id=\"restaurants-" + pkey + "-" + restaurantColumns[i] + "\">" + rec + "</td>");
							}
							else {
								out.println("<td id=\"restaurants-" + restaurantColumns[i] + "\">" + rec + "</td>");
							}
							i++;
						}
						out.println("</tr>");
					}
				}
				out.println("</table><br />");
			}
			else if (request.getParameter("table").equals("deals")) {
				out.println("<h2 class=\"table-header\">Deals table</h2>");
				out.println("<table class=\"db-table\">");
				out.println("<tr><th>id</th><th>Name</th><th>Description</th><th>Restaurant</th><th>Cost</th></tr>");
				DBManager dbm = new DBManager();
				String[][] res = dbm.getDeals();
				if (res == null) {
					out.println("No records found.");
				}
				else {
					for (String[] record : res) {
						pkey = record[0];
						out.println("<tr>");
						i = 0;
						for (String rec : record) {
							if (i == 2 || i == 3) {
								out.println("<td class=\"table-element\" id=\"deals-" + pkey + "-" + dealColumns[i] + "\">" + rec + "</td>");
							}
							else {
								out.println("<td id=\"deals-" + dealColumns[i] + "\">" + rec + "</td>");
							}
							i++;
						}
						out.println("</tr>");
					}
				}
				out.println("</table>");
			} %>
		</div>
	</div>
</div>
</body>
</html>