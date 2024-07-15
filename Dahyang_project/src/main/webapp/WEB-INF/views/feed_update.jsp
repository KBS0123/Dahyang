<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/feedwrite.css" rel="stylesheet" type="text/css">
<title>피드 관리</title>
</head>
<body>
<div class="container">
    <div class="navbar">
        <!-- 뒤로 가기 버튼 SVG -->
        <div class="back-button" onclick="javascript:history.back()">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 22" width="26" height="24">
                <path fill="#fff" d="M20 11H7.414l3.293-3.293a1 1 0 0 0-1.414-1.414l-5 5a1 1 0 0 0 0 1.414l5 5a1 1 0 0 0 1.414-1.414L7.414 13H20a1 1 0 0 0 0-2z"/>
            </svg>
        </div>
        <!-- 뒤로 가기 버튼 SVG -->
        <span style="margin-left: 10px;">피드관리</span>
    </div>
    
    <div class="content">
        <div class="feed-item">
            <div class="feed-header">
                <div class="profile-pic"></div>
                <span class="nickname">닉네임</span>
            </div>
          <!-- 이미지 등록 버튼 -->
            <div class="image-placeholder">
                <form action="${pageContext.request.contextPath}/uploadImage" method="post" enctype="multipart/form-data">
                    <div class="file-upload-wrapper">
                        <input type="file" id="imageUpload" name="image" accept="image/*">
                        <label for="imageUpload">+</label>
                    </div>
                 </div>
              <!-- 내용 작성 폼 -->
        <div class="form-container">
            <form action="${pageContext.request.contextPath}/uploadContent" method="post">
                <textarea name="content" placeholder="내용을 입력하세요"></textarea>
                <button type="submit" formaction="${pageContext.request.contextPath}/updateContent">수정하기</button>
				<button type="submit" formaction="${pageContext.request.contextPath}/deleteContent">삭제하기</button>
                
            </form>
        </div>
            </div> 
    </div>
</div>
</body>
</html>