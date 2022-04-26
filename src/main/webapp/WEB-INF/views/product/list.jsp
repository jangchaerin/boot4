<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      <div class="row row-cols-1 row-cols-md-3 g-4">
         <c:forEach items="${list}" var="vo">
            <div class="col">
               <div class="card">
                  <img src="../resources/upload/product/${vo.productFilesVO[0].fileName}"
                     class="card-img-top" alt="">
                  <div class="card-body">
                     <h5 class="card-title">이름 : ${vo.productName}</h5>
                     <hr>
                     <p class="card-text">수량 : ${vo.productCount}</p>
                     <hr>
                     <p class="card-text">설명 : ${vo.productDetail}</p>
                     <div class="card-footer">
                        <p class="card-text">가격 : ${vo.productPrice}</p>
                     </div>
                  </div>
               </div>
            </div>
         </c:forEach>
      </div>
		
		<div class="row justify-content-end">
			<a href="./add" type="button" class=" col-1 btn btn-primary btn">Product Add</a>
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


<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>