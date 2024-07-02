<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat Application</title>
</head>
<body>
    <h1>Chat Application</h1>

    <div>
        <h2>Create Chat Room</h2>
        <input type="text" id="roomName" placeholder="Room Name">
        <button onclick="createRoom()">Create Room</button>
    </div>

    <div>
        <h2>Chat Rooms</h2>
        <ul id="roomList">
            <!-- JSP 코드로 반복문을 사용하여 채팅방 목록을 출력 -->
            <c:forEach items="${rooms}" var="room">
                <li onclick="loadChatRoom(${room.id}, '${room.name}')">${room.name}</li>
            </c:forEach>
        </ul>
    </div>

    <div id="chatSection" style="display:none;">
        <h2>Chat Room: <span id="roomTitle"></span></h2>
        <div id="chatMessages">
            <!-- JSP 코드로 반복문을 사용하여 채팅 메시지 출력 -->
            <c:forEach items="${messages}" var="message">
                <div>${message.sender}: ${message.message}</div>
                <c:if test="${message.imageUrl ne null}">
                    <img src="${message.imageUrl}" style="width:100px;">
                </c:if>
            </c:forEach>
        </div>
        <form id="sendMessageForm" enctype="multipart/form-data">
            <input type="hidden" id="roomTitleHidden" name="roomTitle" value="">
            <input type="text" id="sender" name="sender" placeholder="Sender">
            <input type="email" id="senderEmail" name="senderEmail" placeholder="Sender Email">
            <input type="text" id="message" name="message" placeholder="Message">
            <input type="file" id="image" name="image">
            <button type="button" onclick="sendMessage()">Send Message</button>
        </form>
    </div>

    <script>
        async function createRoom() {
            const roomName = document.getElementById('roomName').value;
            const response = await fetch('/chats/rooms', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ name: roomName })
            });
            if (response.ok) {
                loadRooms();
            }
        }

        async function loadRooms() {
            const response = await fetch('/chats/rooms');
            const rooms = await response.json();
            const roomList = document.getElementById('roomList');
            roomList.innerHTML = '';
            rooms.forEach(room => {
                const li = document.createElement('li');
                li.textContent = room.name;
                li.onclick = () => loadChatRoom(room.id, room.name);
                roomList.appendChild(li);
            });
        }

        async function loadChatRoom(roomId, roomName) {
            document.getElementById('chatSection').style.display = 'block';
            document.getElementById('roomTitle').textContent = roomName;
            document.getElementById('roomTitleHidden').value = roomName;

            const response = await fetch(`/chats/rooms/${roomId}/chats`);
            const messages = await response.json();
            const chatMessages = document.getElementById('chatMessages');
            chatMessages.innerHTML = '';
            messages.forEach(message => {
                const div = document.createElement('div');
                div.textContent = `${message.sender}: ${message.message}`;
                if (message.imageUrl) {
                    const img = document.createElement('img');
                    img.src = message.imageUrl;
                    img.style.width = '100px';
                    div.appendChild(img);
                }
                chatMessages.appendChild(div);
            });
        }

        async function sendMessage() {
            const formData = new FormData(document.getElementById('sendMessageForm'));
            const response = await fetch('/chats/create', {
                method: 'POST',
                body: formData
            });
            if (response.ok) {
                loadChatRoom(0, document.getElementById('roomTitleHidden').value);
            }
        }

        loadRooms();
    </script>
</body>
</html>
