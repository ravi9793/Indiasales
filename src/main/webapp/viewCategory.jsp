<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="category.Categoryhandler"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<c:import url="shared.jsp" />
<c:import url="Header.jsp"/>

<%
	Categoryhandler ch = new Categoryhandler();

	request.setAttribute("catList", ch.fetchAllCategories());
%>

</head>
<body style="background:ghostwhite">
	<br>
	<br>
	<h1>Current Categories</h1>

	<br>
	<a href="AddCategory.jsp" class="btn btn-link">Add Category</a>

	<c:choose>
		<c:when test="${empty catList }">
			<h1 class="alert alert-danger">No Categories in DB</h1>
		</c:when>
		<c:otherwise>
			<hr>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>Name</th>
						<th>Description</th>
						<th>Operations</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${catList }" var="cat">

						<tr>
							<td>${cat.getId() }</td>
							<td>${cat.getName() }</td>
							<td>${cat.getDescription() }</td>


							<td><a href="EditCategory.jsp?id=${cat.getId()}"
								class="btn btn-primary">Edit</a> 
								<a href="deleteCategoryfromDB?id=${cat.getId()}"
								class="btn btn-danger">Delete</a></td>
						</tr>

					</c:forEach>
					
					</tbody>
			</table>
			
		</c:otherwise>
	</c:choose>

</body>
</html>