<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>그룹방(로그인시)</title>
    <link href="${pageContext.request.contextPath}/resources/css/grouplist.css" rel="stylesheet" type="text/css">
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
            <div id="logged-in">
                    <h2>내 그룹방</h2>
                    <div class="group">
                        <div class="group-box">
                            <img src="https://via.placeholder.com/50" alt="그룹방 아이콘">
                            <div class="group-info">
                                <strong>그룹방 이름</strong>
                                <input type="text" value="공지사항" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="group">
                        <div class="group-box">
                            <img src="https://via.placeholder.com/50" alt="그룹방 아이콘">
                            <div class="group-info">
                                <strong>그룹방 이름</strong>
                                <input type="text" value="공지사항" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="group">
                        <div class="group-box">
                            <img src="https://via.placeholder.com/50" alt="그룹방 아이콘">
                            <div class="group-info">
                                <strong>그룹방 이름</strong>
                                <input type="text" value="공지사항" readonly>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/views/nav2.jsp" />
    <jsp:include page="/views/chatbutton.jsp" />
</body>
</html>
