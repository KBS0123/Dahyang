<!DOCTYPE html>
<html>
<head>
    <title>Chat</title>
    <style>
        #messages {
            border: 1px solid #ccc;
            padding: 10px;
            height: 300px;
            overflow-y: scroll;
            margin-bottom: 10px;
        }
        .message {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div>
        <input type="text" id="message" placeholder="Enter message" />
        <button onclick="sendMessage()">Send</button>
    </div>
    <div id="messages">
        <!-- 기존 메시지들이 여기에 추가될 것입니다 -->
    </div>

    <script>
        const contextPath = '<%= request.getContextPath() %>';
        const uid = '<%= session.getAttribute("user") != null ? ((spring_Dahyang.user.model.User) session.getAttribute("user")).getUid() : "null" %>';
        const clid = '<%= request.getAttribute("clid") != null ? request.getAttribute("clid") : "null" %>';

        function connectSSE(clid) {
            const eventSource = new EventSource(contextPath + '/views/club/' + clid + '/chat/stream');
            eventSource.onmessage = function(event) {
                showMessage(JSON.parse(event.data).content);
            };
            eventSource.onerror = function(event) {
                console.error('EventSource failed:', event);
                eventSource.close();
            };
        }

        function sendMessage() {
            const messageContent = document.getElementById('message').value;
            if (!messageContent.trim()) {
                return; // 내용이 비어있으면 전송하지 않음
            }

            fetch(contextPath + '/views/club/' + clid + '/chat/send', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: new URLSearchParams({
                    content: messageContent
                })
            })
            .then(response => {
                if (response.ok) {
                    document.getElementById('message').value = ''; // 메시지 전송 후 입력란 비우기
                } else {
                    console.error('Message send failed:', response.statusText);
                }
            })
            .catch(error => {
                console.error('Error sending message:', error);
            });
        }

        function showMessage(message) {
            const messages = document.getElementById('messages');
            const messageElement = document.createElement('div');
            messageElement.className = 'message';
            messageElement.innerText = message;
            messages.appendChild(messageElement);
        }

        function loadMessages() {
            fetch(contextPath + '/views/club/' + clid + '/chat/messages')
            .then(response => response.json())
            .then(data => {
                data.forEach(message => {
                    showMessage(message.content);
                });
            })
            .catch(error => {
                console.error('Error loading messages:', error);
            });
        }

        connectSSE(clid);
        loadMessages();
    </script>
</body>
</html>
