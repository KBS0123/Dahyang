<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
    top: 40px; /* 화면 상단에서 아래*/
    left: 680px; /* 화면 왼쪽에서 오른쪽으로*/
    z-index: 1000; /* 다른 요소보다 위에 표시되도록 설정 */
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
	
	<!-- 뒤로가기 버튼(유니코드) -->
	<a href="javascript:history.back()" class="previous round">&#8249;</a>
	<!-- 뒤로가기 버튼(유니코드) -->
	
  <div class="screen">
    <div class="screen__content">
      <form class="login">
       <h3>다양한 취미, 다양한 만남.</h3>
        <div class="login__field">
          <i class="login__icon fas fa-user"></i>
          <input type="text" class="login__input" placeholder="User name / Email">
        </div>
        <div class="login__field">
          <i class="login__icon fas fa-lock"></i>
          <input type="password" class="login__input" placeholder="Password">
        </div>
        <button class="button login__submit">
          <span class="button__text">LogIn</span>
          <i class="button__icon fas fa-chevron-right"></i>
        </button> 
        <button class="kakao-login-button">
		  <img src="${pageContext.request.contextPath}/views/imgs/kakao_login.png" alt="Kakao Login">
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