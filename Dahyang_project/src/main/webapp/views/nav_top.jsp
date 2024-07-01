<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-lg mb-4" style="background-color: #2E2E2E;">
  <div class="container-fluid" >
    <a class="text-danger" href="<c:url value='/views/'/>" style="text-decoration-line: none; font-weight:bold; text-align:center;">
    	<img alt="" src="<c:url value='/views/imgs/Logo-004.png'/>" height="70px" width="70px">
    </a>
    <form class="d-flex ms-2 me-2" role="search" action="<c:url value='/views/movie/search'/>" method="post">
        <input class="form-control me-2 opacity-75" style="width: 300px;" type="search" id="search" name ="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
   	</form>
    <div class="collapse navbar-collapse me-3" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active text-light" aria-current="page" href="<c:url value='/views/'/>">영화</a>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-light" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            장르
          </a>
          <ul class="dropdown-menu" style="background-color: #2E2E2E;">
            <li><a class="dropdown-item text-success" href="<c:url value='/views/movie/액션'/>"><bold>액션</bold></a></li>
            <li><a class="dropdown-item text-success" href="<c:url value='/views/movie/판타지'/>">판타지</a></li>
            <li><a class="dropdown-item text-success" href="<c:url value='/views/movie/스릴러'/>">스릴러</a></li>
            <li><a class="dropdown-item text-success" href="<c:url value='/views/movie/로맨스'/>">로맨스</a></li>
            <li><a class="dropdown-item text-success" href="<c:url value='/views/movie/코미디'/>">코미디</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link text-light" href="<c:url value='/views/board'/>">커뮤니티</a>
        </li>        
      </ul>
    </div>
    <div>
    <c:if test="${islogin == true && not empty user}">
    	<a href="<c:url value='/views/users/profile'/>">
    		<span class="badge bg-success text-light" style="text-decoration-line: none;" align="center">${user.getNickname()}님 환영합니다.</span>
    	</a>
		<a href="<c:url value='/views/logout'/>"><button type="button" class="btn btn-success text-light">LOGOUT</button></a>					
	</c:if>
	<c:if test="${empty user or isreg ==true}">
			<a href="<c:url value='/views/login'/>"><button type="button" class="btn btn-success text-light">LOGIN</button></a>
	</c:if>	
	</div>
    
  </div>
</nav>