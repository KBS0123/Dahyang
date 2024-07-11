<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet" type="text/css">
<meta charset="EUC-KR">
<title>Login</title>
  <style>
  h3 {
    color: #75b64d;
  }
  a {
    text-decoration: none;
    display: inline-block;
    width: 50px;
    height: 50px;
    padding: 8px 16px;
    position: absolute;
    top: 40px; /* ȭ�� ��ܿ��� �Ʒ�*/
    left: 680px; /* ȭ�� ���ʿ��� ����������*/
    z-index: 1000; /* �ٸ� ��Һ��� ���� ǥ�õǵ��� ���� */
    font-family: "Lucida Sans Unicode", "Arial Unicode MS";
    font-size: 25px;
    line-height: 30px;
  }

  a:hover {
    background-color: #ddd;
    color: #75b64d;
  }

  .previous {
    background-color: #fff;
    color: #75b64d;
  }

  .round {
    border-radius: 50%;
  }
  </style>
</head>
<body>
	<div class="container">
	
	<!-- �ڷΰ��� ��ư(�����ڵ�) -->
	<a href="<c:url value='/views/users/profile'/>" class="previous round">&#8249;</a>
	<!-- �ڷΰ��� ��ư(�����ڵ�) -->
	
  <div class="screen">
    <div class="screen__content">
      <form class="login" action="<c:url value='/views/login'/>" method="post">
       <h3>�پ��� ���, �پ��� ����.</h3>
        <div class="login__field">
          <i class="login__icon fas fa-user"></i>
          <input type="email" class="login__input" name="email" id="email" placeholder="Email">
        </div>
        <div class="login__field">
          <i class="login__icon fas fa-lock"></i>
          <input type="password" class="login__input" name="pwd" id="pwd" placeholder="Password">
        </div>
        <c:if test="${not empty error }">
			<div align="center">
				<span class="badge bg-danger" align="center" id="result">${error }</span>
					<br><br>
			</div>					
		</c:if>
        <button type="submit" class="button login__submit">
          <span class="button__text">LogIn</span>
          <i class="button__icon fas fa-chevron-right"></i>
        </button>
        <button type="button" 
				onclick="location.href='https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=${REST_API_KEY}&redirect_uri=${REDIRECT_URI}&prompt=login'">
				īī�� �α���
		</button>
      </form>
    </div>
    <div class="screen__background">
      <span class="screen__background__shape screen__background__shape4"></span>
      <span class="screen__background__shape screen__background__shape3"></span>    
      <span class="screen__background__shape screen__background__shape2"></span>
      <span class="screen__background__shape screen__background__shape1"></span>
    </div>
  </div>
</div>
</body>
</html>