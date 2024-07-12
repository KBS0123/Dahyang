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
            <span class="group-name">그룹방 이름</span>
        </div>
        
        <div class="content">
            <div class="image-placeholder"></div>
            <h2 class="group-title">그룹방 이름</h2>
            <p class="status">현재 멤버를 모집 중인 모임입니다.</p>
            
            <div class="description">
                <span>소개글</span>
            </div>

            <div class="info-box">
                <div class="info-item">
                    <span>적정 인원: 4명</span>
                </div>
                <div class="info-item">
                    <span>현재 참여 중: 2명</span>
                </div>
            </div>

            <div class="info-box">
                <div class="info-item">
                    <span>진행 방식: 온라인</span>
                </div>
            </div>
        </div>
        
        <button class="apply-button">신청하기</button>
    </div>
</body>
</html>