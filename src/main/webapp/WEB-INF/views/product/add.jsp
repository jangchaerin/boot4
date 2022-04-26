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
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>


<title>Insert title here</title>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>

	<div class="container mt-4">


		<form action="add" method="post" enctype="multipart/form-data">

			<div class="row mt-4 ">
				<div class="alert alert-primary" role="alert">
					<h4 class="text-center" style="text-transform: capitalize;">${board}
						Add</h4>
				</div>
			</div>
			
			<div class="row" id="list">
				
			</div>
			
			
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Name</label> <input
					type="text" class="form-control" id="name" name="productName">
			</div>
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Price</label> <input
					type="text" class="form-control" id="price"
					aria-describedby="emailHelp" name="productPrice">
			</div>
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Count</label> <input
					type="text" class="form-control" id="count"
					aria-describedby="emailHelp" name="productCount">
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Detail</label>
				<textarea class="form-control" id="detail" name="productDetail"></textarea>
			</div>



			<div id="fileResult"></div>

			<button type="button" id="fileAdd" class="btn btn-primary">FileAdd</button>
			<div id="fileResult">
			
			</div>

			<div class="row justify-content-end mt-5">
				<button type="button" id="add" class="col-1 btn btn-primary">Product Add</button>
			</div>

		</form>
	</div>



	<script type="text/javascript">
		//pager
		//let pn=1;
		$("#list").on("click",".pager",function(){
		
			let checkPn=$(this).attr("data-pn");
			if(checkPn>0){
				//pn=checkPn;
				list(checkPn);
			}else{
				//이전블럭과 다음블럭이 x
				alert("last page")
			}
		})
	
		//list ajax url:ajaxList, Get
		list(1);
		
		function list(pn){
			console.log("start");
			$.ajax({
				type : "GET",
				url : "./ajaxList",
				data:{
					pn:pn,
					perPage:5
					
				},
				success:function(data){
					
					$("#list").html(data.trim());
				}
			});
		}
	
		//add
		$("#add").click(function(){
			let formData=new FormData();
			let name=$("#name").val();
			let price=$("#price").val();
			let count=$("#count").val();
			let detail=	$("#detail").summernote("code");	//$("#detail").val();
			$(".files").each(function(idx,item){
				if(item.files.length>0){
					console.log(idx);					//index번호
					console.log(item);					//<input type="file">
					console.log(item.files);			//input태그의 file List
					console.log(item.files[0]);			//files list 중 첫번쨰 파일
					console.log("length:",item.files.length);		//file의 길이
					console.log(item.files[0].name);	//files list중 첫번째 파일의 이름
					//formData.append("파라미터명",값)
					formData.append("files",item.files[0]);
				}
			});		//each끝 (반복문이 끝나면 formData에 파일이 append 되어있다.)
			
			//나머지 애들을 formData에 append시켜줌
			formData.append("productName", name);
			formData.append("productPrice", price);
			formData.append("productCount", count);
			formData.append("productDetail", detail);
			
			
			$.ajax({
				type:"POST",
				url :"./add",
				processData:false,
				contentType:false,
				data:formData/*{
					productName:name,
					productPrice:price,
					productCount:count,
					productDetail:detail
				}*/,
				success:function(data){
					if(data.trim()==1){
						alert("상품등록 완료");
						list();
						$("#name").val("");
						$("#price").val("");
						$("#count").val("");
						$("#detail").summernote("code","");
					}else{
						alert("상품등록 실패")
					}	
				},
				error:function(){
					alert("에러발생");
				}
			})
		})
	
		//summernote
		$(document).ready(function() {
			$('#detail').summernote({
				height : 300
			});
		});

		let count = 0;
		$("#fileAdd")
				.click(
						function() {
							if (count > 4) {
								alert('첨부파일은 최대 5개 까지만 가능합니다.');
								return;
							}
							let f = ' <div class="row mb-3">';
							f = f
									+ ' <label for="contents" class="col-sm-2 col-form-label">Contents</label>';
							f = f + '<div class="col-sm-10">';
							f = f + '<div class="input-group">';
							f = f
									+ '<input type="file" class="form-control files" id="files" name="files" aria-describedby="inputGroupFileAddon04" aria-label="Upload">';
							f = f
									+ '<button class="btn btn-outline-secondary del" type="button" id="inputGroupFileAddon04">X</button>';
							f = f + '</div>';
							f = f + '</div>';
							f = f + '</div>';
							count++;

							$("#fileResult").append(f)
						});
		//속성 안에 ""이 있어서 ''으로 묶는다

		$("#fileResult").on("click", ".del", function() {
			$(this).parent().parent().parent().remove();
			count--;
		})
	</script>


</body>
</html>