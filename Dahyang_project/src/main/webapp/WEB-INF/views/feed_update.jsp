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
<title>피드 수정</title>
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
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 22" width="26" height="24">
                <path fill="#fff" d="M20 11H7.414l3.293-3.293a1 1 0 0 0-1.414-1.414l-5 5a1 1 0 0 0 0 1.414l5 5a1 1 0 0 0 1.414-1.414L7.414 13H20a1 1 0 0 0 0-2z"/>
            </svg>
        </div>
        <span style="margin-left: 10px;">피드 수정</span>
    </div>
    
    <div class="content">
        <div class="feed-item">
            <div class="feed-header">
                <div class="profile-pic">
                    <c:choose>
                        <c:when test="${not empty feed.uimg}">
                            <img alt="Profile Image" src="${pageContext.request.contextPath}/resources/imgs/${feed.uimg}">
                        </c:when>
                        <c:otherwise>
                            <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png">
                        </c:otherwise>
                    </c:choose>
                </div>
                <span class="nickname">${feed.writer}</span>
            </div>
            	<form action="<c:url value='/views/club/${clid}/feed/update'/>" method="post" enctype="multipart/form-data">
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
	                <textarea id="content" name="content" placeholder="내용을 입력하세요">${feed.content}</textarea>
	                <input type="hidden" id="fid" name="fid" value="${feed.fid}">
	                <input type="hidden" id="clid" name="clid" value="${feed.clid}">
	                <input type="hidden" id="uid" name="uid" value="${user.uid}">
	                <input type="hidden" id="writer" name="writer" value="${feed.writer}">
	                <input type="hidden" id="uimg" name="uimg" value="${feed.uimg}">
	                <input type="hidden" id="likes" name="likes" value="0">
	                <button type="submit">수정하기</button>
	                <button type="button" onclick="location.href='<c:url value="/views/club/${clid}/feed/delete/${fid}"/>'">삭제하기</button>
	                </div>
	            </form>
        </div> 
    </div>
</div>
</body>
</html>