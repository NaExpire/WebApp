<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Results</title>
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
<div class="contents">
	<%
	if (request.getParameter("table").equals("users")) {
		if (request.getParameter("text") != null && request.getParameter("text").equals("Clinton") || request.getParameter("text").equals("Jarboe")) {
			out.print("<table>");
			out.print("<tr>");
			out.print("<td>1</td><td class=\"table-element\">clinton.jarboe@asu.edu</td><td class=\"table-element\">admin</td><td class=\"new-password\">nYa0X87y6gKvnFwX</td><td class=\"table-element\">Clinton</td><td class=\"table-element\">Jarboe</td><td class=\"table-element\">2017-03-19</td><td></td><td></td><td></td><td></td>");
			out.print("</tr>");
			out.print("</table>");
		}
		else if (request.getParameter("text") != null && request.getParameter("text").equals("Jake") || request.getParameter("text").equals("Washington")) {
			out.print("<table>");
			out.print("<tr>");
			out.print("<td>2</td><td class=\"table-element\">customer@people.com</td><td class=\"table-element\">customer</td><td class=\"new-password\">c92Rix7Fv9FFe7E6</td><td class=\"table-element\">Jake</td><td class=\"table-element\">Washington</td><td class=\"table-element\">2017-03-20</td><td></td><td></td><td></td><td></td>");
			out.print("</tr>");
			out.print("</table>");
		}
		else {
			out.print("No results found.  Click <a href=\"search.jsp\">here</a> to return to the search page.");
		}
	}
	else if (request.getParameter("table").equals("deals")) {
		if (request.getParameter("text").equals("chicken")) {
			out.print("<table>");
			out.print("<tr>");
			out.print("<th>id</th><th class=\"table-element\">Name</th><th class=\"table-element\">Description</th><th class=\"table-element\">Restaurant</th><th class=\"table-element\">Price</th>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td>1</td><td class=\"table-element\">Fried Chicken Combo</td><td class=\"table-element\">4 Pieces of Chicken and a biscuit</td><td class=\"table-element\">Lolo's Chicken and Waffles</td><td class=\"table-element\">$12.99</td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td>3</td><td class=\"table-element\">Classic Chicken & Waffles Combo</td><td class=\"table-element\">3 pieces of Chicken and a waffle</td><td class=\"table-element\">Lolo's Chicken and Waffles</td><td class=\"table-element\">$12.99</td>");
			out.print("</tr>");
			out.print("</table>");
		}
		else if (request.getParameter("restaurant") != null && request.getParameter("restaurant").equals("lolos")) {
			out.print("<table>");
			out.print("<tr>");
			out.print("<th>id</th><th class=\"table-element\">Name</th><th class=\"table-element\">Description</th><th class=\"table-element\">Restaurant</th><th class=\"table-element\">Price</th>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td>1</td><td class=\"table-element\">Fried Chicken Combo</td><td class=\"table-element\">4 Pieces of Chicken and a biscuit</td><td class=\"table-element\">Lolo's Chicken and Waffles</td><td class=\"table-element\">$12.99</td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td>3</td><td class=\"table-element\">Classic Chicken & Waffles Combo</td><td class=\"table-element\">3 pieces of Chicken and a waffle</td><td class=\"table-element\">Lolo's Chicken and Waffles</td><td class=\"table-element\">$12.99</td>");
			out.print("</tr>");
			out.print("</table>");
		}
		else if (request.getParameter("restaurant") != null && !request.getParameter("restaurant").equals("lolos")) {
			out.print("No results found.  Click <a href=\"search.jsp\">here</a> to return to the search page.");
		}
		else if (request.getParameter("gtlt") != null && request.getParameter("gtlt").equals("gt")) {
			out.print("<table>");
			out.print("<tr>");
			out.print("<th>id</th><th class=\"table-element\">Name</th><th class=\"table-element\">Description</th><th class=\"table-element\">Restaurant</th><th class=\"table-element\">Price</th>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td>1</td><td class=\"table-element\">Fried Chicken Combo</td><td class=\"table-element\">4 Pieces of Chicken and a biscuit</td><td class=\"table-element\">Lolo's Chicken and Waffles</td><td class=\"table-element\">$12.99</td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td>3</td><td class=\"table-element\">Classic Chicken & Waffles Combo</td><td class=\"table-element\">3 pieces of Chicken and a waffle</td><td class=\"table-element\">Lolo's Chicken and Waffles</td><td class=\"table-element\">$12.99</td>");
			out.print("</tr>");
			out.print("</table>");
		}
		else if (request.getParameter("gtlt") != null && request.getParameter("gtlt").equals("lt")) {
			out.print("<table>");
			out.print("<tr>");
			out.print("<td>2</td><td class=\"table-element\">Fish Combo</td><td class=\"table-element\">2 Pieces of Fried Fish and one side</td><td class=\"table-element\">Lolo's Chicken and Waffles</td><td class=\"table-element\">$11.99</td>");
			out.print("</tr>");
			out.print("</table>");
		}
		else {
			out.print("No results found.  Click <a href=\"search.jsp\">here</a> to return to the search page.");
		}
	}
	%>
</div>
</body>
</html>