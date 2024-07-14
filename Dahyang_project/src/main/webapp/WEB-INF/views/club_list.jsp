<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>그룹방(로그인시)</title>
    <link href="${pageContext.request.contextPath}/resources/css/grouplist.css" rel="stylesheet" type="text/css">
    <style>
        /* 중앙 정렬을 위한 CSS 추가 */
        #content {
            text-align: center;
        }

        #content h2 {
            font-size: 24px; /* 크기 조정 */
            font-weight: bold;
            margin-bottom: 20px; /* 하단 여백 조정 */
            text-align: center; /* 중앙 정렬 */
        }

        #not-logged-in p {
            font-size: 18px; /* 크기 조정 */
            color: #666; /* 색상 조정 */
            margin-bottom: 20px; /* 하단 여백 조정 */
            text-align: center; /* 중앙 정렬 */
        }

        #not-logged-in .button {
            display: block; /* 블록 레벨 요소로 변경하여 중앙 정렬 가능 */
            margin: 20px auto; /* 중앙 정렬을 위해 마진 설정 */
            padding: 10px 20px; /* 버튼 패딩 조정 */
            font-size: 16px; /* 버튼 폰트 크기 조정 */
            background-color: #4CAF50; /* 버튼 배경색 조정 */
            color: white; /* 버튼 텍스트 색상 조정 */
            border: none; /* 버튼 테두리 제거 */
            border-radius: 5px; /* 버튼 모서리 둥글게 */
            cursor: pointer; /* 커서 모양 변경 */
            box-shadow: 0 5px 10px rgba(0,0,0,0.2); /* 버튼 그림자 효과 */
        }

        #logged-in .group {
            display: flex;
            justify-content: center; /* 그룹 요소를 중앙 정렬 */
            align-items: center; /* 그룹 요소를 수직 중앙 정렬 */
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
     <div id="app">
        <header>
            <div class="system-bar">
                <img src="${pageContext.request.contextPath}/resources/css/Logo.png"
             height="150" width="130">
            </div>
        </header>
        <div class="page">
            <div id="content">
            
            <c:if test="${empty user or empty clubs}">
	            <div id="not-logged-in">
	            	<h2>내 그룹방</h2>
	                <p>아직 가입된 그룹방이 없어요!</p>
	                <c:choose>
	                	<c:when test="${not empty user}">
	                		<button class="button"  onclick="location.href='<c:url value="/views/"/>'">그룹방 찾기</button>
	                	</c:when>
	                	<c:otherwise>
	                		<button class="button" onclick="findGroup()">그룹방 찾기</button>
	                	</c:otherwise>
	                </c:choose>
	            </div>
            </c:if>
            
            <div id="logged-in">
                    <h2>내 그룹방</h2>
                    <c:forEach var="club" items="${clubs}">
	                    <div class="group">
	                        <div class="group-box">
	                            <img src="${pageContext.request.contextPath}/resources/imgs/${club.img}" alt="그룹방 아이콘">
	                            <div class="group-info">
	                            	<a href="<c:url value='/views/club/${club.clid}' />">
	                                	<strong>${club.title}</strong>
	                                </a>
	                                <input type="text" value="공지사항: ${club.notice}" readonly>
	                            </div>
	                        </div>
	                    </div>
                    </c:forEach>
                </div>
            </div>
            
        </div>
    </div>
    <script>
        function checkLogin() {
            const isLoggedIn = false;

            if (isLoggedIn) {
                document.getElementById('not-logged-in').style.display = 'none';
                document.getElementById('logged-in').style.display = 'block';
            } else {
                document.getElementById('not-logged-in').style.display = 'block';
                document.getElementById('logged-in').style.display = 'none';
            }
        }

        function findGroup() {
            alert('로그인 해주세요.');
            window.location.href = "<c:url value='/views/users/profile'/>";
        }

        window.onload = checkLogin;
    </script>
    <c:import url="navbar.jsp"></c:import>
    <c:if test="${not empty user}">
    	<c:import url="chatbutton.jsp"></c:import>
    </c:if>
</body>
</html>
