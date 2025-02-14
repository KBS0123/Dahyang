<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage(user profile)</title>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

 <style type="text/css">
    .bs-example { margin: 20px; }
    .logo-small { color: #f4511e; font-size: 50px; }
    footer .glyphicon { font-size: 20px; margin-bottom: 20px; color: #f4511e; }
     .center-text { /*상단바 텍스트 위치 조정*/
      margin-top: 25px;
    }
  </style>
</head>

  <main>
  
  <header>
    <div class="feature"></div>
    <div class="feature"></div>
  </header>
  
  <div id="app">
    
    <!-- 상단바 -->
      <header>
        <div class="system-bar"></div>
        <div class="left">
          <span class="ion-chevron-left"></span>
        </div>
        <img src="${pageContext.request.contextPath}/resources/css/Logo.png"
             height="150" width="130">
        <div class="center-text">다양한 사람들과 다양한 취미를 향유하다</div>
        <div class="right">
          <span class="ion-navicon"></span>
        </div>
      </header>
      <!-- 상단바 -->
    
    <!--페이지 내용-->
    <div class="page">
      <div class="profile">
        <div class="profile-img">
          <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png">
        </div>
        <h2>User Name</h2>
        <p>회원가입하고 편하게 찾으세요 :)</p>
    
        <div id="container">
		  <button class="learn-more">
		    <span class="circle" aria-hidden="true">
		      <span class="icon arrow"></span>
		    </span>
		    <span class="button-text">로그인</span>
		  </button>
		</div>
        
        <div id="container">
		  <button class="learn-more">
		    <span class="circle" aria-hidden="true">
		      <span class="icon arrow"></span>
		    </span>
		    <span class="button-text">회원가입</span>
		  </button>
		</div>
        <br>
         <p>상세정보</p>
        <div class="profile-details">
          <p><span>Email:</span> user@example.com</p>
          <p><span>지역:</span> 도시</p>
          <p><span>관심분야:</span> 코딩, 디자인, 여행</p>
          <p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
        </div>
      </div>
    </div>
    <!--페이지 내용-->
  <jsp:include page="/views/navbar.jsp" />
  </div>
  </main>