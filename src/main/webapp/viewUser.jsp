
<%@page import="user.Userhandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	Userhandler uh = new Userhandler();

	request.setAttribute("UserList", uh.fetchAllUsers());
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:import url="shared.jsp"></c:import>


 <style type="text/css">
 .card
 {
 	width:30% !important;
 	margin:20px !important;
 	display:inline-flex;
 	
 	box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
 }
 .card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
  border-color:red;
}
 </style>
</head>
<body style="background:ghostwhite">
<c:import url="Header.jsp"></c:import>

<br>
<br>

<h1>Current User</h1>

<br>

<a href="Adduser.jsp" class="btn btn-link">Add User</a>

<c:choose>
	
	<c:when test="${empty UserList}">
	
		<h1 class="alert alert-danger">No User In DB</h1>
	
	</c:when>
	
		<c:otherwise>
			<hr>
			
				<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>Name</th>
						<th>Contact Number</th>
						<th>Email-Id</th>
						<th>Password</th>
						<th>Active</th>
						<th>Role</th>
						<th>Operations</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${UserList }" var="user">

						<tr>
							<td>${user.getId() }</td>
							<td>${user.getName() }</td>
							<td>${user.getPhone() }</td>
							<td>${user.getEmail() }</td>
							<td>${user.getPassword() }</td>
							<td><a 
							<c:if test="${user.getActive() == 1}">
							href="SetActive?value=0&id=${user.getId()}"
							</c:if>
							
							<c:if test="${user.getActive() == 0}">
							href="SetActive?value=1&id=${user.getId()}"
							</c:if>
							
							>${user.getActive() }</a></td>
							<td>${user.getRole() }</td>


							<td>
								<a href="DeleteUserToDB?id=${user.getId()}"
								class="btn btn-danger">Delete</a></td>
						</tr>

					</c:forEach>
					
					</tbody>
			</table>
		
		</c:otherwise>
	
</c:choose>
</body>
</html>