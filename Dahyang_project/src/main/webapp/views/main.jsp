<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<title>Main</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<!-- 폰트 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap" rel="stylesheet">
  <!-- 폰트 -->
  <style type="text/css">
    .bs-example { margin: 20px; }
    .logo-small { color: #f4511e; font-size: 50px; }
    footer .glyphicon { font-size: 20px; margin-bottom: 20px; color: #f4511e; }
     .center-text { /*상단바 텍스트 위치 조정*/
      margin-top: 25px;
    }
  </style>
</head>

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
        <img src="${pageContext.request.contextPath}/resources/css/Logo.png"
             height="150" width="130">
        <div class="center-text">다양한 사람들과 다양한 취미를 향유하다</div>
        <div class="right">
          <span class="ion-navicon"></span>
        </div>
      </header>
      <!-- 상단바 -->
    
    <!-- 내부 박스 -->
    <div class="page"><p>
    -스크롤 테스트용 더미 텍스트-PBR&B affogato humblebrag slow-carb hoodie.
    Irony shoreditch bushwick, readymade small batch hella cliche before they sold out
    sustainable keytar slow-carb franzen messenger bag kinfolk trust fund. Polaroid chambray trust fund
     brooklyn distillery skateboard freegan etsy raw denim health goth XOXO. Meditation biodiesel jean shorts,
     wayfarers cardigan paleo green juice tote bag fixie authentic. Tattooed try-hard sustainable microdosing,
     man bun whatever leggings polaroid you probably haven't heard of them tumblr. Craft beer retro leggings readymade 
     ynth, keytar selvage direct trade. Church-key drinking vinegar retro, shoreditch gochujang post-ironic YOLO cardigan
     stumptown.</p>

	<p>Artisan keytar fingerstache, pitchfork banjo fashion axe keffiyeh squid meggings tattooed
	retro disrupt meditation intelligentsia marfa. Banjo iPhone put a bird on it, drinking vinegar
	small batch squid chambray artisan bushwick twee kinfolk semiotics four loko. Tilde brooklyn fap,
	salvia truffaut four loko everyday carry franzen quinoa aesthetic tote bag drinking vinegar meggings ugh.
	Knausgaard vinyl mixtape tacos fap pug. Chambray lo-fi crucifix skateboard, synth before they sold out taxidermy pitchfork
	food truck. YOLO authentic fingerstache, ennui next level hoodie waistcoat meggings listicle. Gentrify flannel yr pinterest.</p>
	
	<p>Artisan keytar fingerstache, pitchfork banjo fashion axe keffiyeh squid meggings tattooed
	retro disrupt meditation intelligentsia marfa. Banjo iPhone put a bird on it, drinking vinegar
	small batch squid chambray artisan bushwick twee kinfolk semiotics four loko. Tilde brooklyn fap,
	salvia truffaut four loko everyday carry franzen quinoa aesthetic tote bag drinking vinegar meggings ugh.
	Knausgaard vinyl mixtape tacos fap pug. Chambray lo-fi crucifix skateboard, synth before they sold out taxidermy pitchfork
	food truck. YOLO authentic fingerstache, ennui next level hoodie waistcoat meggings listicle. Gentrify flannel yr pinterest.
	-스크롤 테스트용 더미 텍스트-</p>

    </div>
    <!-- 내부 박스 -->
    <c:import url="navbar.jsp"></c:import>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>