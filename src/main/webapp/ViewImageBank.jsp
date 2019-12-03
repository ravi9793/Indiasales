

<%@page import="imagebank.ImageBankhandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:import url="shared.jsp"></c:import>

<%
	ImageBankhandler ibh=new ImageBankhandler();
	request.setAttribute("imageList", ibh.fetchAllImagesInBank());

%>

<style type="text/css">
.card {
	width: 15% !important;
	margin: 20px !important;
	display: inline-flex;
}

img {
	width: 100% !important;
	    height: 239px !important;
	margin: 0;	
}

.card-body{
	padding: 0;
}
</style>


</head>
<body style="background:ghostwhite">




	<br>
	<br>

	<h1>Current Images</h1>
	
	
	<c:if test="${not empty msg}">
		<h1 class="alert alert-danger">${msg}</h1>
	</c:if>	

	<br>
	<a href="AddImageToBank.jsp" class="btn btn-link">Add Image To Bank</a>


	<c:choose>

		<c:when test="${empty imageList}">

			<h1 class="alert alert-danger">No Images in Bank</h1>

		</c:when>
		


		<c:otherwise>


			<hr>
			
			<c:forEach items="${imageList}" var="image">

				<div class="card">
					<!-- <div class="card-header">Header</div> -->
					<div class="card-body">

						<img src="${image.getUrl()}">

					</div>
					<div class="card-footer">

						<a href="DeleteImageBank?id=${image.getId()}"
							class="btn btn-danger">Delete</a>

					</div>
				</div>

			</c:forEach>


		</c:otherwise>
	
	</c:choose>


</body>
</html>