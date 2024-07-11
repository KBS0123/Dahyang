<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chat</title>
</head>
<body>
    <div>
        <input type="text" id="message" placeholder="Enter message" />
        <button onclick="sendMessage()">Send</button>
    </div>
    <div id="messages"></div>

    <script>
        const contextPath = '<%= request.getContextPath() %>';
        const userId = <%= request.getAttribute("userId") %>;
        const clid = <%= request.getParameter("clid") %>;

        function connectSSE(clid) {
            const eventSource = new EventSource(contextPath + '/chat/stream/' + clid);
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

            fetch(contextPath + '/chat/send?userId=' + userId + '&clid=' + clid + '&content=' + encodeURIComponent(messageContent), {
                method: 'POST'
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
            messageElement.innerText = message;
            messages.appendChild(messageElement);
        }

        connectSSE(clid);
    </script>
</body>
</html>
