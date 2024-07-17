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
.settings-button img {
    filter: invert(28%) sepia(94%) saturate(2964%) hue-rotate(117deg) brightness(96%) contrast(94%);
}
</style>
<body>
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
			      <span style= "margin-left: 10px; font-weight: bold; color: white; font-size: 20px;">${club.title}</span>
			      <div class="right">
			        <c:forEach var="m" items="${member}">
				        <!-- 만약 회원의 uid가 사용자의 uid와 일치한다면 버튼을 표시하지 않음 -->
				        <c:if test="${m.uid == user.uid}">
				            <button class="settings-button" onclick="location.href='<c:url value="/views/club/${clid}/setting"/>'">
			                    <img src="${pageContext.request.contextPath}/resources/css/setting icon.svg" class="svg-icon">
			            	</button>
				        </c:if>
				    </c:forEach>
		      	  </div>
		    </header>
		    <!-- 상단바 -->
        <div class="page">
        <div class="content">
            <div class="image-placeholder">
            	<c:choose>
					<c:when test="${not empty club.img}">
						<img src="${pageContext.request.contextPath}/resources/imgs/${club.img}">
					</c:when>
					<c:otherwise>
						<img src="${pageContext.request.contextPath}/resources/css/group.png">
					</c:otherwise>
				</c:choose>
            </div>
            <h2 class="group-title">${club.title}</h2>
            <p class="status">현재 멤버를 모집 중인 모임입니다.</p>
            
            <div class="description">
                <span>${club.content}</span>
            </div>
        </div>
        <c:choose>
	        <c:when test="${empty user}">
		        <button class="apply-button" onclick="location.href='<c:url value="/views/users/profile"/>'">가입하기</button>
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
								        <c:choose>
								        	<c:when test="${not empty m.uimg}">
								        		<img src="${pageContext.request.contextPath}/resources/imgs/${m.uimg}" alt="프로필 사진">
								        	</c:when>
								        	<c:otherwise>
								        		<img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png">
								        	</c:otherwise>
								        </c:choose>
							            <div class="user-info">
							                <div class="user-name">${m.unickname}</div>
							            </div>
							            <c:if test="${m.uid == club.uid}">
								            <div class="user-info">
								                <div class="user-name">(방장)</div>
								            </div>
							            </c:if>
							        </div>
						        </c:forEach>
						    </div>
						</div>
		            </c:if>
		        </c:forEach>
		    </c:otherwise>
	    </c:choose>
	    </div>
		<c:import url="navbar2.jsp"></c:import>
    <script>
        function toggleParticipants() {
            var box = document.getElementById("participantsBox");
            box.classList.toggle("show");
        }
    </script>
    </div>
</body>
</html>