<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="naexpire.DBManager" %>
<%@ page import="naexpire.Utilities" %>
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
	
%>
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
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<h2>Purchases by Day - Last 30 Days</h2>
			<svg height="820" width="1100">
				<rect x="0" y="0" width="1100" height="820" style="fill:rgb(255,255,255);" />
				<line x1="50" y1="50" x2="50" y2="750" style="stroke:rgb(0,0,0);stroke-width:1px;" />
				<line x1="50" y1="750" x2="950" y2="750" style="stroke:rgb(0,0,0);stroke-width:1px;" />
				<% Utilities util = new Utilities(); %>
				<% Date date = new Date();
				String[] days = util.getDateList(date); %>
				<% DBManager dbm = new DBManager();
				String[][] res = dbm.getMonthPurchases(days[0], days[30]);
				int max = 0;
				for (int i = 0; i < res.length; i++) {
					if (Integer.parseInt(res[i][1]) > max) {
						max = Integer.parseInt(res[i][1]);
					}
				} %>
				<% for (int i = 0; i <= max; i++) { %>
					<line x1="45" y1="<%= 750 - (i * (700/max)) %>" x2="55" y2="<%= 750 - (i * (700/max)) %>" style="stroke:rgb(0,0,0);stroke-width:1px;" />
					<text x="30" y="<%= 755 - (i * (700/max)) %>" fill="black"><%= i %></text>
				<% } %>
				<% Calendar cal = Calendar.getInstance(); %>
				<% Date today = new Date(); %>
				<% cal.add(Calendar.DATE, -30); %>
				<% Date lastMonth = cal.getTime(); %>
				<% int mod; %>
				
				<% for (int j = 0; j <= 30; j++) { %>
					<% mod = j % 3; %>
					<line x1="<%= 50 + (j * 30) %>" y1="<%= 755 + (mod * 12) %>" x2="<%= 50 + (j * 30) %>" y2="745" style="stroke:rgb(0,0,0);stroke-width:1;" />
					<text x="<%= 40 + (j * 30) %>" y="<%= 770 + (mod * 12) %>" style="fill:black;"><%= days[j] %></text>
				<% } %>
				
				<% int count = 0; %>
				<% int lastCount = 0; %>
				<% for (int k = 0; k < res.length; k++) { %>
					<% count = Integer.valueOf(res[k][1]); %>
					<rect x="<%= 48 + (k * 30) %>" y="<%= 748 - (count * (700/max)) %>" width="4" height="4" style="fill:rgb(0,0,255);"/>
					<line x1="<%= 50 + ((k - 1) * 30) %>" y1="<%= 750 - (lastCount * (700/max)) %>" x2="<%= 50 + (k * 30) %>" y2="<%= 750 - (count * (700/max)) %>" style="stroke:rgb(0,0,255);stroke-width:1;" />
					<% lastCount = count; %>
				<% } %>
			</svg>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<h2>Signups by Day - Last 30 Days</h2>
			<svg height="820" width="1100">
				<rect x="0" y="0" width="1100" height="820" style="fill:rgb(255,255,255);" />
				<line x1="50" y1="50" x2="50" y2="750" style="stroke:rgb(0,0,0);stroke-width:1px;" />
				<line x1="50" y1="750" x2="950" y2="750" style="stroke:rgb(0,0,0);stroke-width:1px;" />
				<% util = new Utilities(); %>
				<% date = new Date();
				days = util.getDateList(date); %>
				<% dbm = new DBManager();
				res = dbm.getMonthSignups(days[0], days[30]);
				max = 0;
				for (int i = 0; i < res.length; i++) {
					if (Integer.parseInt(res[i][1]) > max) {
						max = Integer.parseInt(res[i][1]);
					}
				} %>
				<% for (int i = 0; i <= max; i++) { %>
					<line x1="45" y1="<%= 750 - (i * (700/max)) %>" x2="55" y2="<%= 750 - (i * (700/max)) %>" style="stroke:rgb(0,0,0);stroke-width:1px;" />
					<text x="30" y="<%= 755 - (i * (700/max)) %>" fill="black"><%= i %></text>
				<% } %>
				<% cal = Calendar.getInstance(); %>
				<% today = new Date(); %>
				<% cal.add(Calendar.DATE, -30); %>
				<% lastMonth = cal.getTime(); %>
				
				<% for (int j = 0; j <= 30; j++) { %>
					<% mod = j % 3; %>
					<line x1="<%= 50 + (j * 30) %>" y1="<%= 755 + (mod * 12) %>" x2="<%= 50 + (j * 30) %>" y2="745" style="stroke:rgb(0,0,0);stroke-width:1;" />
					<text x="<%= 40 + (j * 30) %>" y="<%= 770 + (mod * 12) %>" style="fill:black;"><%= days[j] %></text>
				<% } %>
				
				<% count = 0; %>
				<% lastCount = 0; %>
				<% for (int k = 0; k < res.length; k++) { %>
					<% count = Integer.valueOf(res[k][1]); %>
					<rect x="<%= 48 + (k * 30) %>" y="<%= 748 - (count * (700/max)) %>" width="4" height="4" style="fill:rgb(0,0,255);"/>
					<line x1="<%= 50 + ((k - 1) * 30) %>" y1="<%= 750 - (lastCount * (700/max)) %>" x2="<%= 50 + (k * 30) %>" y2="<%= 750 - (count * (700/max)) %>" style="stroke:rgb(0,0,255);stroke-width:1;" />
					<% lastCount = count; %>
				<% } %>
			</svg>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<h2>Restaurant Reviews</h2>
			<svg height="900" width="1000">
				<rect x="0" y="0" width="1000" height="900" style="fill:rgb(255,255,255);" />
				<line x1="50" y1="50" x2="50" y2="750" style="stroke:rgb(0,0,0);stroke-width:1px;" />
				<line x1="50" y1="750" x2="950" y2="750" style="stroke:rgb(0,0,0);stroke-width:1px;" />
				<% for (int i = 0; i <= 5; i++) { %>
					<line x1="45" y1="<%= 750 - (i * 140) %>" x2="55" y2="<%= 750 - (i * 140) %>" style="stroke:rgb(0,0,0);stroke-width:1px;" />
					<text x="30" y="<%= 755 - (i * 140) %>" fill="black"><%= i %></text>
				<% } %>
				<%
					String[][] reviewCounts = dbm.getReviewedRestaurantCounts();
					max = 0;
					int numRestaurants = reviewCounts.length;
					int increment = 900 / (numRestaurants + 2);
					for (int i = 0; i < numRestaurants; i++) {
						if (Integer.parseInt(reviewCounts[i][1]) > max) { max = Integer.parseInt(reviewCounts[i][1]); }
					}
					String[][] scores = dbm.getReviewScores();
					int totalRestaurants = reviewCounts.length;
					int height = 0;
					for (int i = 0; i < scores.length; i++) {
						height = (int)(Float.parseFloat(scores[i][1])/5) * 700; %>
						<rect x="<%= (increment + 1) * i - 10 %>" y="<%= 750 - height %>" width="20" height="<%= height %>" style="stroke:rgb(0,0,0);stroke-width:1px;fill:rgb(<%= (max-Integer.parseInt(reviewCounts[i][1])) * (255/max) %>,<%= Integer.parseInt(reviewCounts[i][1]) * (255/max) %>,0);">
						<text x="<%= (increment + 1) * i - 20 %>" y="758"><%= scores[i][0] %></text>');
					<% }
				%>
			</svg>
		</div>
	</div>
</div>
</body>
</html>