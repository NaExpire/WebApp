<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="naexpire.DBManager" %>
<%@ page import="naexpire.Utilities" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Successful</title>
</head>
<body>
<%

	Utilities util = new Utilities();
	DBManager dbm = new DBManager();
	String[] input = new String[5];
	input[0] = "customer";
	input[1] = request.getParameter("email");
	input[2] = util.encryptPass(request.getParameter("pwd"));
	input[3] = request.getParameter("fn");
	input[4] = request.getParameter("ln");
	int res = dbm.registerUser(input);
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", "splash.jsp");

%>
<%= res %>
</body>
</html>