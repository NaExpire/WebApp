<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="naexpire.DBManager" %>
<%@ page import="naexpire.Utilities" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Splash Page Content</title>
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
			<form method="post" action="submitsplash.jsp">
				<div class="form-group">
			      <label for="about">About:</label>
			      <textarea rows="4" class="form-control" id="about" name="about" ></textarea>
			    </div>
				<div class="form-group">
			      <label for="sustainable">Sustainable Development:</label>
			      <textarea rows="4" class="form-control" id="sustainable" name="sustainable" ></textarea>
			    </div>
				<div class="form-group">
			      <label for="contact">Phone Number:</label>
			      <input type="text" class="form-control" id="phone" name="phone" >
			    </div>
				<div class="form-group">
			      <label for="contact">Email Address:</label>
			      <input type="text" class="form-control" id="email" name="email" >
			    </div>
			    <button type="submit" class="btn btn-default">Submit</button>
			</form>
		</div>
	</div>
</div>
</body>
</html>