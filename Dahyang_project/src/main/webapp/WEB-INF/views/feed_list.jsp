<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>�ǵ� ������</title>
    <link href="${pageContext.request.contextPath}/resources/css/groupfeed.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="container">
        <div class="navbar">
        	<a href="<c:url value='/views/club/${clid}/'/>">
            	<span class="back-arrow">&lt;</span>
            </a>
            <span class="group-name">�׷�� �̸�</span>
            <a href="<c:url value='/views/club/${clid}/feed/write'/>">
            	<span class="settings">&#9881;</span>
            </a>
        </div>
        
        <div class="content">
            <div class="feed">
                <div class="feed-item">
                    <div class="image-placeholder"></div>
                    <p class="feed-text">�ǵ� ����</p>
                </div>
                <div class="feed-item">
                    <div class="image-placeholder"></div>
                    <p class="feed-text">�ǵ� ����</p>
                </div>
                <div class="feed-item">
                    <div class="image-placeholder"></div>
                    <p class="feed-text">�ǵ� ����</p>
                </div>
                <div class=" feed-item">
                    <div class="image-placeholder"></div>
                    <p class="feed-text">�ǵ� ����</p>
                </div>
                <div class="feed-item">
                    <div class="image-placeholder"></div>
                    <p class="feed-text">�ǵ� ����</p>
                </div>
                <div class="feed-item">
                    <div class="image-placeholder"></div>
                    <p class="feed-text">�ǵ� ����</p>
                </div>
                <div class="feed-item">
                    <div class="image-placeholder"></div>
                    <p class="feed-text">�ǵ� ����</p>
                </div>
                <div class="feed-item">
                    <div class="image-placeholder"></div>
                    <p class="feed-text">�ǵ� ����</p>
                </div>
                <div class="feed-item">
                    <div class="image-placeholder"></div>
                    <p class="feed-text">�ǵ� ����</p>
                </div>
                <div class="feed-item">
                    <div class="image-placeholder"></div>
                    <p class="feed-text">�ǵ� ����</p>
                </div>
            </div>
        </div>
        
        <div class="footer">
            <span>�Ұ�</span>
            <span class="active">�ǵ�</span>
            <span>ä��</span>
        </div>
    </div>
</body>
</html>
