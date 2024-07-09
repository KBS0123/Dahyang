<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
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
            <span class="back-arrow">&lt;</span>
            <span class="group-name">${club.title}</span>
        </div>
        
        <div class="content">
            <div class="image-placeholder"></div>
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
        
        <button class="apply-button">신청하기</button>
    </div>
</body>
</html>