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
        function connectSSE(clid) {
            const eventSource = new EventSource('${pageContext.request.contextPath}/chat/stream/' + clid);
            eventSource.onmessage = function(event) {
                showMessage(JSON.parse(event.data).content);
            };
        }

        function sendMessage() {
            const messageContent = document.getElementById('message').value;
            fetch('${pageContext.request.contextPath}/chat/send?userId=1&clid=1&content=' + encodeURIComponent(messageContent), {
                method: 'POST'
            });
        }

        function showMessage(message) {
            const messages = document.getElementById('messages');
            const messageElement = document.createElement('div');
            messageElement.innerText = message;
            messages.appendChild(messageElement);
        }

        connectSSE(1); // Assuming clid is 1
    </script>
</body>
</html>
