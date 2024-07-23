<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage(user profile)</title>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet" type="text/css">
  <style>
  #app > header .center-text {
    width: 100%;
    text-align: center;
    vertical-align: middle;
    font-size: 20px;
    line-height: 1.5;
    margin-right: 50px;
    margin-top: 30px;
}
    .profile-details {
    width: 350px;
    margin-top: 0px;
    padding: 20px;
    background-color: #f8f9fa;
    border-radius: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    text-align: center;
  }

  .profile-details label {
    font-weight: bold;
  }

  .profile-details p {
    margin-bottom: 10px;
  }

  .profile-details input[type="text"] {
    width: calc(50% - 16px); /* 두 개의 입력 필드를 한 줄에 나타내기 위해 너비를 조정합니다 */
    padding: 8px;
    margin: 8px 8px 8px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 14px;
    display: inline-block;
    box-sizing: border-box;
  }

  .profile-details button[type="submit"] {
    background-color: #75b64d;
    color: white;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    border-radius: 4px;
    font-size: 14px;
  }

  .profile-details button[type="submit"]:hover {
    background-color: #0056b3;
  }
    
  .profile-details form {
    margin-top: 20px;
  }
    
  </style>
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
</head>
<body>
  <div id="app">
      <header>
        <div class="system-bar"></div>
        <div class="left">
          <span class="ion-chevron-left"></span>
        </div>
         <!-- 뒤로가기 버튼 -->
          <div class="left">
			 <button class="back-button" onclick="history.back()">
				<svg viewBox="0 0 24 24" width="26" height="24">
				   <path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"/>
				 </svg>
				</button>
			 </div>
          <!-- 뒤로가기 버튼 -->
        <div class="center-text">프로필 수정</div>
        <div class="right">
          <span class="ion-navicon"></span>
        </div>
      </header>
      <!-- 상단바 -->
    
    <!--페이지 내용-->
    <div class="page">
      <div class="profile">
        <div class="profile-details">
          <form action="<c:url value='/views/users/profile_update'/>" method="post" enctype="multipart/form-data">
          	<c:choose>
                <c:when test="${not empty user.images}">
                    <div class="profile-img">
                        <img src="${pageContext.request.contextPath}/resources/imgs/${user.images}" id="preview">
                    </div>
                    <input type="file" id="img" name="img" accept="image/*" onchange="readURL(this);" style="display: none;">
                    <label for="img" class="custom-file-upload">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                            <path d="M12 2C11.45 2 11 2.45 11 3V11H3C2.45 11 2 11.45 2 12C2 12.55 2.45 13 3 13H11V21C11 21.55 11.45 22 12 22C12.55 22 13 21.55 13 21V13H21C21.55 13 22 12.55 22 12C22 11.45 21.55 11 21 11H13V3C13 2.45 12.55 2 12 2Z"/>
                        </svg>
                    </label>
                </c:when>
                <c:otherwise>
                    <div class="profile-img">
                        <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" id="preview">
                    </div>
                    <input type="file" id="img" name="img" accept="image/*" onchange="readURL(this);" style="display: none;">
                    <label for="img" class="custom-file-upload">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                            <path d="M12 2C11.45 2 11 2.45 11 3V11H3C2.45 11 2 11.45 2 12C2 12.55 2.45 13 3 13H11V21C11 21.55 11.45 22 12 22C12.55 22 13 21.55 13 21V13H21C21.55 13 22 12.55 22 12C22 11.45 21.55 11 21 11H13V3C13 2.45 12.55 2 12 2Z"/>
                        </svg>
                    </label>
                </c:otherwise>
            </c:choose>
            <p>
              <label for="name">닉네임:</label>
              <input type="text" id="nickname" name="nickname" placeholder="닉네임을 입력하세요">
            </p>
            <p>
              <label for="birthdate">생년월일:</label>
              <input type="text" id="birthday" name="birthday" placeholder="YYYYMMDD">
            </p>
            <input type="hidden" id="uid" name="uid" value="${user.uid}"/>
            <input type="hidden" id="images" name="images"/>
            <input type="hidden" id="email" name="email" value="${user.email}"/>
            <c:if test="${not empty error }">
			<div align="center">
	  			<span class="badge bg-danger" align="center" id="result">${error}</span>
				<br><br>
			</div>
		</c:if>
            <p>
              <button type="submit">저장</button>
            </p>
          </form>
        </div>
      </div>
    </div>
    <!--페이지 내용-->
  </div>
</body>
</html>
