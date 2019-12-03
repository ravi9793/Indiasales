<%@page import="product.Producthandler"%>
<%@page import="product.Product"%>
<%@page import="cart.Cart"%>
<%@page import="user.User"%>
<%@page import="cart.carthandler"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style type="text/css">
</style>

<c:import url="shared.jsp" />
<%
	carthandler ch = new carthandler();
	//request.setAttribute("CList", ch.fetchAllCarts());

	User u = (User) request.getSession().getAttribute("currentUser");

	if (u == null) {
		request.setAttribute("CList", ch.fetchAllCarts());
	} else {
		request.setAttribute("CList", ch.fetchAllCartItemsForUser(u.getId()));
	}

	float grandTotal = 0.0f;
	Producthandler ph = new Producthandler();
%>

</head>
<body style="background:ghostwhite">

	<c:import url="Header.jsp" />

	<br>

	<div style="padding-bottom: 5px">
		<h1 style="text-align: center;">My Cart  ${ sessionScope['currentUser'].getId() }</h1>
		<a href="viewProduct.jsp" style="color: blue; font-size:25px; font-weight:bold">More Items</a> <br>

		<hr>
	</div>
	<c:choose>
		<c:when test="${empty CList}">
			<h1 class="alert alert-danger">
				Cart is empty !!! Shop more To add<br> <br> Happy
				Shopping...............
			</h1>
		</c:when>

		<c:otherwise>


			<c:forEach items="${CList}" var="cart">
				<!--  -->
				<%
					Cart x = (Cart) (pageContext.getAttribute("cart"));
								Product p = ph.fetchProduct((short) (x.getProductId()));
								//pageContext.setAttribute("pro",p);
				%>

				<div style="padding-bottom: 5px;">
					<div class="card"
						style="max-width: 40%; margin-left: 420px; margin-top: 20px;">
						<div class="card-body">
							<img style="width: 100%; margin: auto; height: 250px;"
								src="<%=p.getImageUrl()%>"> <br> <br>
							<div style="text-align: center;">
								<h3><%=p.getName()%></h3>

								<h3 class="badge badge-success"><%=p.getCategory().getName()%></h3>
								<br>

								<h6 style="font-weight: bold;">
									Price:<i id="R" class="fas fa-dollar-sign"></i><%=p.getPrice()%></h6>

								<h8 style="font-weight: bold;"> Quantity = ${cart.getQty()}</h8>
								<br>

								<h8 style="font-weight: bold;"> Price = <%=p.getPrice()%> <br>
								</h8>
								<h3>
									Subtotal = <span Style="color:red; font-size:30px">Rs.</span>
									<%=p.getPrice() * x.getQty()%>

									<%
										grandTotal += p.getPrice() * x.getQty();
									%>/-
								</h3>
							</div>

							<div></div>

							<a href="DeleteCart?id=${cart.getId()}" class="btn btn-danger"
								style="width: 100%;">Delete</a>
						</div>

						<p>${pro.getDescription()}</p>


					</div>
				</div>



			</c:forEach>

			<div style="text-align: center;">

				<h1 style= "font-weight:bold;">
					Grand Total:
				<span Style="color:red; font-size:45px">Rs.</span>	<%=grandTotal%></h1>

				<a href="DeleteAddToCart?userId=${sessionScope.currentUser.getId()}"
					class="btn btn-warning" style="border: 2px solid red; font-size:25px; font-weight:bold;">Confirm
					Order</a> <br>
					
			</div>

		</c:otherwise>
	</c:choose>



</body>
</html>