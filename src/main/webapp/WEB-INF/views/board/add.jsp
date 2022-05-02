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
<c:import url="../temp/header_script.jsp"></c:import>

<!-- 에디터 -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
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
				<label for="exampleInputEmail1" class="form-label">Writer</label> 
				<input type="text" class="form-control" id="writer" aria-describedby="emailHelp" value="${member.name}" readonly="readonly" name="writer">
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

	<script type="text/javascript" src="../resources/js/fileAdd.js"></script>
	<script type="text/javascript" src="../js/summernote.js"></script>
	<script type="text/javascript">
			
	    summernoteInit("contents","");		
	    fileAddInit(${vo.filesVOs.size()});
		
		
		
	</script>


</body>
</html>