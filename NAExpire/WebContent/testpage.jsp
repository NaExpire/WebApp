<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="naexpire.DBManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="js/jquery-3.1.1.min.js"></script>
<script>
$(document).ready(function() {
        $('#userName').click(function(event) {
                var name = $('#userName').text();
                $.get('AJAXer', {
                        userName : name
                }, function(responseText) {
                        $('#ajaxGetUserServletResponse').text(responseText);
                });
        });
});
</script>
</head>
<body>
<% DBManager dbm = new DBManager(); %>
<% String[] results = dbm.getUserNames(); %>
<%
	if (results == null) {
		out.println("No results.");
	}
	else {
		for (int i = 0; i < results.length; i++) {
			out.println(results[i]);
			out.println("<br />");
		}
	} %>
<br />
<br />
<% String[][] res = dbm.getUsers(); %>
<%
if (res == null) {
	out.println("No results.");
}
else {
	for (int i = 0; i < res.length; i++) {
		for (int j = 0; j < res[0].length; j++) {
			out.println(res[i][j]);
			out.println("<br />");
		}
		out.println("<br />");
	}
}
%>
<br /><br />
<div id="userName">Chodo Baggins</div>
<br /><br />
<div id="ajaxGetUserServletResponse">&nbsp;</div>
</body>
</html>