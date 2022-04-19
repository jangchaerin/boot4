<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<div class="container mt-4">
		<div class="row mt-4 ">
			<div class="alert alert-primary" role="alert">
				<h4 class="text-center" style="text-transform: capitalize;">${board}
					List</h4>
			</div>
		</div>


		<form class="d-flex col-4">

			<select name="kind">
				<option value="col1">제목</option>
				<option value="col2">작성자</option>
				<option value="col3">내용</option>
			</select> <input class="form-control me-2" type="search" placeholder="Search"
				aria-label="Search" name="search">
			<button class="btn btn-outline-dark" type="submit">Search</button>

		</form>


		<div class="row mt-4">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Num</th>
						<th>Title</th>
						<th>Writer</th>
						<th>Contents</th>
						<th>Hit</th>
						<th>Date</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${list}" var="list">
						<tr>
							<td>${list.num}</td>
							<td>${list.title}</td>
							<td>${list.writer}</td>
							<td>${list.contents}</td>
							<td>${list.hit}</td>
							<td>${list.regDate}</td>
						</tr>
					</c:forEach>


				</tbody>
			</table>
		</div>

		<div class="row justify-content-end">
			<a href="./add" type="button" class=" col-1 btn btn-primary btn">WRITE</a>
		</div>

	<nav aria-label="Page navigation example">
		  <ul class="pagination align-self-center">
		    <li class="page-item">
		      <a class="page-link" href="./list?pn=${pager.pre?pager.startNum-1:1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    
		    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
		    <li class="page-item"><a class="page-link" href="./list?pn=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
		    </c:forEach>
		    
		    <li class="page-item">
		      <a class="page-link" href="./list?pn=${pager.next?pager.lastNum+1:pager.lastNum}&kind=${pager.kind}&search=${pager.search}" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>

	</div>

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>