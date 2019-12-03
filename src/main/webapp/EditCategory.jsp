<%@page import="category.Categoryhandler"%>
<%@page import="category.Category"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<c:import url="shared.jsp"></c:import>
<c:import url="Header.jsp"></c:import>

<%  
short id=Short.parseShort(request.getParameter("id"));

Category c=new Categoryhandler().fetchCategory(id);
request.setAttribute("currCat", c);

%>
</head>
<body style="background:ghostwhite">


<form method="POST" action="editCategoryfromDB">
<input type="hidden" name="id" value="${currCat.getId() }">

			<div class="container">
				<div class="row">
					<h1>Edit Category Name</h1>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-4">
						<h4>Enter Category Name:</h4>
					</div>

					<div class="col-lg-8">
						<input class="form-control" type="text" name="categoryName" placeholder="Enter Category" value="${currCat.getName()}">
					</div>

				</div>
				<br> <br>
				<div class="row">
					<div class="col-lg-4">
						<h4> Enter Category description:</h4>
					</div>

					<div class="col-lg-8">
						<textarea class="form-control" name="categoryDescription"
							placeholder=" Enter Category Description" >${currCat.getDescription()}</textarea>
					</div>
				</div>
				<br> <br>
				<center>
					<div class="row">
						<div class="col-lg-12">
							<button class="btn btn-danger">
								<i class="fa fa-plus">Edit</i>
							</button>
						</div>
				</center>
			</div>
		</form>

</body>
</html>