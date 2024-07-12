<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath}/resources/css/group.css" rel="stylesheet" type="text/css">
<title>그룹방 생성</title>
<style type="text/css">
        .content::-webkit-scrollbar {
    	display: none;
    	}
        .content {
            padding: 5px; /* 콘텐츠 여백 설정 */
            height: 700px;
            max-height: 900px;
            overflow-y: auto;
            
        }
  
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
            padding: 20px;
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
      height: 30px;
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
	
	    .group-name {
	        flex: 1; /* 남은 공간 모두 차지 */
	        text-align: center; /* 가운데 정렬 */
	    }
	    
	     .svg-icon {
            width: 30px;
            height: 30px;
            filter: brightness(0) invert(1); /*아이콘 색상 변경*/
        }
</style>
</head>
<body>
    <div class="container">
        <div class="navbar">
            
            <!-- 뒤로가기 버튼 -->
          <button class="back-button" onclick="history.back()">
            <svg viewBox="0 0 24 24">
              <path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"/>
            </svg>
          </button>
            <span class="group-name">그룹방 생성</span>
          
          <!-- 톱니바퀴 버튼 추가 -->
            <button class="settings-button">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M0 0h24v24H0z" fill="none"/>
                    <img src="${pageContext.request.contextPath}/resources/css/setting icon.svg" class="svg-icon">
            </button>
            
        </div>
        <div class="content">
        	<p align="center" style="opacity: 0.4;">※주의※<br>
            그룹방 생성시 월 5,000원의 이용 요금이 부과됩니다.</p>
            <!-- 이미지 업로드 부분 -->
            <div class="image-placeholder">
                <form action="${pageContext.request.contextPath}/uploadImage" method="post" enctype="multipart/form-data">
                    <div class="file-upload-wrapper">
                        <input type="file" id="imageUpload" name="image" accept="image/*">
                        <label for="imageUpload">+</label>
                    </div>
                </form>
            </div>
            <!-- 이미지 업로드 부분 -->
          
            <!-- 그룹방 정보 입력 폼 -->
            <div class="form-container">
                <h3>그룹방 정보 입력(필수)</h3>
                <form action="${pageContext.request.contextPath}/submitGroupInfo" method="post">
                    <label for="groupName">그룹방 이름:</label>
                    <input type="text" id="groupName" name="groupName" required>
                    
                    <label for="groupDescription">그룹방 설명:</label>
                    <textarea id="groupDescription" name="groupDescription" required></textarea>
                    
                    <label for="groupNotice">공지글:</label>
                    <textarea id="groupNotice" name="groupNotice"></textarea>
                    
                    <input type="submit" value="만들기">
                </form>
            </div>
        </div>
    </div>
  
</body>
</html>
