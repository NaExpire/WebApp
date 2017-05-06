<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script src="js/jquery-3.1.1.min.js"></script>
</head>
<body>
<div class="login-form">
	<form class="login-form" action="login-check.jsp">
		<span class="login-label">Username: <input class="login-input" type="text" name="username" /></span><br />
		<span class="login-label">Password: <input class="login-input" type="password" name="password" /></span><br />
		<input class="input-submit" type="submit" value="Log In" /><br />
		<% 
			if (request.getParameter("error") == null) {
				
			}
			else if (request.getParameter("error").equals("un")) {
				out.println("<span class=\"error\">Username/Password not found.</span>");
			}
			else if (request.getParameter("error").equals("admin")) {
				out.println("<span class=\"error\">Username/Password not found.</span>");
			}
		%>
	</form>
</div>
</body>
</html>