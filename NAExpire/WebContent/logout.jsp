<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logout</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script src="js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<% 
		   Cookie cookie = null;
		   Cookie[] cookies = null;
		   // Get an array of Cookies associated with this domain
		   cookies = request.getCookies();
		   if( cookies != null ){
		      out.println("<h2> Found Cookies Name and Value</h2>");
		      for (int i = 0; i < cookies.length; i++){
		         cookie = cookies[i];
		         if((cookie.getName( )).compareTo("firstname") == 0 ){
		            cookie.setMaxAge(0);
		            response.addCookie(cookie);
		            out.print("Deleted cookie: " + 
		            cookie.getName( ) + "<br/>");
		         }
		         out.print("Name : " + cookie.getName( ) + ",  ");
		         out.print("Value: " + cookie.getValue( )+" <br/>");
		      }
		  }else{
		      out.println(
		      "<h2>No cookies founds</h2>");
		  }
		  response.sendRedirect("login.jsp"); 
	%>
</body>
</html>