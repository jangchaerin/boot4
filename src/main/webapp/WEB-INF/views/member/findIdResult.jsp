<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
<c:import url="../temp/header_script.jsp"></c:import>
<!-- 에디터 -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>


<title>Insert title here</title>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>



	<div class="container">

		<div class="container mt-4">
			<div class="row mt-4 ">
				<div class="alert alert-primary" role="alert">
					<h4 class="text-center" style="text-transform: capitalize;">아이디
						찾기 결과</h4>
				</div>
			</div>
		</div>
		<div class="row">
			<c:choose>
				<c:when test="${not empty idResult }">
					<h1><spring:message code="member.find.id" arguments="${idResult.id}"></spring:message></h1>
				</c:when>
				<c:otherwise>
					<h1><spring:message code="member.nofind.id"></spring:message></h1>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>