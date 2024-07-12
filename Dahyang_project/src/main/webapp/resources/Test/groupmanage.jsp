<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>그룹방 관리(회원)</title>
    <link href="${pageContext.request.contextPath}/resources/css/grouplist.css" rel="stylesheet" type="text/css">
    <style>
        /* 중앙 정렬을 위한 CSS 추가 */
       #content {
        text-align: center; /* 전체 내용을 중앙 정렬 */
    }

    .group {
        margin-bottom: 20px; /* 그룹 요소와 버튼 사이 여백 */
    }

    .button-container {
        margin-bottom: 20px; /* 버튼 사이 여백 */
    }

    .button {
        display: block; /* 블록 레벨 요소로 설정하여 세로 정렬 */
        width: 200px; /* 버튼 너비 설정 */
        padding: 10px 20px; /* 패딩 설정 */
        font-size: 16px; /* 폰트 크기 설정 */
        background-color: #4CAF50; /* 배경색 설정 */
        color: white; /* 텍스트 색상 설정 */
        border: none; /* 테두리 없음 */
        border-radius: 5px; /* 모서리 둥글게 */
        cursor: pointer; /* 커서 스타일 설정 */
        box-shadow: 0 5px 10px rgba(0,0,0,0.2); /* 그림자 효과 */
        margin: 0 auto; /* 가운데 정렬 */
    }

    .button:hover {
        opacity: 0.8; /* 마우스 호버시 투명도 설정 */
    }

		
		.button:hover {
		    opacity: 0.8; /* 마우스 호버시 투명도 설정 */
		}
        
    </style>
</head>
<body>
     <div id="app">
    <header>
        <div class="system-bar">
            <img src="${pageContext.request.contextPath}/resources/css/Logo.png" height="150" width="130">
        </div>
    </header>
    <div id="content">
        <div class="group">
            <h2>내 그룹방</h2>
        </div>

        <div class="button-container">
            <button class="button" onclick="location.href='${pageContext.request.contextPath}/feedWrite.jsp'">피드 등록</button>
        </div>

        <div class="button-container">
            <button class="button" onclick="location.href='${pageContext.request.contextPath}/leaveGroup'">모임 나가기</button>
        </div>
    </div>
    <jsp:include page="/views/nav2.jsp" />
</div>

</body>
</html>
