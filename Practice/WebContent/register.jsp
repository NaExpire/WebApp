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
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
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
  			  <h1>Register</h1>
  			  <br/>
  			  	<form id="register">
  			  		<div class="form-group">
				    <input type="text" class="form-control" id="firstName" placeholder="First Name"/>
				    </div>
				    <div class="form-group">
				    <input type="text" class="form-control" id="lastName" placeholder="Last Name"/>
				    </div>
				    <div class="form-group" id="email-form">
				    <input type="text" class="form-control" id="email" placeholder="Email"/>
				    </div>
				    <div class="form-group" id="password-form">
				    <input type="password" class="form-control" id="password" placeholder="Password"/>
				    </div>
				    <div class="form-group" id="personalphonenumber-form">
				    <input type="text" class="form-control" id="personalPhoneNumber" placeholder="Personal Phone Number"/>
				    </div>
				    <div class="form-group">
				    <input type="text" class="form-control" id="restaurantName" placeholder="Restaurant Name"/>
				    </div>
				    <div class="form-group">
				    <input type="text" class="form-control" id="addressLine1" placeholder="Address Line 1"/>
				    </div>
				    <div class="form-group">
				    <input type="text" class="form-control" id="addressLine2" placeholder="Address Line 2"/>
				    </div>
				    <div class="form-group">
				    <input type="text" class="form-control" id="city" placeholder="City"/>
				    </div>
				    <div class="form-group">
				    <input type="text" class="form-control" id="state" placeholder="State"/>
				    </div>
				    <div class="form-group">
				    <input type="text" class="form-control" id="zip" placeholder="Zip Code"/>
				    </div>
				    <div class="form-group" id="businessphonenumber-form">
				    <input type="text" class="form-control" id="businessPhoneNumber" placeholder="businessPhoneNumber"/>
				    </div>
				    <div class="form-group">
				    <input type="text" class="form-control" id="description" placeholder="description"/>
				  	</div>
				  	<br/>
				  	<input type="submit" class="btn btn-primary" value="Submit">
			  	</form>
			</center>
  </div>
  <div class="col-6 col-md-4"></div>
</div>
<footer class="page-footer">

    <!--Footer Links-->
    <div class="container" background-color="black">
        <div class="row">
        	<center>
            <div class="container">
                    <li><a href="#!">About Us</a></li>
                    <li><a href="#!">FAQs</a></li>
                    <li><a href="#!">Contact Us</a></li>
            </div>
            </center>
        </div>
    </div>
    <!--/.Footer Links-->

    <!--Copyright-->
    <div class="footer-copyright">
        <div class="container-fluid">
        <center>
            © 2017 Copyright: <a href="https://www.MDBootstrap.com"> Cafe Redux </a>
		</center>
        </div>
    </div>
    <!--/.Copyright-->

</footer>
<script type="text/javascript">

$("#register").submit(function(event) {

  event.preventDefault();
  
  var emailReg = /^[A-Za-z]+[A-Za-z0-9.]*[A-Za-z0-9]@[A-Za-z]+\.[a-z]{3,}$/;
  if (!emailReg.exec(document.getElementById("email").value)){
	  document.getElementById("email-form").className = "form-group has-error";
	  //alert("email is invalid");
  }
  
  if (document.getElementById("password").value.length < 8){
	  document.getElementById("password-form").className = "form-group has-error";
	  //alert("Password is less than 8 characters");
  }
  
  var myRe = /^(\()?\d{3}(\))?(-|\s)?\d{3}(-|\s)\d{4}$/;
  if (!myRe.exec(document.getElementById("personalPhoneNumber").value)){
	  document.getElementById("personalphonenumber-form").className = "form-group has-error";
	  //alert("invalid personal phone number");
  }
  
  if (!myRe.exec(document.getElementById("businessPhoneNumber").value)){
	  document.getElementById("businessphonenumber-form").className = "form-group has-error";
	  //alert("invalid business phone number");
  }
  
  var formData = { 
			firstName: $('#firstName').val(),
			lastName: $('#lastName').val(),
			email: $('#email').val(),
			password: $('#password').val(),
			personalPhoneNumber: $('#personalPhoneNumber').val(),
			restaruantName: $('#restaruantName').val(),
			addressLine1: $('#addressLine1').val(),
			addressLine2: $('#addressLine2').val(),
			city: $('#city').val(),
			zip: $('#zip').val(),
			businessPhoneNumber: $('#businessPhoneNumber').val(),
			description: $('#description').val()
			};
 
  var posting = $.ajax({
		        type: "POST",
		        url: 'http://138.197.33.88/api/business/register/',
		        dataType: 'json',
		        data: JSON.stringify(formData),
		        success: function () {
					window.location = "./confirm.jsp";
		        }
		    });
  	
});
</script>
</body>
</html>