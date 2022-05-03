<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
		<%-- <form action="./join" method="post" enctype="multipart/form-data"> --%>
		<form:form modelAttribute="memberVO" method="post" enctype="multipart/form-data">
			<div class="row mt-4 ">
				<div class="alert alert-primary" role="alert">
					<h4 class="text-center" style="text-transform: capitalize;">Member
						Join Page</h4>
				</div>
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">ID</label> 
				<!-- <input type="text" class="form-control" id="id" name="id"> -->
				<form:input path="id" cssClass="form-control" id="id"/>
				<div>
					<form:errors path="id"/>
				</div>
			</div>
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">PassWord</label>
			<!-- 	<input type="password" class="form-control" id="pw" aria-describedby="emailHelp" name="pw"> -->
				<form:password path="pw" cssClass="form-control" id="pw"/>
				<div>
					<form:errors path="pw"/>
				</div>
			</div>
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">PassWord 확인</label>
			<!-- 	<input type="password" class="form-control" id="checkPw" aria-describedby="emailHelp" name="checkPw"> -->
				<form:password path="checkPw" cssClass="form-control" id="checkPw"/>
				<div>
					<form:errors path="checkPw"/>
				</div>
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Name</label> 
				<!-- <input type="text" class="form-control" id="name" aria-describedby="emailHelp" name="name"> -->
				<form:input path="name" cssClass="form-control" id="name"/>
				<div>
					<form:errors path="name"/>
				</div>
			</div>
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">E-Mail</label> 
				<!-- <input type="text" class="form-control" id="email" aria-describedby="emailHelp" name="email"> -->
				<form:input path="email" cssClass="form-control" id="email"/>
				<div>
					<form:errors path="email"/>
				</div>
			</div>
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Phone</label> 
				<!-- <input type="text" class="form-control" id="phone" aria-describedby="emailHelp" name="phone"> -->
				<form:input path="phone" cssClass="form-control" id="phone"/>
				<div>
					<form:errors path="phone"/>
				</div>
			</div>
			<div class="mb-3">
				<input class="form-control form-control-lg" type="file" name="file">
			</div>


			<div class="row justify-content-end">
				<button type="submit" class="col-1 btn btn-primary ">Join!!</button>
			</div>
			
		<%-- 	</form> --%>
		</form:form>

			<div class="row mt-4">
				<div class="form-check">
					<input class="form-check-input ch-all" type="checkbox" value=""
						id="all"> <label class="form-check-label"
						for="all"> checkbox </label>
				</div>
				<div class="form-check">
					<input class="form-check-input ch" type="checkbox" value=""
						id="check1"> <label class="form-check-label"
						for="check1"> checkbox1 </label>
				</div>
				<div class="form-check">
					<input class="form-check-input ch" type="checkbox" value=""
						id="check2"> <label class="form-check-label"
						for="check2"> checkbox2 </label>
				</div>
				<div class="form-check">
					<input class="form-check-input  ch" type="checkbox" value=""
						id="check3"> <label class="form-check-label"
						for="check3"> checkbox3 </label>
				</div>
			</div>
			</div>
<c:import url="../temp/header_script.jsp"></c:import>
 <script type="text/javascript">
/*  
 $(".ch-all").click(function(){
     if($(".ch-all").prop("checked")){
       $(".ch").each(function(idx,item){
          $(item).prop("checked",true);
       });
       }
    else
       {
       $(".ch").each(function(idx,item){
          $(item).prop("checked",false); 
       });
    } 
 });
  */
  
  $("#all").click(function(){
	  $(".ch").prop("checked",$("#all").prop("checked"));
  });
  
  $(".ch").on("click",function(){
	let check=true;
	$(".ch").each(function(idx,item){
		if(!$(item).prop("checked")){
			check=false;
		}
	});
	$("#all").prop("checked",check);
  });
  

 </script>

		

</body>
</html>