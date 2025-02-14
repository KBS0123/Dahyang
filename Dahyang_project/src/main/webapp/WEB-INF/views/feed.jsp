<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/feedpage.css?after" rel="stylesheet" type="text/css">
    <title>피드</title>
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
		    object-fit: cover;
		    
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
		    right: 10px;
		    bottom: 3px;
		    width: 40px;
		    height: 25px;
		    text-align: center;
		    color: white;
		    font-size: 16px;
		    font-weight: bold;
		    background-color: black;
		    opacity: 0.7;
		    border-radius: 5px;
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
            <c:if test="${not empty user and feed.uid ne user.uid}">
	            <!-- 좋아요 버튼 -->
		        <div class="like-button-page">
		        	<c:choose>
				        <c:when test="${isLiked}">
				            <button id="likeButton" class="like-button liked" data-fid="${feed.fid}" data-clid="${clid}" data-uid="${user.uid}">
				                <div class="like-wrapper">
				                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="24" height="24">
				                    	<path fill="#ff0000" d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z"/>
									</svg>
				                </div>
				            </button>
				            <span class="like-count">좋아요: ${likeCount}개</span>
				        </c:when>
				        <c:otherwise>
				        	<button id="likeButton" class="like-button not-liked" data-fid="${feed.fid}" data-clid="${clid}" data-uid="${user.uid}">
				                <div class="like-wrapper">
				                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="24" height="24">
				                    	<path fill="#ff0000" d="M225.8 468.2l-2.5-2.3L48.1 303.2C17.4 274.7 0 234.7 0 192.8l0-3.3c0-70.4 50-130.8 119.2-144C158.6 37.9 198.9 47 231 69.6c9 6.4 17.4 13.8 25 22.3c4.2-4.8 8.7-9.2 13.5-13.3c3.7-3.2 7.5-6.2 11.5-9c0 0 0 0 0 0C313.1 47 353.4 37.9 392.8 45.4C462 58.6 512 119.1 512 189.5l0 3.3c0 41.9-17.4 81.9-48.1 110.4L288.7 465.9l-2.5 2.3c-8.2 7.6-19 11.9-30.2 11.9s-22-4.2-30.2-11.9zM239.1 145c-.4-.3-.7-.7-1-1.1l-17.8-20-.1-.1s0 0 0 0c-23.1-25.9-58-37.7-92-31.2C81.6 101.5 48 142.1 48 189.5l0 3.3c0 28.5 11.9 55.8 32.8 75.2L256 430.7 431.2 268c20.9-19.4 32.8-46.7 32.8-75.2l0-3.3c0-47.3-33.6-88-80.1-96.9c-34-6.5-69 5.4-92 31.2c0 0 0 0-.1 .1s0 0-.1 .1l-17.8 20c-.3 .4-.7 .7-1 1.1c-4.5 4.5-10.6 7-16.9 7s-12.4-2.5-16.9-7z"/>
				                    </svg>
				                </div>
				            </button>
				            <span class="like-count">좋아요: ${likeCount}개</span>
				        </c:otherwise>
				    </c:choose>
		        </div>
		        <!-- 좋아요 버튼 -->
	        </c:if>
	        <c:if test="${empty user or feed.uid eq user.uid}">
	        	<div class="like-button-page">
	        		<button class="like-button" style="cursor: default;">
				        <div class="like-wrapper">
				            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="24" height="24">
				            	<path fill="#ff0000" d="M225.8 468.2l-2.5-2.3L48.1 303.2C17.4 274.7 0 234.7 0 192.8l0-3.3c0-70.4 50-130.8 119.2-144C158.6 37.9 198.9 47 231 69.6c9 6.4 17.4 13.8 25 22.3c4.2-4.8 8.7-9.2 13.5-13.3c3.7-3.2 7.5-6.2 11.5-9c0 0 0 0 0 0C313.1 47 353.4 37.9 392.8 45.4C462 58.6 512 119.1 512 189.5l0 3.3c0 41.9-17.4 81.9-48.1 110.4L288.7 465.9l-2.5 2.3c-8.2 7.6-19 11.9-30.2 11.9s-22-4.2-30.2-11.9zM239.1 145c-.4-.3-.7-.7-1-1.1l-17.8-20-.1-.1s0 0 0 0c-23.1-25.9-58-37.7-92-31.2C81.6 101.5 48 142.1 48 189.5l0 3.3c0 28.5 11.9 55.8 32.8 75.2L256 430.7 431.2 268c20.9-19.4 32.8-46.7 32.8-75.2l0-3.3c0-47.3-33.6-88-80.1-96.9c-34-6.5-69 5.4-92 31.2c0 0 0 0-.1 .1s0 0-.1 .1l-17.8 20c-.3 .4-.7 .7-1 1.1c-4.5 4.5-10.6 7-16.9 7s-12.4-2.5-16.9-7z"/>
				            </svg>
				        </div>
				    </button>
				    <span class="like-count">좋아요: ${likeCount}개</span>
	        	</div>
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
	<script src="${pageContext.request.contextPath}/resources/js/likebutton.js"></script>
</body>
</html>