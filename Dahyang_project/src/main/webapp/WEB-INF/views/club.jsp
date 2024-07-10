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
<body>
    <div class="container">
        <div class="navbar">
        	<a href="<c:url value='/views/club/list'/>">
            	<span class="back-arrow">&lt;</span>
            </a>
            <span class="group-name">${club.title}</span>
        </div>
        
        <div class="content">
            <div class="image-placeholder">
            	<img src="${club.img}">
            </div>
            <h2 class="group-title">${club.title}</h2>
            <p class="status">현재 멤버를 모집 중인 모임입니다.</p>
            
            <div class="description">
                <span>${club.content}</span>
            </div>

            <div class="info-box">
                <div class="info-item">
                    <span>인원</span>
                    <div class="info-details">
                        <span>적정</span><span>4명</span>
                        <span>현재</span><span>2명</span>
                    </div>
                </div>
                <div class="info-item">
                    <span>방식</span>
                    <span>온라인</span>
                </div>
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
		                <c:import url="navbar.jsp"></c:import>
		            </c:if>
		        </c:forEach>
		    </c:otherwise>
	    </c:choose>
    </div>
</body>
</html>