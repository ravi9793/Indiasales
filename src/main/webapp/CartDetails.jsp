<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:import url="shared.jsp"></c:import>
</head>
<body style="background:ghostwhite">
<c:import url="Header.jsp"></c:import>

<br>
<form method="POST" action="AddCartDetails"  >
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1>Please Fill Cart Details</h1>
					
					<hr>
					<br>
					<br>
				</div>
				</div>
			
				<div class="row">
					<div class="col-lg-4">
						<h4>Cart Number:</h4>
					</div>

					<div class="col-lg-4">
						<input class="form-control" type="number" name="cartnumber"
							placeholder=" Enter Cart Number" maxlength="16" size="16" required
							>
					</div>

				</div>
				<br> <br>
				<div class="row">
					<div class="col-lg-4">
						<h4>Expiry Date.:</h4>
					</div>

					<div class="col-lg-4">
					
						<input class="form-control" name="expdate"
							placeholder="Expiry year" type="month" required></input>
					</div>
					
				</div>
				
				<br> <br>
				<div class="row">
					<div class="col-lg-4">
						<h4>Cart CVV:</h4>
					</div>

					<div class="col-lg-2">
						<input class="form-control" name="cvv"
							placeholder="Enter Your Cart CVV." required></input>
					</div>
				</div>
				
				<br>
				<br>
				<center>
					<div class="row">
						<div class="col-lg-12">
						
						<button class="btn btn-danger" name="submit" type="submit">
								<i class="fa fa-plus">Submit</i>
							</button>
						
							 </div>
						</div>
				</center>
			
			</div>
			
	</form>
			
		
</body>
</html>