<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chat button</title>
<link href="${pageContext.request.contextPath}/resources/css/chatbutton.css" rel="stylesheet" type="text/css">
</head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<!-- 채팅방 생성 아이콘 -->
<div class="chat-icon">
  <a href="<c:url value='/views/club/write'/>">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="32" height="32" class="icon">
      <path fill="#FFFFFF" d="M12,2C6.48,2,2,6.48,2,12s4.48,10,10,10s10-4.48,10-10S17.52,2,12,2z M16.5,13h-4v4h-1v-4h-4v-1h4v-4h1v4h4V13z"/>
    </svg>
  </a>
</div>

</body>
</html>
