<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/feedpage.css" rel="stylesheet" type="text/css">
    <title>피드 상세 페이지</title>
	<style>
        .group-name {
            text-align: center;
        }

        .like-button-container { /* 좋아요 버튼 위치 설정 */
            position: absolute;
            right: 40px;
            top: 125px;
        }

        .feed-header .nickname {
            font-size: 18px; /* 상단 닉네임의 글자 크기 */
            font-weight: bold; /* 상단 닉네임의 글꼴 두께 */
            color: #333; /* 상단 닉네임의 글자 색상 */
            margin-right: 400px; /* 프로필 사진과 닉네임 사이의 간격 */
        }
    </style>
</head>
<body>
	<div class="container">
        <div class="navbar">
	        <div class="back-button" onclick="location.href='<c:url value="/views/club/${clid}/feed"/>'">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 22" width="26" height="24">
					<path fill="#fff" d="M20 11H7.414l3.293-3.293a1 1 0 0 0-1.414-1.414l-5 5a1 1 0 0 0 0 1.414l5 5a1 1 0 0 0 1.414-1.414L7.414 13H20a1 1 0 0 0 0-2z"/>
				</svg>
			</div>
            <span style="margin-left: 10px;">피드</span>
            <c:if test="${user.uid == feed.uid}">
            	<a href="<c:url value='/views/club/${clid}/feed/update/${fid}'/>">
	            	<span class="settings">&#9881;</span>
	            </a>
            </c:if>
        </div>
        
        <div class="content">
            <div class="feed-item">
                <div class="feed-header">
                    <div class="profile-pic">
                    	<c:choose>
							<c:when test="${not empty feed.uimg}">
								<img alt="123" src="${pageContext.request.contextPath}/resources/imgs/${feed.uimg}">
							</c:when>
							<c:otherwise>
								<img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png">
							</c:otherwise>
						</c:choose>
                    </div>
                    <span class="nickname">${feed.writer}</span>
                </div>
                <div class="image-placeholder">
                	<c:choose>
						<c:when test="${not empty feed.img}">
							<img alt="123" src="${pageContext.request.contextPath}/resources/imgs/${feed.img}">
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath}/resources/css/group.png">
						</c:otherwise>
					</c:choose>
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
		                    <span class="comment-text">${comment.content}</span>
		                </div>
				    </c:forEach>
                </div>
            </div>
        </div>
        
        <c:if test="${not empty user}">
        	<!-- 댓글 작성/삭제 버튼 -->
			<div class="comment-buttons">
				<button class="btn-add-comment">댓글 작성</button>
				<button class="btn-delete-comment">댓글 삭제</button>
			</div>
		
		
	        <!-- 댓글 작성 폼 -->
	        <div class="comment-form" style="display: none;">
	        	<form action="<c:url value='/views/club/${clid}/feed/${fid}/comment/write'/>" method="post">
	        		<textarea name="content" id="content" rows="3"></textarea>
	        		<input type="submit" value="작성">
	        	</form>
	        </div>
	        
	        <!-- 좋아요 버튼 -->
	        <div class="like-button-container">
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
    <!-- 댓글 작성 스크립트 -->
	<script>
	    document.addEventListener('DOMContentLoaded', function () {
	        const addCommentButton = document.querySelector('.btn-add-comment');
	        const commentForm = document.querySelector('.comment-form');
	
	        addCommentButton.addEventListener('click', function () {
	            commentForm.style.display = 'block';
	        });
	    });
	</script>
</body>
</html>