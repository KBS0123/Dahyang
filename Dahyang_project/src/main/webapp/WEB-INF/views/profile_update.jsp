<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage(user profile)</title>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  <style>
    .profile-details {
    width: 450px;
    height: 300px;
    margin-top: 20px;
    padding: 20px;
    background-color: #f8f9fa;
    border: 1px solid #ccc;
    border-radius: 5px;
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
    margin-top: 50px;
  }
    
  </style>
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
  <div id="app">
      <header>
        <div class="system-bar"></div>
        <div class="left">
          <span class="ion-chevron-left"></span>
        </div>
        <img src="${pageContext.request.contextPath}/resources/css/Logo.png"
             height="150" width="130">
        <div class="center-text">다양한 사람들과 다양한 취미를 향유하다</div>
        <div class="right">
          <span class="ion-navicon"></span>
        </div>
      </header>
      <!-- 상단바 -->
    
    <!--페이지 내용-->
    <div class="page">
      <div class="profile">
        <h3>정보 수정</h3>
        <br>
        <div class="profile-details">
          <form action="<c:url value='/views/users/profile_update'/>" method="post" enctype="multipart/form-data">
          	<c:choose>
				<c:when test="${not empty user.images}">
			    	<div class="profile-img">
			      		<img src="${pageContext.request.contextPath}/resources/imgs/${user.images}">
			    	</div>
		    	</c:when>
		    	<c:otherwise>
		    		<div class="profile-img">
			      		<img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png">
			    	</div>
			    	<input type="file" id="img" name="img" accept="image/*" onchange="readURL(this);">
			      	<label for="img">+</label>
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
  <jsp:include page="/views/navbar.jsp" />
</body>
</html>
