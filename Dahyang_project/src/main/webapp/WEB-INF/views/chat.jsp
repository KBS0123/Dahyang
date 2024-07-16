<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채팅 페이지</title>
    <link href="${pageContext.request.contextPath}/resources/css/groupfeed.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
        }
        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #f4511e;
            color: white;
            padding: 10px 20px;
        }
        .header .back-button {
            background: none;
            border: none;
            color: white;
            font-size: 20px;
        }
        .header .center-text {
            font-size: 24px;
        }
        .page {
            display: flex;
            flex-direction: column;
            height: calc(100% - 60px); /* Adjust according to header/footer height */
        }
        .content {
            flex: 1;
            display: flex;
            flex-direction: column;
            padding: 20px;
            background-color: #f0f0f0;
        }
        #chat-box {
            flex: 1;
            overflow-y: auto; /* 스크롤 바 추가 */
            background-color: #f0f0f0;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px;
            max-height: 400px; /* 최대 높이 설정 */
            display: flex;
            flex-direction: column;
        }
        .chat-item {
            display: flex; /* Flexbox 사용 */
            align-items: center; /* 중앙 정렬 */
            padding: 10px;
            margin-bottom: 10px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            color: black; /* 텍스트 색상을 검정색으로 설정 */
            max-width: 60%; /* 메시지의 최대 너비를 설정 */
            word-wrap: break-word;
        }
        .chat-item img {
            border-radius: 50%; /* 원형 이미지 */
            width: 40px; /* 이미지 너비 */
            height: 40px; /* 이미지 높이 */
            margin-right: 10px; /* 텍스트와의 간격 */
        }
        .chat-item.right {
            align-self: flex-end;
            background-color: #d4edda; /* 로그인한 사용자의 메시지 배경색 */
        }
        .chat-item.left {
            align-self: flex-start;
            background-color: #e9e9e9; /* 다른 사용자의 메시지 배경색 */
        }
        .form-container {
            display: flex;
            padding: 10px;
            background-color: white;
            border-top: 1px solid #ccc;
        }
        .form-container textarea {
            flex: 1;
            resize: none;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-right: 10px;
        }
        .form-container button {
            background-color: #f4511e;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<main>
    <!-- 상단바 -->
    <header class="header">
        <button class="back-button" onclick="location.href='<c:url value="/views/club/${clid}"/>'">
            <svg viewBox="0 0 24 24">
              <path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"/>
            </svg>
        </button>
        <div class="center-text">그룹 채팅</div>
        <span class="ion-navicon"></span>
    </header>
    <!-- 상단바 -->
    
    <!-- 네비게이션 바 추가 -->
    <c:import url="navbar2.jsp"></c:import>
    <!-- 네비게이션 바 추가 끝 -->
    
    <!-- 내부 박스 -->
    <div class="page">
        <div class="content">
            <div id="chat-box">
                <c:forEach var="chat" items="${chatList}">
                    <c:set var="alignClass" value="${chat.uid == sessionScope.user.uid ? 'right' : 'left'}" />
                    <div class="chat-item ${alignClass}">
                        <!-- 사용자 이미지 추가 -->
                        <img src="${pageContext.request.contextPath}/resources/imgs/${chat.uimg}" alt="User Image">
                        <div>
                            <div>${chat.nickname}</div>
                            <div>${chat.content}</div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <!-- 새 채팅 작성 -->
            <div class="form-container">
                <form id="chat-form" action="${pageContext.request.contextPath}/views/club/${clid}/chat/send" method="post">
                    <textarea name="content" placeholder="메시지를 입력하세요..." rows="3"></textarea>
                    <button type="submit">Send</button>
                </form>
            </div>
        </div>
    </div>

    <!-- SSE 이벤트 -->
    <script>
        const clid = ${clid};
        const chatBox = document.getElementById('chat-box');
        const eventSource = new EventSource('${pageContext.request.contextPath}/views/club/' + clid + '/chat/stream');

        function scrollToBottom() {
            chatBox.scrollTop = chatBox.scrollHeight;
        }

        eventSource.onmessage = function(event) {
            const message = JSON.parse(event.data);
            const alignClass = message.uid == ${sessionScope.user.uid} ? 'right' : 'left';
            const newMessage = document.createElement('div');
            newMessage.className = 'chat-item ' + alignClass;

            // 사용자 이미지 추가
            newMessage.innerHTML = `
                <img src="${pageContext.request.contextPath}/resources/imgs/${message.uimg}" alt="User Image">
                <div>
                    <div>${message.nickname}</div>
                    <div>${message.content}</div>
                </div>
            `;
            chatBox.appendChild(newMessage);
            scrollToBottom();
         // 페이지 새로고침
            location.reload();
        };

        document.getElementById('chat-form').onsubmit = function() {
            const textarea = this.querySelector('textarea');
            if (textarea.value.trim() === '') {
                return false;
            }
            setTimeout(() => {
                textarea.value = ''; // 메시지 전송 후 텍스트박스 비우기
                scrollToBottom();    // 메시지 전송 후 스크롤을 맨 아래로 이동
            }, 50);
            return true;
        };

        document.querySelector('textarea').addEventListener('keypress', function (e) {
            if (e.key === 'Enter' && !e.shiftKey) {
                e.preventDefault();
                document.getElementById('chat-form').submit();
            }
        });

        // 페이지 로드 시 최하단으로 스크롤
        window.onload = scrollToBottom;
    </script>
</main>
</body>
</html>
