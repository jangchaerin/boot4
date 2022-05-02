<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <!-- 써줘야함 -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> <!-- MESSAGE 쓰려고 -->
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
<!-- header -->
<c:import url="./temp/header.jsp"></c:import>

	<div class="container mt-4">
		<div id="carouselExampleControls" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img
						src="https://fncent.com/files/2022/02/23/95c2c0687206848f8f867241a1115b1a180649.jpg"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img
						src="https://fncent.com/files/2022/02/23/c1ef220da543b3d053290efcb3dd2581180649.jpg"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img
						src="https://fncent.com/files/2022/02/23/875ea9925cc4988746519d241fd2b78a180649.jpg"
						class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	
	
	<%-- <div class="container">
		<c:if test="${not empty member}">
			<c:forEach items="${member.roleVOs}" var="vo">
				<h3>${vo.roleName}님 환영합니다.</h3>
			</c:forEach>
		</c:if> 
	</div> --%>
	
	
	
	
	<div class="container">
		<input type="text" id="v1">
		<input type="checkbox" class="num" name="num" value="a">
		<input type="checkbox" class="num" name="num" value="b">
		<input type="checkbox" class="num" name="num" value="c">
		<input type="checkbox" class="num" name="num" value="d">
		<button id="btn1">GET</button>
		<button id="btn2">POST</button>
		<button id="btn3">AJAX</button>
	</div>
	
	<div class="container">
		<h1>Spring Message</h1>
		<h1><spring:message code="hello" var="m"></spring:message></h1>
		<h1><spring:message code="test" text="기본메시지"></spring:message></h1>
		<h1>${m}</h1>
		<h3>${m}</h3>
		<h2><spring:message code="board.title"></spring:message></h2>
	</div>
	
	<div class="container">
	<c:if test="${not empty member}">
		<!-- 회원의 id 님 환영합니다. -->
		<h1><spring:message code="member.id" arguments="${member.id}" text="환영합니다"></spring:message></h1>
	
	</c:if>
	</div>
	
	<c:import url="./temp/header_script.jsp"></c:import>
	<script type="text/javascript">
	
		$('#btn1').click(function(){
			let v=$('#v1').val();
			console.log(v);
			$.get("./getTest?msg="+v,function(data){ 
				console.log("응답완료");
				console.log(data.trim());
			}) 
		})
		
		//btn2를 click하면 v1의 입력된 값을 /postTest 요청시 파라미터 전송
		//응답으로 getResult.jsp를 받기
		$("#btn2").click(function(){
			let v = $("#v1").val();
			$.post("./postTest",{msg:v},function(result){
				console.log(result.trim());
			});			
		})
		
		/* $("#btn3").click(function(){
			let v = $("#v1").val();
			$.ajax({
				method:"POST",
				url:"./postTest",
				data:{
					msg:v
				},
				success:function(d){
					console.log(d.trim());
				},
				error:function(){
					alert('에러발생');
				}
			})
		}) */
		$("#btn3").click(function(){
			let ar=[1,2,3];
			let nums = [];
			
			$(".num").each(function(idx,item){
				if($(item).prop("checked")){
					console.log($(item).val());
					nums.push($(item).val());
					
				}
			
			});
			
			let v = $("#v1").val();
			$.ajax({
				type:"POST",
				url:"./arrayTest",
				traditional:true,
				data:{
					msg:v,
					numbers:ar,
					nums:nums 		//파라미터이름:파라미터값
				},
				success:function(d){
					console.log(d.trim());
				},
				error:function(){
					alert('에러발생');
				}
			})
		}) 
		
	</script>
	
</body>
</html>