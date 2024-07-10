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
		        	<button class="apply-button">신청하기</button>
		        </a>
		    </c:when>
		    <c:when test="${not empty user}">
		        <c:forEach var="m" items="${member}">
			        <c:if test="${m.uid == user.uid}">
			            <form action="<c:url value='/views/club/${club.clid}'/>" method="post">
			                <button type="submit" class="apply-button">신청하기</button>
			            </form>
			        </c:if>
			    </c:forEach>
		    </c:when>
		    <c:otherwise>
	        	<div class="profile-img">
		          	<img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png">
		        </div>
	        </c:otherwise>
	    </c:choose>
    </div>
</body>
</html>