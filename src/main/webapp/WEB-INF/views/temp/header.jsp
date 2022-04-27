<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>


<header class="container-fluid">
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Navbar</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="/">Home</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="/board/list">Board</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="/product/list">Product</a>
					</li>
					<C:forEach items="${member.roleVOs}" var="vo">
					<C:if test="${vo.roleName eq 'ROLE_ADMIN' }">
					<li class="nav-item">
						<a class="nav-link active" href="/admin/manage">관리자모드</a>
					</li>
					</C:if>
					</C:forEach>
					
					
					
					<C:forEach items="${member.roleVOs}" var="vo">
					<C:if test="${vo.roleName eq 'ROLE_SELLER' }">
					<li class="nav-item">
						<a class="nav-link active" href="/product/manage">Product 관리</a>
					</li>
					</C:if>
					</C:forEach>
					
					
					<li class="nav-item">
						<a class="nav-link disabled">Disabled</a>
					</li>
				</ul>
				<form class="d-flex">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<C:if test="${member eq null}">
					<li class="nav-item">
						<a class="nav-link active" href="/member/join">Join</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="/member/login">Login</a>
					</li>
					</C:if>
					<C:if test="${member ne null}">
						<li class="nav-item">
							<a class="nav-link active" href="/member/logout">Logout</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link active" href="/member/mypage">My page</a>
						</li>
					</C:if>
					</ul>
				</form>
			</div>
		</div>
	</nav>
</header>
