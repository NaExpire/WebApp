<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="naexpire.DBManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Successful</title>
</head>
<body>
<%

	DBManager dbm = new DBManager();
	String[] input = new String[7];
	String[] userInput = new String[5];
	input[0] = request.getParameter("name");
	input[1] = request.getParameter("descr");
	input[2] = request.getParameter("address");
	input[3] = request.getParameter("city");
	input[4] = request.getParameter("state");
	input[5] = request.getParameter("zip");
	input[6] = request.getParameter("phone");
	userInput[0] = "restaurant";
	userInput[1] = request.getParameter("email");
	userInput[2] = request.getParameter("pwd");
	userInput[3] = request.getParameter("fn");
	userInput[4] = request.getParameter("ln");
	int id = dbm.registerUser(userInput);
	dbm.registerRestaurant(input, id);
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", "splash.jsp");

%>
</body>
</html>