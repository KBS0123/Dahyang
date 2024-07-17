<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/feedpage.css?after" rel="stylesheet" type="text/css">
    <title>피드 상세 페이지</title>
	<style>
        .group-name {
            text-align: center;
        }

        .like-button-page { /* 좋아요 버튼 위치 설정 */
            position: absolute;
            right: 40px;
            top: 35px;
        }

        .feed-header .nickname {
            font-size: 18px; /* 상단 닉네임의 글자 크기 */
            font-weight: bold; /* 상단 닉네임의 글꼴 두께 */
            color: #333; /* 상단 닉네임의 글자 색상 */
            margin-right: 400px; /* 프로필 사진과 닉네임 사이의 간격 */
        }
        .settings-button img {
	    filter: invert(28%) sepia(94%) saturate(2964%) hue-rotate(117deg) brightness(96%) contrast(94%);
	}
	
	.comment-text {
        white-space: pre-wrap; /* Preserve whitespace and wrap as necessary */
        word-wrap: break-word; /* Break long words */
        max-width: 50ch; /* Limit line length to 50 characters */
    }
    
    
     .image-slider {
		    position: relative;
		    width: 100%;
		    max-width: 500px;
		    height: 400px; /* 고정된 높이 */
		    margin: 20px auto; /* Center the slider */
		    overflow: hidden; /* Hide overflow */
		    border-radius: 20px;
		}
		
		.slides {
		    display: flex;
		    transition: transform 0.5s ease-in-out;
		    height: 100%; /* 부모의 높이에 맞춤 */
		}
		
		.slide {
		    min-width: 100%;
		    height: 100%; /* 부모의 높이에 맞춤 */
		    box-sizing: border-box;
		}
		
		.slide img {
		    width: 100%;
		    height: 100%;
		    display: block;
		    
		}
        .prev, .next {
            position: absolute;
            top: 50%;
            width: auto;
            padding: 16px;
            margin-top: -22px;
            color: white;
            font-weight: bold;
            font-size: 18px;
            transition: 0.6s ease;
            border-radius: 0 3px 3px 0;
            user-select: none;
            cursor: pointer;
        }

        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }

        .prev:hover, .next:hover {
            background-color: rgba(0,0,0,0.8);
        }
         .slide-number {
            position: absolute;
            top: 10px;
            right: 10px;
            color: white;
            font-size: 16px;
            font-weight: bold;
        }
    </style>
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
	   <span style= "margin-left: 10px; font-weight: bold; color: white; font-size: 20px;">피드</span>
	   <div class="right">
	     <c:if test="${user.uid == feed.uid}">
	         <button class="settings-button" onclick="location.href='<c:url value="/views/club/${clid}/feed/update/${fid}"/>'">
	              <img src="${pageContext.request.contextPath}/resources/css/setting icon.svg" class="svg-icon">
	         </button>
	     </c:if>
	  	  </div>
	</header>
	<!-- 상단바 -->
<div class="page">
        <div class="content">
            <div class="feed-item">
                <div class="feed-header">
                    <div class="profile-pic">
                    	<c:choose>
							<c:when test="${not empty feed.uimg}">
								<img alt="123" src="${pageContext.request.contextPath}/resources/imgs/${feed.uimg}"
								onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/resources/imgs/no_image.png';">
								<!-- 이미지를 비율에 맞게 수정하는 object-fit: contain 옵션은 div등 블록옵션에는 적용 안됨 -->
								<!-- 직접 적용을 위한 핸들러 추가(onerror) -->
							</c:when>
							<c:otherwise>
								<img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png">
							</c:otherwise>
						</c:choose>
                    </div>
                    <span class="nickname">${feed.writer}</span>
                </div>
                
                 <div class="image-slider">
                    <div class="slides">
                        <c:choose>
                            <c:when test="${not empty images}">
                                <c:forEach var="image" items="${images}">
                                    <c:choose>
                                        <c:when test="${not empty image.img}">
                                            <div class="slide">
                                                <img alt="Feed Image" src="${pageContext.request.contextPath}/resources/imgs/${image.img}">
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="slide">
                                                <img src="${pageContext.request.contextPath}/resources/css/feed.jpg">
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div class="slide">
                                    <img src="${pageContext.request.contextPath}/resources/css/feed.jpg">
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                    <a class="next" onclick="plusSlides(1)">&#10095;</a>
                    <div class="slide-number">1/4</div>
                </div>
                
                <div class="content-text">${feed.content}</div>
                <div class="comments">
                    <c:forEach var="comment" items="${comments}">
                        <div class="comment">
                            <div class="profile-pic comment-pic">
                                <c:choose>
                                    <c:when test="${not empty comment.uimg}">
                                        <img alt="123" src="${pageContext.request.contextPath}/resources/imgs/${comment.uimg}">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png">
                                    </c:otherwise>
                                </c:choose>
                            </div>
		                    <span class="nickname">${comment.nickname}</span>
		                    <pre class="comment-text">${comment.content}</pre>
		                    <!-- 댓글 삭제 버튼 -->
		                     <c:if test="${user.uid == comment.uid}">
                             <button class="btn-delete-comment" onclick="location.href='<c:url value="/views/club/${clid}/feed/${fid}/comment/delete/${comment.fcid}"/>'">
                                -
                             </button>
                          </c:if>
		                </div>
				    </c:forEach>
                </div>
            </div>
            <c:if test="${not empty user}">
            <!-- 좋아요 버튼 -->
	        <div class="like-button-page">
	            <button class="like-button">
	                <div class="like-wrapper">
	                    <div class="ripple"></div>
	                    <svg class="heart" width="24" height="24" viewBox="0 0 24 24">
	                        <path d="M12,21.35L10.55,20.03C5.4,15.36 2,12.27 2,8.5C2,5.41 4.42,3 7.5,3C9.24,3 10.91,3.81 12,5.08C13.09,3.81 14.76,3 16.5,3C19.58,3 22,5.41 22,8.5C22,12.27 18.6,15.36 13.45,20.03L12,21.35Z"></path>
	                    </svg>
	                    <div class="particles" style="--total-particles: 6">
	                        <div class="particle" style="--i: 1; --color: #7642F0"></div>
	                        <div class="particle" style="--i: 2; --color: #AFD27F"></div>
	                        <div class="particle" style="--i: 3; --color: #DE8F4F"></div>
	                        <div class="particle" style="--i: 4; --color: #D0516B"></div>
	                        <div class="particle" style="--i: 5; --color: #5686F2"></div>
	                        <div class="particle" style="--i: 6; --color: #D53EF3"></div>
	                    </div>
	                </div>
	            </button>
	        </div>
	        <!-- 좋아요 버튼 -->
	        </c:if>
        </div>

        
        <c:if test="${not empty user}">
        	<!-- 댓글 작성 버튼 -->
			<div class="comment-buttons">
				<button class="btn-add-comment">댓글 작성</button>
				
			</div>
		
		
	        <!-- 댓글 작성 폼 -->
	        <div class="comment-form" style="display: none;">
	        	<form action="<c:url value='/views/club/${clid}/feed/${fid}/comment/write'/>" method="post">
	        		<textarea name="content" id="content" rows="3"></textarea>
	        		<input type="submit" value="작성">
	        	</form>
	        </div>
        </c:if>
    </div>
    </div>
    <!-- 댓글 작성 스크립트 -->
	<script>
	    document.addEventListener('DOMContentLoaded', function () {
	        const addCommentButton = document.querySelector('.btn-add-comment');
	        const commentForm = document.querySelector('.comment-form');
	
	        addCommentButton.addEventListener('click', function () {
	            commentForm.style.display = 'block';
	        });
	    });
	    
	    
	    <!--이미지 슬라이드 스크립트 -->
	    let slideIndex = 1;
        showSlides(slideIndex);

        function showSlides(n) {
            let slides = document.querySelectorAll(".slide");
            if (n > slides.length) { slideIndex = 1 }
            if (n < 1) { slideIndex = slides.length }
            for (let i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slides[slideIndex - 1].style.display = "block";

            // Update slide number indicator
            let slideNumber = document.querySelector(".slide-number");
            slideNumber.textContent = slideIndex + '/' + slides.length;
        }

        function plusSlides(n) {
            showSlides(slideIndex += n);
        }
	</script>
</body>
</html>