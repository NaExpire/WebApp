<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="naexpire.Utilities" %>
<%@ page import="naexpire.DBManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logging in...</title>
</head>
<body>
<%
	String name = request.getParameter("username");
	String password = request.getParameter("password");
	Utilities util = new Utilities();
	DBManager dbm = new DBManager();
	boolean success = util.attemptLogin(name, password);
	boolean admin = util.isAdmin(name);
	String fn = dbm.getFirstName(name);
	if (!success) {
		response.sendRedirect("login.jsp?error=un");
	}
	else if (!admin) {
		response.sendRedirect("login.jsp?error=admin");
	}
	else {
		Cookie firstname = new Cookie("firstname", fn);
		firstname.setMaxAge(60*60);
		response.addCookie(firstname);
		response.sendRedirect("browse.jsp");
	}
%>
</body>
</html>