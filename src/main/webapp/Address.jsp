<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:import url="shared.jsp"></c:import>
</head>
<body style="background:ghostwhite">

<Script>

//validate address

function validateaddress() {
	
    if(document.getElementById("txtaddress").value)
	     {
    	document.getElementById("msgaddress").innerHTML = ' ';
    	} 
    else

	     {
        document.getElementById("msgaddress").innerHTML = " please enter your address.**. ";
    	}
}

// validate pin code

function validatepincode() {
	
    if(document.getElementById("txtpin").value)
	     {
    	document.getElementById("msgpin").innerHTML = ' ';
    	} 
    else

	     {
        document.getElementById("msgpin").innerHTML = " please enter your pin_code.**. ";
    	}
}

</Script>

<c:import url="Header.jsp"></c:import>

<br>

<form method="POST" action="AddressToDB"  >


	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1>Please Enter your Address....</h1>
					
					<hr>
									</div>
				</div>
			
				<br>
					<br>
				
				
				<div class="row">
					<div class="col-lg-4">
						<h4>Address:</h4>
					</div>

					<div class="col-lg-8">
						<textArea class="form-control" name="address" id="txtaddress"
							placeholder="Enter Your Address." required="true" onkeyup="validateaddress()"></textArea>
							
							<label id="msgaddress" style="color:red; font-weight:bold;"></label>
					</div>
				</div>
				
				<br> <br>
				<div class="row">
					<div class="col-lg-4">
						<h4>Pin-Code:</h4>
					</div>

					<div class="col-lg-8">
						<input class="form-control" name="pincode"
							placeholder="Enter Your Pin-Code ." type="number" required id="txtpin"
							onkeyup=" validatepincode()"> </input>
							<label id="msgpin" style="color:red; font-weight:bold;"></label>
							
					</div>
				</div>
				
				
				<br>
				<br>
				<center>
					<div class="row">
						<div class="col-lg-12">
							<button class="btn btn-danger" name="submit" type="submit">
								Continue <i class="fa fa-arrow-right" aria-hidden="true"></i> 
							</button>
							 					
							 	</div>
						</div>
				</center>
			
			</div>
			
	</form>
			
		

</body>
</html>