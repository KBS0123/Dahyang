<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>그룹피드 페이지</title>
  <link href="${pageContext.request.contextPath}/resources/css/groupfeed.css" rel="stylesheet" type="text/css">
  <!-- 폰트 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap" rel="stylesheet">
  <!-- 폰트 -->
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
        <div class="center-text">그룹 피드</div>
        <div class="right">
          <span class="ion-navicon"></span>
        </div>
      </header>
      <!-- 상단바 -->
    
    <!-- 내부 박스 -->
    <div class="page">
    <div class="content">
            <div class="feed">
                <div class="feed-item">
                    <div class="image-placeholder"></div>
                    <p class="feed-text">피드 내용</p>
                </div>
                <div class="feed-item">
                    <div class="image-placeholder"></div>
                    <p class="feed-text">피드 내용</p>
                </div>
                <div class="feed-item">
                    <div class="image-placeholder"></div>
                    <p class="feed-text">피드 내용</p>
                </div>
                <div class=" feed-item">
                    <div class="image-placeholder"></div>
                    <p class="feed-text">피드 내용</p>
                </div>
                <div class="feed-item">
                    <div class="image-placeholder"></div>
                    <p class="feed-text">피드 내용</p>
                </div>
                <div class="feed-item">
                    <div class="image-placeholder"></div>
                    <p class="feed-text">피드 내용</p>
                </div>
                <div class="feed-item">
                    <div class="image-placeholder"></div>
                    <p class="feed-text">피드 내용</p>
                </div>
                <div class="feed-item">
                    <div class="image-placeholder"></div>
                    <p class="feed-text">피드 내용</p>
                </div>
                <div class="feed-item">
                    <div class="image-placeholder"></div>
                    <p class="feed-text">피드 내용</p>
                </div>
                <div class="feed-item">
                    <div class="image-placeholder"></div>
                    <p class="feed-text">피드 내용</p>
                </div>
            </div>
        </div>

    </div>
    <!-- 내부 박스 -->
    <jsp:include page="/views/navbar.jsp" />
    
</main>
