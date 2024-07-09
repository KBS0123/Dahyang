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
        .chat-box {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
            max-width: 500px;
        }
    </style>
</head>
<body>
    <h1>Chat Room</h1>
    <div id="chat-box">
        <!-- 여기에 채팅 메시지 출력 -->
    </div>
    
    <!-- 채팅 입력 폼 -->
    <form id="chat-form">
        <input type="text" id="content" name="content" placeholder="채팅을 입력하세요">
        <input type="submit" value="전송">
    </form>
    
    <!-- SSE 스크립트 -->
    <script>
        var eventSource = new EventSource('/chat/stream');
        
        eventSource.onmessage = function(event) {
            var message = JSON.parse(event.data);
            var chatBox = document.getElementById('chat-box');
            var chatMessageElement = document.createElement('div');
            chatMessageElement.classList.add('chat-box');
            chatMessageElement.textContent = message.nickname + ": " + message.content;
            chatBox.appendChild(chatMessageElement);
        };
        
        document.getElementById('chat-form').addEventListener('submit', function(event) {
            event.preventDefault();
            var content = document.getElementById('content').value;
            var senderId = 1; // 임시로 1번 사용자로 설정
            var clubId = 1; // 임시로 1번 모임방으로 설정
            
            fetch('/chat/send?senderId=' + senderId + '&clubId=' + clubId + '&content=' + content, {
                method: 'POST'
            }).then(function(response) {
                document.getElementById('content').value = '';
            });
        });
    </script>
</body>
</html>
