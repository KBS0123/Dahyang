<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>그룹방 검색</title>
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
	    	<div class="left">
	    	<!-- 홈 버튼 -->
		        <button class="home-button" onclick="location.href='<c:url value="/views/"/>'">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" id="home-icon">
					    <path
					        d="M13.1428571,14.5 C13.6571429,14.5 14,14.175507 14,13.6887676 L14,6.38767551 C14,6.14430577 13.9142857,5.90093604 13.6571429,5.73868955 L8.51428571,1.6825273 C8.17142857,1.43915757 7.74285714,1.43915757 7.4,1.6825273 L2.25714286,5.73868955 C2.08571429,5.90093604 2,6.14430577 2,6.38767551 L2,13.6887676 C2,14.175507 2.34285714,14.5 2.85714286,14.5 L13.1428571,14.5 Z M5.42857143,12.8775351 L3.71428571,12.8775351 L3.71428571,6.79329173 L8,3.38611544 L12.2857143,6.79329173 L12.2857143,12.8775351 L10.5714286,12.8775351 L5.42857143,12.8775351 Z">
					    </path>
					  </svg>
				</button>
			    <!-- 홈 버튼 -->
		      </div>
		      <span style= "margin-right: 110px; font-weight: bold; color: white; font-size: 20px;">그룹방 검색</span>
		      <div class="right">
		        <span class="ion-navicon"></span>
	      	</div>
	    </header>
	    <!-- 상단바 -->
      	
		<!-- 내부 박스 -->
   	 	<div class="page">
	        <div class="content">
	            <div class="feed">
	            	<c:forEach var="club" items="${clubs}">
	            		<div class="feed-item">
	            			<a href="<c:url value='/views/club/${club.clid}' />">
			                    <div class="image-placeholder">
			                    	<c:choose>
										<c:when test="${not empty club.img}">
											<img alt="123" src="${pageContext.request.contextPath}/resources/imgs/${club.img}">
										</c:when>
										<c:otherwise>
											<img src="${pageContext.request.contextPath}/resources/css/group.png">
										</c:otherwise>
									</c:choose>
			                    </div>
		                    </a>
		                    <p class="feed-text">${club.title}</p>
		                </div>
			         </c:forEach>
	            </div>
	        </div>
	    </div>
    </div>
</main>
</html>