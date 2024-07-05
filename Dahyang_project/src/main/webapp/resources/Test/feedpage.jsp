<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
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
            <span class="back-arrow">&lt;</span>
            <span class="group-name">피드</span>
            <span class="settings">&#9881;</span>
        </div>
        
        <div class="content">
            <div class="feed-item">
                <div class="feed-header">
                    <div class="profile-pic"></div>
                    <span class="nickname">닉네임</span>
                    <!-- 좋아요 버튼 -->
                    <span class="like">&#9829;</span>
                </div>
                <div class="image-placeholder"></div>
                <div class="content-text">내용</div>
                <div class="comments">
                    <div class="comment">
                        <div class="profile-pic comment-pic"></div>
                        <span class="nickname">닉네임</span>
                        <span class="comment-text">댓글내용</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>