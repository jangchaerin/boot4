<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="../temp/header_script.jsp"></c:import>

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



<form action="./login" method="post">
	
	<div class="container mt-4">
		<div class="row mt-4 ">
			<div class="alert alert-primary" role="alert">
				<h4 class="text-center"style="text-transform: capitalize;">Member Login Page</h4>
			</div>
		</div>
		<div class="mb-3">
			<label for="exampleInputPassword1" class="form-label">ID</label> 
			<input type="text" class="form-control" id="name" name ="id">
		</div>
		<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">PassWord</label> 
			<input type="password" class="form-control" id="pw" aria-describedby="emailHelp" name = "pw">
		</div>
		
		<div class="row justify-content-end">
			<button type="submit" class="col-1 btn btn-primary ">Login!!</button>
		</div>
		
		<div class="row">
			<button type="button" id="find" class="col-1 btn btn-danger ">아이디찾기</button>
		
		</div>
	</div>
	</form>

		
<script type="text/javascript">
	$("#find").click(function(){
		location.href="./findId";
	})	//location자체가 get방식

</script>
</body>
</html>