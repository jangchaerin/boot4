<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <!-- 써줘야함 -->
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
	
	<div class="container">
		<input type="text" id="d1">
		<button id="btn">CLICK</button>
		<button id="btn2">CLICK2</button>
		<input type="checkbox" name="ch" class="ch" value="1">
		<input type="checkbox" name="ch" class="ch" value="2">
		<input type="checkbox" name="ch" class="ch" value="3">
		<input type="checkbox" name="ch" class="ch" value="4">
		<button id="btn3">CLICK3</button>
		<div id="result">
			
		</div>
	</div>
	
	<c:import url="./temp/header_script.jsp"></c:import>
	<script type="text/javascript">
		
		/*기존 js
		const ch=document.getElementsByClassName("ch");
		for (c of ch){		//똑같은 클래스가 여러개 일때는 그 각각의 요소에 이벤트를 걸어주기 위해 반복문 써줘야 함
			c.addEventListener("click", function(){
				alert(this.value);
			})
		}*/
		
		/*$('.ch').click(function(){ //하지만 jQuery에서는 반복문 안돌려도 된다. 4군데 동일하게 적용 됨
			console.log(this.value);
		}) */
		
		/*$('.ch').on({
			click:function(){
				console.log("click event");
			},
			change:function(){
				console.log("change event");
			}
			
		});*/
		
		$('.ch').click(function(e){
			let c=$(this).prop("checked");
			this.checked;
			console.log(c);
			$(".ch").prop("checked",true);
		});
		$('.ch').change(function(){
			console.log("change test");
		})
		
		$("#btn2").click(function(){
			   $(".ch").each(function(idx,item){
			      console.log("index:",idx);
			      console.log("item:",item);
			      console.log("value:",$(item).val());
			   })
			 });
		$("#btn").click(function(){
			   let v =$("#d1").val()
			   console.log(v);
			}); 
		
		/* $("#btn3").click(function(){
			$("#result").append('<input type="checkbox" name="ch" class="ch" value="1">')
		}) */
		
		$("#btn3").click(function(){
			let r="<div>";
			r = r+'<input type="checkbox" name="ch" class="ch" value="1">';
			r = r+"</div>";
			
			$("#result").append(r);
		});
		
		
		
		
	</script>
	
</body>
</html>