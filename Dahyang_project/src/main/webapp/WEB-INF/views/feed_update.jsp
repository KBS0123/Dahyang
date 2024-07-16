<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/feedwrite.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>피드 관리</title>
<script type="text/javascript">
   function readURL(input, previewId) {
      var file = input.files[0]; 
      if (file !== undefined) {
         var reader = new FileReader();
         reader.readAsDataURL(file);
         reader.onload = function (e) { 
            $('#' + previewId).attr('src', e.target.result);
            $('#' + previewId).css('display', 'block');
            $('#' + previewId).removeAttr('alt'); // alt 속성 제거
         };
      }
  }
  
  function addFileInput() {
      var inputCount = $('.file-upload-wrapper').length + 1;
      var newInput = `
          <div class="file-upload-wrapper">
              <input type="file" id="img${inputCount}" name="img[]" accept="image/*" onchange="readURL(this, 'preview${inputCount}');">
              <img id="preview${inputCount}" src="#" alt="Image Preview" style="display:none;">
              <label for="img${inputCount}">+</label>
          </div>`;
      $('#image-upload-container').append(newInput); 
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
                	<c:choose>
						<c:when test="${not empty feed.uimg}">
							<img alt="123" src="${pageContext.request.contextPath}/resources/imgs/${feed.uimg}">
						</c:when>
						<c:otherwise>
							<img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png">
						</c:otherwise>
					</c:choose>
                </div>
                <span class="nickname">${feed.writer}</span>
            </div>
	        <!-- 내용 작성 폼 -->
	        <div class="form-container">
	            <form action="<c:url value='/views/club/${clid}/feed/update'/>" method="post" enctype="multipart/form-data">
	            	<!-- 이미지 등록 영역 -->
	                <div id="image-upload-container">
	                    <div class="file-upload-wrapper">
	                        <input type="file" id="img1" name="img[]" accept="image/*" onchange="readURL(this, 'preview1');">
	                        <img id="preview1" src="#" alt="Image Preview" style="display:none;">
	                        <label for="img1">+</label>
	                    </div>
	                </div>
	                <button type="button" onclick="addFileInput()">이미지 추가</button>
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