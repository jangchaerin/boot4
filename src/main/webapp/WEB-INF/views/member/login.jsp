<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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



<!--<form action="./login" method="post">         HTML 태그 대신 SPRING Form tag 사용-->
<form:form modelAttribute="memberVO" method="POST" >
	<div class="container mt-4">
		<div class="row mt-4 ">
			<div class="alert alert-primary" role="alert">
				<h4 class="text-center"style="text-transform: capitalize;">Member Login Page</h4>
			</div>
		</div>
		<div class="mb-3">
			<label for="exampleInputPassword1" class="form-label">ID</label> 
			<!-- <input type="text" name ="id" class="form-control" id="id" > -->
			<form:input path="id" cssClass="form-control" id="id"/><!-- path는 name(파라미터 이름)과 동일 하다.-->
			<div>
				<form:errors path="id"></form:errors>
			</div>
		</div>
		<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">PassWord</label> 
			<!-- <input type="password" class="form-control" id="pw" aria-describedby="emailHelp" name = "pw"> -->
			<form:password path="pw" cssClass="form-control" id="pw"/>
			<div>
				<form:errors path="pw" cssStyle="color:red"></form:errors>
			</div>
		</div>
		
		<div class="row justify-content-end">
			<button type="submit" class="col-1 btn btn-primary ">Login!!</button>
		</div>
		
		<div class="row">
			<button type="button" id="find" class="col-1 btn btn-danger ">아이디찾기</button>
		
		</div>
	</div>
	</form:form>
	<!--</form>-->

		
<script type="text/javascript">
	$("#find").click(function(){
		location.href="./findId";
	})	//location자체가 get방식

</script>
</body>
</html>