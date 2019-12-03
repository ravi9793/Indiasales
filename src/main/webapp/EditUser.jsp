<%@page import="user.User"%>
<%@page import="user.Userhandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<c:import url="shared.jsp"></c:import>
<c:import url="Header.jsp"></c:import>

<%

		int id=Integer.parseInt(request.getParameter("id"));
		User ur=new Userhandler().fetchUser(id);
		request.setAttribute("userList", ur);

%>

</head>
<body style="background:ghostwhite">

<form method="POST" action="EditUserToDB">
<input type="hidden" name="id" value="${userList.getId() }">


			<div class="container">
				<div class="row">
					<h1>Add User</h1>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-4">
						<h4>User Name:</h4>
					</div>

					<div class="col-lg-8">
						<input class="form-control" type="text" name="UserName"
							placeholder=" Enter UserName" value="${userList.getName() }">
					</div>

				</div>
				<br> <br>
				<div class="row">
					<div class="col-lg-4">
						<h4>Contact Number:</h4>
					</div>

					<div class="col-lg-8">
						<input class="form-control" name="Phone"
							placeholder="Enter Phone Number"value="${userList.getPhone() }"></input>
					</div>
				</div>
				
				<br> <br>
				<div class="row">
					<div class="col-lg-4">
						<h4>Email-Id:</h4>
					</div>

					<div class="col-lg-8">
						<input class="form-control" name="email"
							placeholder="Enter Email-Id"value="${userList.getEmail() }"></input>
					</div>
				</div>
				<br> <br>
			
				<div class="row">
					<div class="col-lg-4">
						<h4>Password:</h4>
					</div>

					<div class="col-lg-8">
						<input class="form-control" name="password" type="password"
							placeholder="Enter Contact Number"value="${userList.getPassword() }"></input>
					</div>
				</div>
				
				
				<br>
				<br>
				<center>
					<div class="row">
						<div class="col-lg-12">
							<button class="btn btn-danger" name="submit" type="submit">
								<i class="fa fa-plus">Add</i>
							</button>
						</div>
				</center>
			</div>
		</form>

</body>
</html>