<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath}/resources/css/group.css" rel="stylesheet" type="text/css">
<title>그룹방 관리(방장)</title>
<script type="text/javascript">
function readURL(input) {
    var file = input.files[0];
    if (file) {
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function (e) {
            var preview = document.getElementById('preview');
            preview.src = e.target.result;
            preview.style.display = 'block';
        };
    }
}
</script>
<style>

.image-placeholder {
            position: relative;
            width: 95%;
            margin: 0 auto; /* 중앙 정렬 */
            height: 300px; 
            background-color: #f0f0f0;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 20px;
            display: flex;
            align-items: flex-end;
            justify-content: flex-end;
            padding: 10px;
            box-sizing: border-box;
        }

        .file-upload-wrapper {
            position: relative;
        }

        .file-upload-wrapper input[type="file"] {
            display: none;
        }

        .file-upload-wrapper label {/*사진등록 버튼 디자인*/
            display: inline-block;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #28a745;
            color: white;
            font-size: 24px;
            line-height: 40px;
            text-align: center;
            cursor: pointer;
        }
        
	    .form-container {
	    position: relative; /* 상대적 위치 설정 */
	    background-color: #fff;
	    padding: 30px;
	    border-radius: 5px;
	    margin-top:-5px;
	    margin-bottom: 10px; /* 하단 여백 추가 */
	    width: 80%; /* 폭 설정 */
	    max-width: 700px; /* 최대 폭 설정 */
	    margin-left: auto; /* 가운데 정렬을 위한 자동 마진 설정 */
	    margin-right: auto; /* 가운데 정렬을 위한 자동 마진 설정 */
	}
	
	    .form-container h3 {
	        font-size: 20px;
	        margin-bottom: 10px;
	    }
	
	    .form-container label {
	        display: block;
	        margin-bottom: 8px;
	        font-weight: bold;
	    }
	
	    .form-container input[type=text],
	    .form-container textarea {
	        width: 100%;
	        padding: 10px;
	        margin-bottom: 15px;
	        border: 1px solid #ccc;
	        border-radius: 4px;
	        box-sizing: border-box;
	    }
	
	    .form-container textarea {
	        height: 60px; /* textarea 높이 설정 */
	    }
	
	    .form-container input[type=submit] {
	        background-color: #4CAF50;
	        color: white;
	        padding: 12px 20px;
	        border: none;
	        border-radius: 4px;
	        cursor: pointer;
	    }
	
	    .form-container input[type=submit]:hover {
	        background-color: #45a049;
	    }
	  .navbar {
	        display: flex;
	        align-items: center; /* 세로 중앙 정렬 */
	    }
	
	    .back-arrow {
	        margin-right: 10px; /* 뒤로가기 화살표 오른쪽 여백 */
	    }
	
	    .group-name {
	        flex: 1; /* 남은 공간 모두 차지 */
	        text-align: center; /* 가운데 정렬 */
	    }
</style>
</head>
<body>
    <div id="app">
    
        <!-- 상단바 -->
		<header>
			<div class="left">
		     <button class="back-button" onclick="history.back()">
		        <svg viewBox="0 0 24 24" width="26" height="24">
		          <path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"/>
		        </svg>
		    </button>
		   </div>
		   <span style= "margin-left: 10px; font-weight: bold; color: white; font-size: 20px;">그룹방 수정</span>
		   <div class="right">
		   </div>
		</header>
		<!-- 상단바 -->
        
    <div class="page">
        <div class="content">
            <!-- 그룹방 정보 입력 폼 -->
            <div class="form-container">
                <h3>그룹방 정보</h3>
                <form action="<c:url value='/views/club/update'/>" method="post" enctype="multipart/form-data">
                	<!-- 이미지 업로드 부분 -->
		            <div class="image-placeholder">
		            	<img id="preview" src="" alt="이미지 미리보기" style="display:none; width: 100%; height: 100%; object-fit: cover;"/>
		                <div class="file-upload-wrapper">
		                    <input type="file" id="img" name="img" accept="image/*" onchange="readURL(this);">
		                    <label for="img">+</label>
		                </div>
		            </div>
                    <label for="text">그룹방 이름:</label>
                    <input type="text" id="title" name="title" required>
                    
                    <label for="content">그룹방 설명:</label>
                    <textarea id="content" name="content" required></textarea>
                    
                    <label for="notice">공지글:</label>
                    <textarea id="notice" name="notice"></textarea>
                    <input type="hidden" id="clid" name="clid" value="${club.clid}">
                    <input type="hidden" id="uid" name="uid" value="${user.uid}">
                    <input type="submit" value="등록">
                </form>
            </div>
        </div>
    </div>
    </div>
</body>
</html>
