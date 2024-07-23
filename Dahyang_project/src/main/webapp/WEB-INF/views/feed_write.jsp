<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath}/resources/css/feedwrite.css" rel="stylesheet" type="text/css">
<title>피드 등록</title>
<style>
    .slider {
        width: 100%;
        height: 200px;
        position: relative;
        overflow: hidden;
        display: none;
    }
    .inner-slider {
        display: flex;
        gap: 10px;
        position: absolute;
        top: 0;
        left: 0;
        transition: left 0.2s ease-in-out;
    }
    .item {
        height: 200px;
        width: 200px;
        border-radius: 5px;
        background-color: lightgrey;
    }
    .item img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        border-radius: 5px;
    }
    .form-container button { /*수정 삭제 버튼*/
          display: inline-block;
          width: auto;
          padding: 10px 40px;
          margin-right: 30px;
          margin-left: 38%;
          background-color: #28a745;
          color: #fff;
          border: none;
          border-radius: 5px;
          font-size: 16px;
          cursor: pointer;
      }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    $('#imageUpload').change(function() {
        var input = this;
        var files = input.files;
        var previewContainer = $('.inner-slider');
        previewContainer.empty();

        if (files && files.length) {
            $('.slider').css('display', 'block');
            for (var i = 0; i < files.length; i++) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    var img = $('<div class="item"><img src="' + e.target.result + '"></div>');
                    previewContainer.append(img);
                };
                reader.readAsDataURL(files[i]);
            }
            // 이미지 추가 후 슬라이더 초기화
            initSlider();
        } else {
            $('.slider').css('display', 'none');
        }
    });

    // 슬라이더 초기화 함수
    function initSlider() {
        var innerSlider = $('.inner-slider');
        var items = $('.item');
        var totalWidth = items.length * (items.outerWidth(true) + 10); // 간격 포함

        innerSlider.css('width', totalWidth + 'px');
    }

    $('.form-container form').submit(function(event) {
        event.preventDefault(); // 폼 제출 방지 (예시용)
        var content = $(this).find('textarea[name="content"]').val();
        var images = [];
        $('.inner-slider .item img').each(function() {
            images.push($(this).attr('src'));
        });
        console.log('Content:', content);
        console.log('Images:', images);
        // AJAX 또는 실제 제출 로직을 여기에 추가
    });
});
</script>
</head>
<body>
<div id="app">

    <!-- 상단바 -->
	<header>
		<div class="left">
	     <button class="back-button" onclick="location.href='<c:url value="/views/club/${clid}/feed"/>'">
	        <svg viewBox="0 0 24 24" width="26" height="24">
	          <path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"/>
	        </svg>
	    </button>
	   </div>
	   <span style= "margin-left: 10px; font-weight: bold; color: white; font-size: 20px;">피드 등록</span>
	   <div class="right">
	  	  </div>
	</header>
	<!-- 상단바 -->
<div class="page">
    <div class="content">
        <div class="feed-item">
            <div class="feed-header">
                <div class="profile-pic">
                	<c:choose>
                        <c:when test="${not empty user.images}">
                            <img alt="Profile Image" src="${pageContext.request.contextPath}/resources/imgs/${user.images}">
                        </c:when>
                        <c:otherwise>
                            <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png">
                        </c:otherwise>
                    </c:choose>
                </div>
                <span class="nickname">${user.nickname}</span>
            </div>
            <form action="<c:url value='/views/club/${clid}/feed/write'/>" method="post" enctype="multipart/form-data">
                <div class="image-placeholder">
				    <div class="file-upload-wrapper">
				        <input type="file" id="imageUpload" name="img[]" accept="image/*" multiple>
				        <label for="imageUpload">+</label>
				    </div>
				    <div class="slider">
				        <div class="inner-slider"></div>
				    </div>
				</div>
                <div class="form-container">
                    <textarea name="content" placeholder="내용을 입력하세요"></textarea>
                    <input type="hidden" id="clid" name="clid" value="${clid}">
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
</div>
</body>
</html>