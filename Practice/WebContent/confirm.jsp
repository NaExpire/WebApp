<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cafe Redux</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
</head>
<body style = "background-color:#9FBD46;">
<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="index.jsp">Cafe Redux</a>
	</div>
	<ul class="nav navbar-nav navbar-right">
		<li><a href="about.jsp">About Us</a><li>
		<li><a href="register.jsp">Register</a><li>
		<li><a href="getapp.jsp">Get App</a><li>
		<li><a href="contact.jsp">Contact Us</a><li>
		<li><a href="sustain.jsp">Sustainable Development</a><li>
		<li><a href="#">Admin</a><li>
	</ul>
</nav>
<div class="row">
  <div class="col-6 col-md-4"></div>
  <div class="col-6 col-md-4">
  			<center>
  			  <h1>Confirmation</h1>
  			  <br/>
  			  	<form id="confirm">
				    <input type="text" class="form-control" id="emailAddress" name="emailAddress" placeholder="Email Address"/>
				    <input type="number" class="form-control" id="confirmationCode" name="confirmationCode" placeholder="Confirmation Code"/>
				  	<br/>
				  	<input type="submit" class="btn btn-primary" value="Submit"/>
			  	</form>
			</center>
  </div>
  <div class="col-6 col-md-4"></div>
</div>

<script type='text/javascript'>
    /* attach a submit handler to the form */
    $("#confirm").submit(function(event) {

      /* stop form from submitting normally */
      event.preventDefault();

      /* Send the data using post with element id name and name2*/
      var formData = { emailAddress: $('#emailAddress').val(), confirmationCode: $('#confirmationCode').val() };
		
      var posting = $.ajax({
	        type: "POST",
	        url: 'http://138.197.33.88/api/business/register/confirm/',
	        dataType: 'json',
	        data: JSON.stringify(formData),
	        success: function () {
				alert("Success!");
	        }
	    });
      
    });
</script>

</body>
</html>