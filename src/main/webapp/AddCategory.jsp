<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Insert title here</title>

<c:import url="shared.jsp"></c:import>

</head>
<body style="background:ghostwhite">
	<c:import url="Header.jsp"></c:import>

	<form method="POST" action="AddCategoryToDB">
		<div class="container">
			<div class="row">
				<h1>Category</h1>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<h4>Category Name:</h4>
				</div>

				<div class="col-lg-8">
					<input class="form-control" type="text" name="categoryName"
						placeholder="Name">
				</div>

			</div>
			<br> <br>
			<div class="row">
				<div class="col-lg-4">
					<h4>Category description:</h4>
				</div>

				<div class="col-lg-8">
					<textarea class="form-control" name="CategoryDescription"
						placeholder="Category Description"></textarea>
				</div>
			</div>
			<br> <br>
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