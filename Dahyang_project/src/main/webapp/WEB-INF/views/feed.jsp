<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/feedpage.css" rel="stylesheet" type="text/css">
    <title>피드 상세 페이지</title>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
        <div class="navbar">
	        <a href="<c:url value='/views/club/${clid}/feed'/>">
	            <span class="back-arrow">&lt;</span>
	        </a>
            <span class="group-name">피드</span>
            <span class="settings">&#9881;</span>
        </div>
        
        <div class="content">
            <div class="feed-item">
                <div class="feed-header">
                    <div class="profile-pic"></div>
                    <span class="nickname">${feed.writer}</span>
                    <!-- 좋아요 버튼 -->
                    <span class="like">&#9829;</span>
                </div>
                <div class="image-placeholder">${feed.img}</div>
                <div class="content-text">${feed.content}</div>
                <div class="comments">
                	<c:forEach var="comment" items="${comments}">
		            	<div class="comment">
		                    <div class="profile-pic comment-pic">${comment.uimg}</div>
		                    <span class="nickname">${comment.nickname}</span>
		                    <span class="comment-text">${comment.content}</span>
		                </div>
				    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</body>
</html>