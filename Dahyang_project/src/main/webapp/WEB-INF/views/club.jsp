<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/group.css" rel="stylesheet" type="text/css">
    <title>Group Page</title>
</head>
<style>
        .svg-icon {
            width: 30px;
            height: 30px;
            filter: brightness(0) invert(1); /*아이콘 색상 변경*/
        }
    </style>
<body>
    <div class="container">
        <div class="navbar">
        	<a href="<c:url value='/views/club/list'/>">
            	<span class="back-arrow">&lt;</span>
            </a>
            <span class="group-name">${club.title}</span>
            <!-- 톱니바퀴 버튼 추가 -->
            <button class="settings-button" onclick="location.href='<c:url value="/views/club/${clid}/setting"/>'">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M0 0h24v24H0z" fill="none"/>
                    <img src="${pageContext.request.contextPath}/resources/css/setting icon.svg" class="svg-icon">
                </svg>
            </button>     
        </div>
        
        <div class="content">
            <div class="image-placeholder">
            	<img src="${pageContext.request.contextPath}/resources/imgs/${club.img}">
            </div>
            <h2 class="group-title">${club.title}</h2>
            <p class="status">현재 멤버를 모집 중인 모임입니다.</p>
            
            <div class="description">
                <span>${club.content}</span>
            </div>
        </div>
        <c:choose>
	        <c:when test="${empty user}">
		        <a href="<c:url value='/views/users/profile'/>">
		        	<button class="apply-button">가입하기</button>
		        </a>
		    </c:when>
		    <c:otherwise>
		        <!-- 기본적으로 버튼을 표시하도록 설정 -->
		        <c:set var="showButton" value="true" />
		
		        <c:forEach var="m" items="${member}">
		            <!-- 만약 회원의 uid가 사용자의 uid와 일치한다면 버튼을 표시하지 않음 -->
		            <c:if test="${m.uid == user.uid}">
		                <c:set var="showButton" value="false" />
		            </c:if>
		        </c:forEach>
		
		        <!-- showButton 변수가 true일 때만 버튼을 표시 -->
		        <c:if test="${showButton}">
		            <form action="<c:url value='/views/club/${club.clid}'/>" method="post">
		                <button type="submit" class="apply-button">가입하기</button>
		            </form>
		        </c:if>
		
		        <!-- 로그인된 사용자의 uid가 member 리스트에 포함된 경우 프로필 이미지 표시 -->
		        <c:forEach var="m" items="${member}">
		            <c:if test="${m.uid == user.uid}">
				    	<!-- 공지사항 박스 -->
					    <div class="notice-box">
					        <h3 class="notice-title">공지사항</h3>
					        <div class="notice-content">
					            <!-- 여기에 공지사항 내용을 동적으로 표시할 부분 -->
					          <p>${club.notice}</p>
					        </div>
					    </div>
					    <!-- 공지사항 박스 끝 -->
					    
			          	<!-- 참여된 인원 토글 박스 -->
					   	<div class="toggle-box">
						    <div class="toggle-header" onclick="toggleParticipants()">
						        <div class="toggle-title">참여된 인원</div>
						        <div class="toggle-icon">+</div>
						    </div>
						    <div class="toggle-content" id="participantsBox">
						        <!-- 추가적인 참여된 인원 예시 -->
						        <c:forEach var="m" items="${member}">
							        <div class="user-profile">
							            <img src="${pageContext.request.contextPath}/resources/imgs/${m.uimg}" alt="프로필 사진">
							            <div class="user-info">
							                <div class="user-name">${m.unickname}</div>
							            </div>
							        </div>
						        </c:forEach>
						    </div>
						</div>
		            </c:if>
		        </c:forEach>
		    </c:otherwise>
	    </c:choose>
		<c:import url="navbar2.jsp"></c:import>
    </div>
    <script>
        function toggleParticipants() {
            var box = document.getElementById("participantsBox");
            box.classList.toggle("show");
        }
    </script>
</body>
</html>