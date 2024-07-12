<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/group.css" rel="stylesheet" type="text/css">
    <title>가입된 그룹방</title>
</head>
<style>
        .svg-icon {
            width: 30px;
            height: 30px;
            filter: brightness(0) invert(1); /*아이콘 색상 변경*/
        }
    </style>

<body>
    <div class="container">
        <div class="navbar">
            <!-- 뒤로가기 버튼 -->
          <button class="back-button" onclick="history.back()">
            <svg viewBox="0 0 24 24">
              <path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"/>
            </svg>
          </button>
            <span class="group-name">그룹방 이름</span>
          
          <!-- 톱니바퀴 버튼 추가 -->
            <button class="settings-button">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M0 0h24v24H0z" fill="none"/>
                    <img src="${pageContext.request.contextPath}/resources/css/setting icon.svg" class="svg-icon">
            </button>
          
        </div>
        <div class="content">
            <div class="image-placeholder"></div>
            <h2 class="group-title">그룹방 이름</h2>
            <p class="status">현재 멤버를 모집 중인 모임입니다.</p>
            
            <div class="description">
                <span>소개글</span>
            </div>
          
			 <!-- 공지사항 박스 -->
            <div class="notice-box">
                <h3 class="notice-title">공지사항</h3>
                <div class="notice-content">
                    <!-- 여기에 공지사항 내용을 동적으로 표시할 부분 -->
                  <p>안녕하세요?</p>
                </div>
            </div>
            <!-- 공지사항 박스 끝 -->
            
          
	          <!-- 참여된 인원 토글 박스 -->
	   <div class="toggle-box">
		    <div class="toggle-header" onclick="toggleParticipants()">
		        <div class="toggle-title">참여된 인원</div>
		        <div class="toggle-icon">+</div>
		    </div>
		    <div class="toggle-content" id="participantsBox">
		        <!-- 유저 프로필 및 승인/거절 버튼 예시 -->
		        <div class="user-profile">
		            <img src="사용자 프로필 이미지 URL" alt="프로필 사진">
		            <div class="user-info">
		                <div class="user-name">사용자 닉네임</div>
		                <div class="action-buttons">
		                    <button class="btn-accept">승낙하기</button>
		                    <button class="btn-reject">거절하기</button>
		                </div>
		            </div>
		        </div>
		        <!-- 추가적인 참여된 인원 예시 -->
		        <div class="user-profile">
		            <img src="사용자 프로필 이미지 URL" alt="프로필 사진">
		            <div class="user-info">
		                <div class="user-name">사용자 닉네임</div>
		                <div class="action-buttons">
		                    <button class="btn-accept">승낙하기</button>
		                    <button class="btn-reject">거절하기</button>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>

  
  <!--토글-->
   <script>
        function toggleParticipants() {
            var box = document.getElementById("participantsBox");
            box.classList.toggle("show");
        }
    </script>
</body>
</html>