<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/feedwrite.css" rel="stylesheet" type="text/css">
<title>피드 작성</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
<style>
    #preview {
        max-width: 100%;
        height: auto;
        max-height: 100%;
    }
</style>

</head>
<body>
<div class="container">
    <div class="navbar">
        <!-- 뒤로 가기 버튼 SVG -->
        <div class="back-button" onclick="location.href='<c:url value="/views/club/${clid}/feed"/>'">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 22" width="26" height="24">
                <path fill="#fff" d="M20 11H7.414l3.293-3.293a1 1 0 0 0-1.414-1.414l-5 5a1 1 0 0 0 0 1.414l5 5a1 1 0 0 0 1.414-1.414L7.414 13H20a1 1 0 0 0 0-2z"/>
            </svg>
        </div>
        <!-- 뒤로 가기 버튼 SVG -->
        <span style="margin-left: 10px;">피드 작성</span>
    </div>
    
    <div class="content">
        <div class="feed-item">
            <div class="feed-header">
                <div class="profile-pic">
                	<c:choose>
						<c:when test="${not empty user.images}">
							<img alt="123" src="${pageContext.request.contextPath}/resources/imgs/${user.images}">
						</c:when>
						<c:otherwise>
							<img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png">
						</c:otherwise>
					</c:choose>
                </div>
                <span class="nickname">닉네임</span>
            </div>
            
            <form action="<c:url value='/views/club/${clid}/feed/write'/>" method="post" enctype="multipart/form-data">
                <!-- 이미지 등록 영역 -->
                <div id="image-upload-container">
                    <div class="file-upload-wrapper">
                        <input type="file" id="img1" name="img[]" accept="image/*" onchange="readURL(this, 'preview1');">
                        <img id="preview1" src="#" alt="Image Preview" style="display:none;">
                        <label for="img1">+</label>
                    </div>
                </div>
                <button type="button" onclick="addFileInput()">이미지 추가</button>
                
                <!-- 내용 작성 폼 -->
                <div class="form-container">
                    <textarea name="content" id="content" placeholder="내용을 입력하세요"></textarea>
                    <input type="hidden" class="form-control" id="clid" name="clid" value="${clid}">
                    <input type="hidden" id="uid" name="uid" value="${user.uid}">
                    <input type="hidden" id="writer" name="writer" value="${user.nickname}">
                    <input type="hidden" id="uimg" name="uimg" value="${user.images}">
                    <input type="hidden" id="likes" name="likes" value="0">
                    <button type="submit">등록</button>
                </div>
            </form>
        </div> 
    </div>
</div>
</body>
</html>
