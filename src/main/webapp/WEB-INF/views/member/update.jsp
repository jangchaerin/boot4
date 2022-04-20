<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<form action="./update" method="post">

		<div class="container mt-4">
			<div class="row mt-4 ">
				<div class="alert alert-primary" role="alert">
					<h4 class="text-center" style="text-transform: capitalize;">Member Update Page</h4>
				</div>
			</div>
			<input type="hidden" name="id" value="${vo.id}">
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Name</label> <input
					type="text" class="form-control" id="name"
					aria-describedby="emailHelp" name="name" value="${vo.name }">
			</div>
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">E-Mail</label> <input
					type="text" class="form-control" id="email"
					aria-describedby="emailHelp" name="email" value="${vo.email}">
			</div>
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Phone</label> <input
					type="text" class="form-control" id="phone"
					aria-describedby="emailHelp" name="phone" value="${vo.phone}">
			</div>
		<!-- 	<div class="mb-3">
				<input class="form-control form-control-lg" type="file" name="file">
			</div>
 -->

			<div class="row justify-content-end">
				<button type="submit" class="col-1 btn btn-primary ">Update!!</button>
			</div>
		</div>

	</form>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>