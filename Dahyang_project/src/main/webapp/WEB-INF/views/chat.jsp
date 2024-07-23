<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채팅</title>
    <link href="${pageContext.request.contextPath}/resources/css/chat.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
        }
        .page {
            display: flex;
            flex-direction: column;
            
        }
        .content {
		    flex: 1;
		    display: flex;
		    flex-direction: column;
		    padding: 20px;
		    background-color: white;
		    margin-top: 20px; /* 위로 20px 내림 */
		}
        #chat-box {
		    flex: 1;
		    overflow-y: auto; /* 스크롤 바 자동 표시 */
		    background-color: white;
		    padding: 20px;
		    border: white;
		    border-radius: 5px;
		    margin-bottom: 10px;
		    max-height: 500px; /* 최대 높이 설정 */
		    display: flex;
		    flex-direction: column;
		    width: 500px; /* 최대 가로 너비 설정 */
		}
		/* WebKit 브라우저에 대한 스크롤바 숨기기 */
		#chat-box::-webkit-scrollbar {
		    display: none;
		}
        .chat-item {
            padding: 10px;
            margin-bottom: 10px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            color: black; /* 텍스트 색상을 검정색으로 설정 */
            max-width: 50%; /* 메시지의 최대 너비를 설정 */
            word-wrap: break-word;
        }
        .chat-item.right {
            align-self: flex-end;
            background-color: #d4edda; /* 로그인한 사용자의 메시지 배경색 */
        }
        .chat-item.left {
            align-self: flex-start;
            background-color: #e9e9e9; /* 다른 사용자의 메시지 배경색 */
        }
        .user-profile {
		    display: flex;
		    align-items: center;
		}
		
		.user-profile img {
		    width: 40px;
		    height: 40px;
		    border-radius: 50%;
		    margin-right: 10px;
		}
        .form-container {
            display: flex;
            padding: 10px;
            background-color: white;
            border-top: 1px solid #ccc;
        }
        .form-container form {
		    display: flex;
		    flex: 1; /* 폼을 확장하여 내부 요소를 채우도록 함 */
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
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }
        .home-button {
		    display: inline-block;
		    width: 40px;
		    height: 40px;
		    background-color: #8dd95d;
		    border: none;
		    border-radius: 50%;
		    cursor: pointer;
		    position: absolute;
		    top: 35px;
		    left: 50px;
			display: flex;
		    justify-content: center;
		    align-items: center;
		}
		
		.home-button svg {
		    fill: #fff;
		    width: 30px;
		    height: 30px;
		}
    </style>
</head>
<body>
	<div id="app">
	    <!-- 상단바 -->
	    <header>
	    	<div class="left">
		        <!-- 홈 버튼 -->
		        <button class="home-button" onclick="location.href='<c:url value="/views/"/>'">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" id="home-icon">
					    <path
					        d="M13.1428571,14.5 C13.6571429,14.5 14,14.175507 14,13.6887676 L14,6.38767551 C14,6.14430577 13.9142857,5.90093604 13.6571429,5.73868955 L8.51428571,1.6825273 C8.17142857,1.43915757 7.74285714,1.43915757 7.4,1.6825273 L2.25714286,5.73868955 C2.08571429,5.90093604 2,6.14430577 2,6.38767551 L2,13.6887676 C2,14.175507 2.34285714,14.5 2.85714286,14.5 L13.1428571,14.5 Z M5.42857143,12.8775351 L3.71428571,12.8775351 L3.71428571,6.79329173 L8,3.38611544 L12.2857143,6.79329173 L12.2857143,12.8775351 L10.5714286,12.8775351 L5.42857143,12.8775351 Z">
					    </path>
					  </svg>
				</button>
			    <!-- 홈 버튼 -->
		      </div>
		      <span style= "margin-left: 10px; font-weight: bold; color: white; font-size: 20px;">그룹 채팅</span>
		      <div class="right">
		        <span class="ion-navicon"></span>
	      	</div>
	    </header>
	    <!-- 상단바 -->	    
	    <!-- 내부 박스 -->
	    <div class="page">
	        <div class="content">
	            <div id="chat-box">
	                <c:forEach var="chat" items="${chatList}">
	                    <c:set var="alignClass" value="${chat.uid == sessionScope.user.uid ? 'right' : 'left'}" />
	                    <div class="chat-item ${alignClass}">
	                        <div>
	                        	<c:if test="${alignClass == 'left'}">
			                       	<div class="user-profile">
					                    <c:choose>
											<c:when test="${not empty chat.uimg}">
												<img src="${pageContext.request.contextPath}/resources/imgs/${chat.uimg}">
											</c:when>
											<c:otherwise>
												<img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png">
											</c:otherwise>
										</c:choose>
										${chat.nickname}
									</div>
								</c:if>
		                        ${chat.content}
	                        </div>
	                    </div>
	                </c:forEach>
	            </div>
	            <!-- 새 채팅 작성 -->
	            <div class="form-container">
	                <form id="chat-form" action="${pageContext.request.contextPath}/views/club/${clid}/chat/send" method="post">
	                    <textarea name="content" placeholder="메시지를 입력하세요." rows="1" cols="45"></textarea>
	                    <button type="submit">Send</button>
	                </form>
	            </div>
	        </div>
	    </div>
	    <!-- 네비게이션 바 추가 -->
	    <c:import url="navbar2.jsp"></c:import>
	    <!-- 네비게이션 바 추가 끝 -->
	</div>
</body>
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
        newMessage.textContent = `${message.nickname}: ${message.content}`;
        chatBox.appendChild(newMessage);
        scrollToBottom();
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
</html>
