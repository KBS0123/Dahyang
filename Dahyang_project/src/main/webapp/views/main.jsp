<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Main</title>
  <link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
  <!-- Owl Carousel CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.0/assets/owl.carousel.min.css">
  <!-- Owl Carousel CSS -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap" rel="stylesheet">
  
  <style type="text/css">
    .bs-example { margin: 20px; }
    .logo-small { color: #f4511e; font-size: 50px; }
    footer .glyphicon { font-size: 20px; margin-bottom: 20px; color: #f4511e; }
    .center-text { /* 상단바 텍스트 위치 조정 */
      margin-top: 25px;
    }
  </style>
</head>
<body>
  <main>
  
  <header>
    <div class="feature"></div>
    <div class="feature"></div>
  </header>
  
  <div id="app">
    <!-- 상단바 -->
    <header>
      <div class="system-bar"></div>
      <div class="left">
        <span class="ion-chevron-left"></span>
      </div>
      <img src="${pageContext.request.contextPath}/resources/css/Logo.png" height="150" width="130">
      <div class="center-text">다양한 사람들과 다양한 취미를 향유하다</div>
      <div class="right">
        <span class="ion-navicon"></span>
      </div>
    </header>
    <!-- 상단바 끝 -->
    
    <!-- 내부 박스 -->
    <div class="page">
    
      <h3>신규 그룹방</h3>
      
   <!-- 신규 그룹방 슬라이드 -->
    <section class="cards">
      <div class="owl-wrapper">
        <div class="loop owl-carousel owl-theme">
          
          <c:forEach var="club" items="${clubs}">
	          <article class="card" onclick="location.href='<c:url value="/views/club/${club.clid}"/>'">
	            <div class="card__content">
	              <img alt="clubs" src="${pageContext.request.contextPath}/resources/imgs/${club.img}">
	            </div>
	          </article>
	      </c:forEach>
	      
        </div>
      </div>
    </section>
    <!-- 슬라이드 섹션 끝 -->
      
      <h3>인기 그룹방</h3>
      
   <!-- 인기 그룹방 슬라이드 -->
    <section class="cards">
      <div class="owl-wrapper">
        <div class="loop owl-carousel owl-theme">
          
          <c:forEach var="club" items="${randomClubs}">
	          <article class="card" onclick="location.href='<c:url value="/views/club/${club.clid}"/>'">
	            <div class="card__content">
	              <img alt="clubs" src="${pageContext.request.contextPath}/resources/imgs/${club.img}">
	            </div>
	          </article>
          </c:forEach>
          
        </div>
      </div>
    </section>
    <!-- 슬라이드 섹션 끝 -->
    
    <h3>인기 피드</h3>
      
   <!-- 인기 피드 슬라이드 -->
    <section class="cards">
      <div class="owl-wrapper">
        <div class="loop owl-carousel owl-theme">
          
          <c:forEach var="feed" items="${randomFeeds}">
	          <article class="card" onclick="location.href='<c:url value="/views/club/${feed.clid}/feed/${feed.fid}"/>'">
	            <div class="card__content">
	              <img alt="clubs" src="${pageContext.request.contextPath}/resources/imgs/${feed.img}">
	            </div>
	          </article>
          </c:forEach>
          
        </div>
      </div>
    </section>
    <!-- 슬라이드 섹션 끝 -->
    </div>
    <!-- 내부 박스 끝 -->
    <jsp:include page="/views/navbar.jsp" />
  </div>
  
</main>

<!-- Owl Carousel JS ※주의※ !!삭제하면 페이지에 출력 안됨!!-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.0/owl.carousel.min.js"></script>
<script>
  $(document).ready(function(){
    $(".loop").owlCarousel({
      items: 3,
      loop: true,
      margin: 5,
      nav: false,
      autoplay: false,
      autoplayTimeout: 3000,
      autoplayHoverPause: true
    });
  });
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/carousel.js"></script>
<!-- Owl Carousel JS ※주의※ !!별도의 JS와 html내 script 모두 있어야 동작 가능!!-->
</body>
</html>
