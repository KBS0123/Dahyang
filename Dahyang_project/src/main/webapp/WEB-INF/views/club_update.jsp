<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <div class="container">
        <div class="navbar">
            <span class="back-arrow">&lt;</span>
            <span class="group-name">그룹방 관리</span>
        </div>
        
        <div class="content">
            <!-- 이미지 업로드 부분 -->
            <div class="image-placeholder">
                <form action="${pageContext.request.contextPath}/uploadImage" method="post" enctype="multipart/form-data">
                    <div class="file-upload-wrapper">
                        <input type="file" id="imageUpload" name="image" accept="image/*">
                        <label for="imageUpload">+</label>
                    </div>
                </form>
            </div>
            
            <!-- 그룹방 정보 입력 폼 -->
            <div class="form-container">
                <h3>그룹방 정보</h3>
                <form action="${pageContext.request.contextPath}/submitGroupInfo" method="post">
                    <label for="groupName">그룹방 이름:</label>
                    <input type="text" id="groupName" name="groupName" required>
                    
                    <label for="groupDescription">그룹방 설명:</label>
                    <textarea id="groupDescription" name="groupDescription" required></textarea>
                    
                    <label for="groupNotice">공지글:</label>
                    <textarea id="groupNotice" name="groupNotice"></textarea>
                    <input type="hidden" class="form-control" id="uid" name="uid" value="${user.uid}">
                    <input type="submit" value="등록">
                </form>
            </div>
        </div>
    </div>
</body>
</html>
