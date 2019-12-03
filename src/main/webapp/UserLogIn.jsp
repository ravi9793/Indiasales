<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<c:import url="shared.jsp"></c:import>


		
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
		        document.getElementById("lblmsg1").innerHTML = "**Please enter your password**";
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
	
	
	<c:import url="Header.jsp" />

	
	
	
	
	 

<form   method="POST" action="checklogin">
			<div class="container">
				<div class="row">
					<h1>LogIn Here.....</h1>
					
					
										
				</div>
				
				
				<br>
				
				<a href="Adduser.jsp" Style="font-size:20px; margin-left:900px; ">Create New Account</a>
				
				<hr>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-4">
						<h4>Email-Id:</h4>
					</div>

					<div class="col-lg-8">
					
					<input class="form-control" type="text" name="email" placeholder="Enter Email" onkeyup="validateEmail(this);" id="txtemail">
						<label id="lblmsg" style="color:red; font-weight:bold;"></label>

					</div>

				</div>
				<br> <br>
				<div class="row">
					<div class="col-lg-4">
						<h4>Password:</h4>
					</div>

					<div class="col-lg-8">
						<input class="form-control" type="password" name="password" onkeyup="validatepsd(this);" id="txtpsd"
							placeholder="Enter Password" 
							 pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
							title="Does not match password." required> 
							<label id="lblmsg1" style="color:red; font-weight:bold;"></label>
							<!-- An element to toggle between password visibility -->
							<br>
							<input type="checkbox" onclick="myFunction()">Show Password
					</div>
				</div>
				<br>
				
				<c:if test="${not empty invalid}">
					<h3 class="alert alert-danger">Invalid Credentials</h3>
				</c:if>
				
				<center>
					<div class="row">
						<div class="col-lg-12">
							<button class="btn btn-danger" name="submit">
								<i class="fa fa-plus">SignIn</i>
							</button>
							
							</div>
								
						</div>
						
												
				</center>
				
				
			</div>
		</form>

</body>
</html>