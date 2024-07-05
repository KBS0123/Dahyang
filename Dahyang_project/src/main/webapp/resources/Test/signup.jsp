<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet" type="text/css">
<meta charset="EUC-KR">
<title>signup</title>
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
    top: 40px; /* ȭ�� ��ܿ��� �Ʒ��� */
    left: 680px; /* ȭ�� ���ʿ������������� */
    z-index: 1000; /* �ٸ� ��ҵ麸�� ���� ǥ�õǵ��� ���� */
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
	<a href="javascript:history.back()" class="previous round">&#8249;</a>
	<!-- �ڷΰ��� ��ư(�����ڵ�) -->
	
  <div class="screen">
    <div class="screen__content">
      <form class="login" action="signup" method="post">
       <h3>�پ��� ���, �پ��� ����.</h3>
        <div class="login__field">
          <i class="login__icon fas fa-user"></i>
          <input type="text" class="login__input" name="username" placeholder="User name / Email" required>
        </div>
        <div class="login__field">
          <i class="login__icon fas fa-lock"></i>
          <input type="password" class="login__input" name="password" placeholder="Password" required>
        </div>
        <div class="login__field">
          <i class="login__icon fas fa-lock"></i>
          <input type="password" class="login__input" name="passwordCheck" placeholder="Password Check" required>
        </div>
        <div class="login__field">
          <i class="login__icon fas fa-user"></i>
          <input type="text" class="login__input" name="name" placeholder="Name" required>
        </div>
        <div class="login__field">
          <i class="login__icon fas fa-calendar-alt"></i>
          <input type="text" class="login__input" name="birth" placeholder="YY/MM/DD" required>
        </div>
        <button class="button login__submit">
          <span class="button__text">Sign Up</span>
          <i class="button__icon fas fa-chevron-right"></i>
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
