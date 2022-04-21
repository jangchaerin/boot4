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
	<div class="container mt-4">
		<form action="./add" method="post" enctype="multipart/form-data">


			<div class="row mt-4 ">
				<div class="alert alert-primary" role="alert">
					<h4 class="text-center" style="text-transform: capitalize;">${board}
						Add</h4>
				</div>
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Title</label>
				<input type="text" class="form-control" id="title" name="title">
			</div>
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Writer</label> <input
					type="text" class="form-control" id="writer"
					aria-describedby="emailHelp" name="writer">
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Contents</label>
				<textarea class="form-control" id="contents" name="contents"></textarea>
			</div>

			<button type="button" id="fileAdd" class="btn btn-primary">FileAdd</button>
			<div id="fileResult">
			
			</div>

			<div class="row justify-content-end mt-5">
				<button type="submit" class="col-1 btn btn-primary ">Submit</button>
			</div>

		</form>
	</div>

	<c:import url="../temp/header_script.jsp"></c:import>

	<script type="text/javascript">
		let count=0;
		$("#fileAdd").click(function(){
			if(count>4){
				alert("5개 까지 가능합니다.");
				return;
			} 
			let f= '<div class="input-group">';
			f=f+' <input class="form-control form-control-lg" id="formFileSm" type="file" name="files">';
			f=f+'<button class="btn btn-outline-secondary del" type="button">X</button>';
			f=f+'</div>';
			$("#fileResult").append(f);
			count++;
		});
		
		$("#fileResult").on("click", ".del",function(){
			$(this).parent().remove();
			count--;
		});
		
		
	</script>


</body>
</html>