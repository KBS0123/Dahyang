<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat Room</title>
    <style>
        /* 스타일링은 간단하게 */
        .chat-container {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
            height: 300px;
            overflow-y: scroll;
        }
        .chat-message {
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
    <h2>Chat Room</h2>
    <div class="chat-container" id="chatContainer">
        <!-- 서버에서 전달된 채팅 메시지 표시 -->
        <c:forEach var="message" items="${messages}">
            <div class="chat-message">${message.sender}: ${message.content}</div>
        </c:forEach>
    </div>
    <form id="chatForm" action="${pageContext.request.contextPath}/chat/send" method="post">
        <input type="text" name="sender" placeholder="Your Name">
        <input type="text" name="content" placeholder="Type your message">
        <button type="submit">Send</button>
    </form>

    <script>
        const chatContainer = document.getElementById('chatContainer');
        const chatForm = document.getElementById('chatForm');

        // 채팅 메시지가 추가될 때마다 화면에 표시
        function displayMessage(sender, content) {
            const div = document.createElement('div');
            div.classList.add('chat-message');
            div.textContent = `${sender}: ${content}`;
            chatContainer.appendChild(div);
            chatContainer.scrollTop = chatContainer.scrollHeight; // 맨 아래로 스크롤
        }

        // 폼 제출 시 새로운 메시지 서버로 전송하지 않고, 페이지 리로딩
        chatForm.addEventListener('submit', function(event) {
            event.preventDefault();
            const sender = chatForm.sender.value.trim();
            const content = chatForm.content.value.trim();
            if (sender && content) {
                displayMessage(sender, content);
                chatForm.reset();
            }
        });
    </script>
</body>
</html>
