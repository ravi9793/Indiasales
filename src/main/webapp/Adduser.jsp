<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:import url="shared.jsp"></c:import>
<c:import url="Header.jsp"></c:import>
</head>
<body style="background:ghostwhite">

<script type="text/javascript">
		function validateEmail(emailField)
		{
		    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
		    if(document.getElementById("txtemail").value=="")
			{
			document.getElementById("lblmsg").innerHTML = 'please enter email id.*.';
		
			}
		    else if (reg.test(emailField.value) == false) 
		    {
		    	document.getElementById("lblmsg").innerHTML = 'Invalid Email Address';
		     
		    }
			else{
			document.getElementById("lblmsg").innerHTML ='';
			}
		
		}

	// password validate.

		function validatepsd() {

			
			
		    if(document.getElementById("txtpsd").value)
			     {
		        document.getElementById("lblmsg1").innerHTML = " ";
		    	} 
		    else

			     {
		        document.getElementById("lblmsg1").innerHTML = "**please enter password**";
		    	}
		}

		// name Validate.
		
		function validatename() {
			
		    if(document.getElementById("txtname").value)
			     {
		    	document.getElementById("msgname").innerHTML = ' ';
		    	} 
		    else

			     {
		        document.getElementById("msgname").innerHTML = " please enter name.*. ";
		    	}
		}

		// contact number validate
		
		function validatephone() {
			
		    if(document.getElementById("txtphone").value)
			     {
		    	document.getElementById("lblmsg2").innerHTML = '';
		    	} 
		    else

			     {
		        document.getElementById("lblmsg2").innerHTML = " please enter contact number.*. ";
		    	}
		}

// show password
		
		function myFunction() {
			  var x = document.getElementById("txtpsd");
			  if (x.type === "password") {
			    x.type = "text";
			  } else {
			    x.type = "password";
			  }
}
		
		
		</script>


<form method="POST" action="AddUserToDB">
			<div class="container">
				<div class="row">
					<h1>Create New Account..</h1>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-4">
						<h4>User Name:</h4>
					</div>

					<div class="col-lg-8">
						<input class="form-control" type="text" name="UserName"
							placeholder=" Enter UserName"   onkeyup="validatename(this);" id="txtname" required
							title="Please Enter your valid name.">
							
							<label id="msgname" style="color:red; font-weight:bold;"></label>
					</div>

				</div>
				<br> <br>
				<div class="row">
					<div class="col-lg-4">
						<h4>Contact Number:</h4>
					</div>

					<div class="col-lg-8">
						<input class="form-control" name="Phone"
							placeholder="Enter Phone Number" required
							id="txtphone" onkeyup="validatephone(this);"
							pattern="[6789][0-9]{9}" title="Please enter valid 10 digits number"></input>
							<label id="lblmsg2" style="color:red; font-weight:bold;"></label>
					</div>
				</div>
				
				<br> <br>
				<div class="row">
					<div class="col-lg-4">
						<h4>Email-Id:</h4>
					</div>

					<div class="col-lg-8">
						<input class="form-control" name="email" onkeyup="validateEmail(this);" id="txtemail"
							placeholder="Enter Email-Id" required
							title="please enter valid name"></input>
							<label id="lblmsg" style="color:red; font-weight:bold;"></label>
					</div>
				</div>
				<br> <br>
			
				<div class="row">
					<div class="col-lg-4">
						<h4>Password:</h4>
					</div>

					<div class="col-lg-8">
						<input class="form-control" name="password" type="password" id="txtpsd" onkeyup=" validatepsd(this);"
							placeholder="Enter password"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
							title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required></input>
							<label id="lblmsg1" style="color:red; font-weight:bold;"></label>
							
							<!-- An element to toggle between password visibility -->
							<br>
							<input type="checkbox" onclick="myFunction()">Show Password
							
					</div>
				</div>
				
				
				
				
				<center>
					<div class="row">
						<div class="col-lg-12">
							<button class="btn btn-danger" name="submit" type="submit">
								<i class="fa fa-plus">SignUp</i>
							</button>
						</div>
				</center>
			</div>
		</form>
</body>
</html>