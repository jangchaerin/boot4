<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<c:import url="../temp/header_css.jsp"></c:import>
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
			<form action="./update" method="post" enctype="multipart/form-data">
	<div class="container">

			<div class="container mt-4">
				<div class="row mt-4 ">
					<div class="alert alert-primary" role="alert">
						<h4 class="text-center" style="text-transform: capitalize;">${board}
							UPDATE</h4>
					</div>
				</div>
				<div class="mb-3">
					<input type="hidden" name="num" value="${vo.num}">
					<label for="exampleInputPassword1" class="form-label">Title</label>
					<input type="text" class="form-control" id="title" name="title"
						value="${vo.title }">
				</div>
				<div class="mb-3">
					<label for="exampleInputEmail1" class="form-label">Writer</label> <input
						type="text" class="form-control" id="writer"
						aria-describedby="emailHelp" name="writer" value="${vo.writer}"
						readonly="readonly">
				</div>
				<div class="mb-3">
					<label for="exampleInputPassword1" class="form-label">Contents</label>
					<textarea class="form-control" id="contents" name="contents">${vo.contents}</textarea>
				</div>

				<button type="button" id="fileAdd" class="btn btn-primary">FileAdd</button>
	
	<div>
	<c:forEach items="${vo.filesVOs}" var="fileVO">
		<h4>${fileVO.oriName}<button type="button" class="del" data-num="${fileVO.fileNum}">Delete</button></h4>
	</c:forEach>
	</div>


			<div id="fileResult"></div>

			

			
		<div class="row justify-content-end">
					<button type="submit" class="col-1 btn btn-primary ">Update!!!!</button>

				</div>
				</div>
			</div>
		</form>

<script type="text/javascript" src="../resources/js/fileAdd.js"></script> <!-- fileAdd -->
<script type="text/javascript" src="../js/summernote.js"></script>   <!-- summernote -->
<script type="text/javascript">
	summernoteInit("contents","${vo.contents}");
	fileAddInit(${vo.filesVOs.size()})		
	 fileDelteInit();
</script>
</body>
</html>