<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body style="background-color:#2E2E2E">
	<c:import url="nav_top.jsp"></c:import>
	<div class="container mb-4">
		<div class="row justify-content-center mb-3">
			<div class="col-md-6 mb-3">
				<h4 class="text-white" align="center">로그인</h4>
					<form class="login-form" action="<c:url value='/views/login'/>"
						method="post">
						<div class="mb-3">
							<label for="email" class="form-label"><p class="text-white">아이디</p></label>
							<input type="text" class="form-control" name="email" id="email" placeholder="아이디를 입력해주세요.">
						</div>
						<div class="mb-3">
							<label for="password" class="form-label"><p class="text-white">비밀번호</p></label> 
							<input type="password" class="form-control" name="pwd" id="pwd" placeholder="비빌번호를 입력해주세요.">
						</div>
						<c:if test="${not empty error }">
						<div align="center">
							<span class="badge bg-danger" align="center" id="result">${error }</span>
								<br><br>
						</div>
							
						</c:if>
						<div class="d-flex justify-content-between">						
							<button type="submit" class="btn btn-success mr-2">로그인</button>
							<div>
								<p class="text-white">
									아직 회원이 아닌가요?
									<a href="<c:url value='/views/users/register'/>">
										<button type="button" class="btn btn-success mr-2">회원가입</button>
									</a>
								</p>
							</div>
						</div>
					</form>
			</div>
		</div>
	</div>
	<c:import url="nav_bottom.jsp"></c:import>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>