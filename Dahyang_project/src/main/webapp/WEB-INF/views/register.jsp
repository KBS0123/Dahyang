<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
  .center-div {
    max-width: 600px;
    margin: 0 auto; /* 가운데 정렬 */
    padding: 20px; /* 내부 여백 추가 */
  }
</style>
</head>

<body style="background-color:#2E2E2E">
<c:import url="nav_top.jsp"></c:import>
<div class="center-div">
	<h5 align="center" class="mb-4">
		<p class="text-white">회원 가입</p>
	</h5>
	<form style="align:center; " action="<c:url value='/views/users/register'/>" method="post">
	  <div class="row mb-3">
	    <label for="inputEmail3" class="col-sm-2 col-form-label"><p class="text-white">이메일</p></label>
	    <div class="col-sm-10">
	      <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요.">
	    </div>
	  </div>
	  <div class="row mb-3">
	    <label for="inputPassword3" class="col-sm-2 col-form-label"><p class="text-white">비밀번호</p></label>
	    <div class="col-sm-10">
	      <input type="password" class="form-control" id="pwd" name="pwd" placeholder="비빌번호를 입력해주세요.">
	    </div>
	  </div>
	  <div class="row mb-3">
	    <label for="inputEmail3" class="col-sm-2 col-form-label"><p class="text-white">비밀번호 확인</p></label>
	    <div class="col-sm-10">
	      <input type="password" class="form-control" id="repwd"  name="repwd" placeholder="비밀번호 재입력">
	    </div>
	  </div>
	  <div class="row mb-3">
	    <label for="inputEmail3" class="col-sm-2 col-form-label"><p class="text-white">닉네임</p></label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임을 입력해주세요.">
	    </div>
	  </div>
	  <div class="row mb-3">
	    <label for="inputEmail3" class="col-sm-2 col-form-label"><p class="text-white">생년월일</p></label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="birthday" name="birthday" placeholder="생년월일 8자리를 입력해주세요. EX) 20000101">
	    </div>
	  </div>
	  <c:if test="${not empty error }">
			<div align="center">
	  			<span class="badge bg-danger" align="center" id="result">${error}</span>
				<br><br>
			</div>
		</c:if>
	  
	  <div class="d-flex justify-content-between">
	  	<a href="<c:url value='/views/login'/>">
	    	<button type="submit" class="btn btn-success">회원가입</button>
	    </a>
	    <div>
			<a href="<c:url value='/views/login'/>">
				<button type="button" class="btn btn-success">취소</button>
			</a>
		</div>
	  </div>
	</form>
</div>
<c:import url="nav_bottom.jsp"></c:import>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>