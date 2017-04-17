<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="naexpire.DBManager" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stats</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/update-ajax.js"></script>
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
		<div class="col-lg-12">
			<h2>Purchases by Day - Last 30 Days</h2>
			<svg height="820" width="1000">
				<rect x="0" y="0" width="1000" height="820" style="fill:rgb(255,255,255);" />
				<line x1="50" y1="50" x2="50" y2="750" style="stroke:rgb(0,0,0);stroke-width:1px;" />
				<line x1="50" y1="750" x2="950" y2="750" style="stroke:rgb(0,0,0);stroke-width:1px;" />
				<% for (int i = 0; i <= 5; i++) { %>
					<line x1="45" y1="<%= 750 - (i * 140) %>" x2="55" y2="<%= 750 - (i * 140) %>" style="stroke:rgb(0,0,0);stroke-width:1px;" />
					<text x="30" y="<%= 755 - (i * 140) %>" fill="black"><%= i %></text>
				<% } %>
				<% Calendar cal = Calendar.getInstance(); %>
				<% Date today = new Date(); %>
				<% cal.add(Calendar.DATE, -30); %>
				<% Date lastMonth = cal.getTime(); %>
				<% int mod; %>
				<% String[] days = { "3/17/2017", "3/18/2017", "3/19/2017", "3/20/2017", "3/21/2017", "3/22/2017", "3/23/2017", "3/24/2017", "3/25/2017", "3/26/2017", "3/27/2017", "3/28/2017", "3/29/2017", "3/30/2017", "3/31/2017", "4/1/2017", "4/2/2017", "4/3/2017", "4/4/2017", "4/5/2017", "4/6/2017", "4/7/2017", "4/8/2017", "4/9/2017", "4/10/2017", "4/11/2017", "4/12/2017", "4/13/2017", "4/14/2017", "4/15/2017", "4/16/2017" }; %>
				<% for (int j = 0; j <= 30; j++) { %>
					<% mod = j % 3; %>
					<line x1="<%= 50 + (j * 30) %>" y1="<%= 755 + (mod * 12) %>" x2="<%= 50 + (j * 30) %>" y2="745" style="stroke:rgb(0,0,0);stroke-width:1;" />
					<text x="<%= 40 + (j * 30) %>" y="<%= 770 + (mod * 12) %>" style="fill:black;"><%= days[j] %></text>
				<% } %>
				<% DBManager dbm = new DBManager();
				String[][] res = dbm.getMonthPurchases(); %>
				<% int count = 0; %>
				<% int lastCount = 0; %>
				<% for (int k = 0; k < 5; k++) { %>
					<% count = Integer.valueOf(res[k][1]); %>
					<rect x="<%= 828 + (k * 30) %>" y="<%= 748 - (count * 140) %>" width="4" height="4" style="fill:rgb(0,0,255);"/>
					<line x1="<%= 830 + ((k - 1) * 30) %>" y1="<%= 750 - (lastCount * 140) %>" x2="<%= 830 + (k * 30) %>" y2="<%= 750 - (count * 140) %>" style="stroke:rgb(0,0,255);stroke-width:1;" />
					<% lastCount = count; %>
				<% } %>
			</svg>
		</div>
	</div>
</div>
</body>
</html>