<%@page import="product.Producthandler"%>
<%@page import="user.Userhandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<c:import url="shared.jsp" />



<%
	Producthandler ph = new Producthandler();

	request.setAttribute("productList", ph.fetchAllProducts());
%>

<style type="text/css">


.card {
	width: 22% !important;
	margin: 20px !important;
	display: inline-flex;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
}

.card-body {
	padding: 0;
	margin: 0;
}

.card:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
	border-color: red;
}
</style>
</head>
<body style="background:ghostwhite" >


	<c:import url="Header.jsp" />
	<br>
	<br>

	<h1>Current Products.</h1>
	<br>
	<c:if test="${sessionScope.currentUser.getRole() == 'Admin'}">
		<a href="AddProduct.jsp" class="btn btn-link" Style="font-size:20px; font-weight:bold;">Add Product</a>
	</c:if>
	<c:choose>

		<c:when test="${empty productList }">
			<h1 class="alert alert-danger">No Product in DB</h1>
		</c:when>

		<c:otherwise>

			<hr>
			<div class="row">
				<c:forEach items="${productList }" var="product">



					<div class="card">
						<%--    <div class="card-header">Header</div> --%>


						<div class="card-body">

							<img style="width: 100%; margin: auto;"
								src="${product.getImageUrl()}">

							<h1>${product.getName()}</h1>
							<br>

							<h3 class="badge badge-success"
								Style="margin-left: 20px; font-size: 15px;">${product.getCategory().getName()}</h3>
							<br>

						<h5 Style="margin-left: 20px;  " ><b>Price:
							<span Style="color:red; font-size:25px">	Rs.</span>${product.getPrice()}/-</b></h5>
							<br>

							<p>
								<b><i Style="margin-left: 20px;">${product.getDescription()}</i></b>
							</p>

							<h6 Style="margin-left: 20px;">
								In Stock: <span class="badge badge-warning"
									style="padding: 10px;">${product.getStockqty()}</span>
							</h6>

						</div>



						<div class="card-footer">
						

							<c:if test="${sessionScope.currentUser.getRole() == 'Admin'}">
								
								<a class="btn btn-danger"
									href="DeleteProductfromDB?id=${product.getId()}">Delete</a>
							</c:if>

							<c:if test="${sessionScope.currentUser.getRole()=='user'}">

								<form action="AddCartToDB" method="POST">
									<div class="container">

										<div class="row">

											<div class="col-lg-8">
												<Button class="btn btn-info" href="ViewCart.jsp">
												<i class="fas fa-cart-plus">Add To Cart</i>
												</Button>
											</div>
											

											<div class="col-lg-4">

												
												 <input type="number" name="qty"
													style="width: 100%; float: right;" placeholder="Qty"
													class="form-control" required="true">
													
												</div>
										</div>
										
										<input type="hidden"
										value="${sessionScope.currentUser.getId()}" name="userId">
									<input type="hidden" value="${product.getId()}" name="productId">
									</div>
								</form>

							</c:if>
							
						</div>
						
					</div>



				</c:forEach>
			</div>
		</c:otherwise>

	</c:choose>




</body>
</html>