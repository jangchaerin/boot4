<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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


	<div class="container">

		<div class="container mt-4">
				<div class="row mt-4 ">
					<div class="alert alert-primary" role="alert">
						<h4 class="text-center" style="text-transform: capitalize;">${board} MyPage</h4>
					</div>
				</div>
		</div>
			<ul class="list-group">
  				<li class="list-group-item disabled" aria-disabled="true">${member.name}의 회원 정보</li>
 				<li class="list-group-item">ID : ${member.id}</li>
  				<li class="list-group-item">NAME : ${vo.name}</li>
  				<li class="list-group-item">E-mail : ${vo.email}</li>
  				<li class="list-group-item">PHONE : ${vo.phone}</li>
  				<li class="list-group-item">File : <a href="./fileDown?id=${vo.memberFileVO.id}" class="card-img-top">${vo.memberFileVO.oriName}</a></li>
  				
			</ul>				

		<div class="btn-group mt-3">
			<a href="/member/update?id=${member.id}" class="btn btn-primary">회원 정보수정</a>
			<a href="/member/delete?id=${member.id}" class="btn btn-primary">회원 탈퇴</a>
		</div>

	</div>


<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>