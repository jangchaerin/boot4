<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container">
<h1>detail Page</h1>

	<ul class="list-group">
		<li class="list-group-item disabled" aria-disabled="true">NO.
			${vo.productNum}</li>
		<li class="list-group-item">Name : ${vo.productName}</li>
		<li class="list-group-item">Price : ${vo.productPrice}</li>
		<li class="list-group-item">Count : ${vo.productCount}</li>
		<li class="list-group-item">Detail : ${vo.productDetail}</li>

		<c:forEach items="${vo.productFilesVO}" var="f">
			<img alt="" src="../resources/upload/product/${f.fileName}">
		</c:forEach>
	</ul>

</div>
