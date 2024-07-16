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
            } else {
                $('.slider').css('display', 'none');
            }
        });

        $('.form-container form').submit(function(event) {
            event.preventDefault(); // 폼 제출 방지 (예시용)
            var content = $(this).find('textarea[name="content"]').val();
            var images = [];
            $('.inner-slider .item img').each(function() {
                images.push($(this).attr('src'));
            });
            console.log('Content:', content);
            console.log('Images:', images);
            // 여기에 AJAX 또는 실제 제출 로직 구현
        });
    });
</script>
</head>
<body>
<div class="container">
    <div class="navbar">
        <div class="back-button" onclick="javascript:history.back()">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 22">
                <path fill="#fff" d="M20 11H7.414l3.293-3.293a1 1 0 0 0-1.414-1.414l-5 5a1 1 0 0 0 0 1.414l5 5a1 1 0 0 0 1.414-1.414L7.414 13H20a1 1 0 0 0 0-2z"/>
            </svg>
        </div>
        <span style="margin-left: 10px;">피드</span>
    </div>
    
    <div class="content">
        <div class="feed-item">
            <div class="feed-header">
                <div class="profile-pic"></div>
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
</body>
</html>