<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>피드 페이지</title>
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
	        <button class="back-button" onclick="location.href='<c:url value="/views/club/${clid}"/>'">
		        <svg viewBox="0 0 24 24">
		          <path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"/>
		        </svg>
		    </button>
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
	            	<c:forEach var="feed" items="${feeds}">
	            		<div class="feed-item">
	            			<a href="<c:url value='/views/club/${clid}/feed/${feed.fid}' />">
			                    <div class="image-placeholder">
			                    	<c:choose>
										<c:when test="${not empty feed.img}">
											<img alt="123" src="${pageContext.request.contextPath}/resources/imgs/${feed.img}">
										</c:when>
										<c:otherwise>
											<img src="${pageContext.request.contextPath}/resources/css/feed.jpg">
										</c:otherwise>
									</c:choose>
			                    </div>
		                    </a>
		                    <p class="feed-text">${feed.content}</p>
		                </div>
			         </c:forEach>
	            </div>
	        </div>
	        <c:import url="navbar2.jsp"></c:import>
	    </div>
	    <!-- 새 피드 작성 버튼 -->
	    <c:forEach var="m" items="${member}">
		    <!-- 만약 회원의 uid가 사용자의 uid와 일치한다면 버튼을 표시하지 않음 -->
		    <c:if test="${m.uid == user.uid}">
		        <button class="button new-feed" onclick="location.href='<c:url value="/views/club/${clid}/feed/write"/>'">피드 작성하기</button>
		    </c:if>
		</c:forEach>
    </div>
</main>
</html>