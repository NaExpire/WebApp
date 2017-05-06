<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="naexpire.DBManager" %>
<%@ page import="naexpire.Utilities" %>
<%

	String about = request.getParameter("about");
	String sustain = request.getParameter("sustainable");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	
	DBManager dbm = new DBManager();
	
	if (about != "") {
		dbm.changeSplash("about", about);
	}
	
	if (sustain != "") {
		dbm.changeSplash("sustainable", sustain);
	}
	
	if (phone != "") {
		dbm.changeContact("phone", phone);
	}
	
	if (email != "") {
		dbm.changeContact("email", email);
	}
	
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", "splashupdated.jsp");

%>