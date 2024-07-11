<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>피드 페이지</title>
    <link href="${pageContext.request.contextPath}/resources/css/groupfeed.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="container">
        <div class="navbar">
        	<a href="<c:url value='/views/club/${clid}/'/>">
            	<span class="back-arrow">&lt;</span>
            </a>
            <span class="group-name">그룹방 이름</span>
            <a href="<c:url value='/views/club/${clid}/feed/write'/>">
            	<span class="settings">&#9881;</span>
            </a>
        </div>
        
        <div class="content">
            <div class="feed">
            	<c:forEach var="feed" items="${feeds}">
            		<div class="feed-item">
            			<a href="<c:url value='/views/club/${clid}/feed/${feed.fid}' />">
		                    <div class="image-placeholder">
		                    	${feed.img}
		                    </div>
	                    </a>
	                    <p class="feed-text">${feed.content}</p>
	                </div>
		         </c:forEach>
            </div>
        </div>
        
        <div class="footer">
            <span>소개</span>
            <span class="active">피드</span>
            <span>채팅</span>
        </div>
    </div>
</body>
</html>
