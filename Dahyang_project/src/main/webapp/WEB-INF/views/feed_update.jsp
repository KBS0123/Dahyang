<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/feedwrite.css" rel="stylesheet" type="text/css">
<title>피드 관리</title>
<script type="text/javascript">
   function readURL(input) {
      var file = input.files[0]; 
      console.log(file);
      if (file !== undefined) {
         var reader = new FileReader();
         reader.readAsDataURL(file);
         reader.onload = function (e) { 
            console.log(e.target);
            console.log(e.target.result);
            $('#preview').attr('src', e.target.result);
         };
      }
  }  
</script>
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
                <div class="profile-pic">
                	<img alt="123" src="${pageContext.request.contextPath}/resources/imgs/${feed.uimg}">
                </div>
                <span class="nickname">${feed.writer}</span>
            </div>
	        <!-- 내용 작성 폼 -->
	        <div class="form-container">
	            <form action="<c:url value='/views/club/${clid}/feed/update'/>" method="post" enctype="multipart/form-data">
	            	<!-- 이미지 등록 버튼 -->
		            <div class="image-placeholder">
		                <div class="file-upload-wrapper">
		                    <input type="file" id="img" name="img" accept="image/*" onchange="readURL(this);">
		                    <label for="img">+</label>
		                </div>
		            </div>
	                <textarea id="content" name="content" placeholder="내용을 입력하세요"></textarea>
	                <input type="hidden" id="fid" name="fid" value="${feed.fid}">
	                <input type="hidden" id="clid" name="clid" value="${feed.clid}">
					<input type="hidden" id="uid" name="uid" value="${user.uid}">
					<input type="hidden" id="writer" name="writer" value="${feed.writer}">
					<input type="hidden" id="uimg" name="uimg" value="${feed.uimg}">
					<input type="hidden" id="likes" name="likes" value="0">
					<button type="submit">수정하기</button>
	            	<button type="button" onclick="location.href='<c:url value="/views/club/${clid}/feed/delete/${fid}"/>'">삭제하기</button>
	            </form>
	        </div>
        </div> 
    </div>
</div>
</body>
</html>