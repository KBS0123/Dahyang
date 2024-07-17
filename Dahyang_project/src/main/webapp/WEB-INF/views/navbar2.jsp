<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/navbar2.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>navbar2</title>
<style>
  .icon-container{
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
  }

  .icon-container a{
    text-decoration: none; /* 링크의 밑줄 제거 */
    color: white; /* 텍스트 색상 */
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
  }

  .icon-container svg{
    width: 24px;
    height: 24px;
    margin-bottom: 5px;
  }

  .icon-container p{
    font-size: 15px;
    margin: 0;
    white-space: nowrap;
  }
</style>
</head>
<body>
  <nav>
    <ul>
      <li>
        <div class="icon-container">
          <a class="active" href="<c:url value='/views/club/${clid}' />">
            <svg><use xlink:href="#intro-icon"></use></svg>
            <p>소개</p>
          </a>
        </div>
      </li>
    </ul>
    <ul>
      <li>
        <div class="icon-container">
          <a href="<c:url value='/views/club/${clid}/feed'/>">
            <svg><use xlink:href="#bookmark-icon"></use></svg>
            <p>피드</p>
          </a>
        </div>
      </li>
    </ul>
    <ul>
      <li>
        <div class="icon-container">
          <c:set var="isMember" value="false" />
          <c:forEach var="m" items="${member}">
            <c:if test="${m.uid == user.uid}">
              <c:set var="isMember" value="true" />
            </c:if>
          </c:forEach>
          <c:choose>
            <c:when test="${isMember}">
              <a href="<c:url value='/views/club/${clid}/chat'/>">
                <svg><use xlink:href="#user-icon"></use></svg>
                <p>채팅</p>
              </a>
            </c:when>
            <c:otherwise>
              <a onclick="findGroup()">
                <svg><use xlink:href="#user-icon"></use></svg>
                <p>채팅</p>
              </a>
            </c:otherwise>
          </c:choose>
        </div>
      </li>
    </ul>
  </nav>

  <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
	<symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 30 30" fill="#fff" id="intro-icon">
		<path
			d="M27.75 2c-0-0.414-0.336-0.75-0.75-0.75h-4.963c-0.020-0.002-0.037-0.012-0.058-0.012h-7.957c-0.021 0-0.038 0.010-0.058 0.012h-6.763c-0.028-0.001-0.061-0.002-0.094-0.002-1.541 0-2.797 1.22-2.856 2.746l-0 0.005v24.389c0.113 1.331 1.221 2.367 2.572 2.367 0.063 0 0.125-0.002 0.187-0.007l-0.008 0h20c0.414 0 0.75-0.336 0.75-0.75s-0.336-0.75-0.75-0.75v0h-19.8c-0.023 0.001-0.050 0.002-0.077 0.002-0.717 0-1.306-0.547-1.373-1.247l-0-0.006v-1.223c0-0.459 0.584-0.861 1.248-0.861l20.002 0.057c0 0 0.001 0 0.001 0 0.207 0 0.394-0.084 0.529-0.22l0-0c0.017-0.017 0.025-0.041 0.040-0.060 0.047-0.051 0.087-0.11 0.118-0.173l0.002-0.004c0.016-0.049 0.029-0.105 0.034-0.164l0-0.003c0.011-0.035 0.020-0.077 0.025-0.121l0-0.003v-0.002zM26.25 24.471l-15.5-0.044v-21.677h2.521v10.448c0 0 0 0 0 0.001 0 0.414 0.336 0.749 0.749 0.749 0.181 0 0.347-0.064 0.476-0.171l-0.001 0.001 3.51-2.869 3.504 2.804c0.127 0.102 0.29 0.164 0.468 0.164 0.414 0 0.75-0.336 0.751-0.75v-10.377h3.521zM21.229 2.75v8.816l-2.76-2.208c-0.127-0.103-0.29-0.165-0.468-0.165-0.181 0-0.347 0.064-0.477 0.172l0.001-0.001-2.754 2.252v-8.866zM5.75 24.686v-20.686c0.067-0.705 0.657-1.252 1.374-1.252 0.027 0 0.054 0.001 0.080 0.002l-0.004-0h2.050v21.672l-2.25-0.006c-0.453 0.002-0.883 0.101-1.269 0.278l0.019-0.008z">
		</path>
	</symbol>
  <symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" id="bookmark-icon">
    <path
        d="M7.5125,14.3196446 C6.8625,13.7292662 1.5,9.09057902 1.5,5.54830881 C1.5,3.27113511 3.2875,1.5 5.4,1.5 C6.375,1.5 7.26875,1.92169883 8,2.5120772 C8.73125,1.83735907 9.625,1.5 10.6,1.5 C12.79375,1.5 14.5,3.35547487 14.5,5.54830881 C14.5,9.09057902 9.1375,13.7292662 8.4875,14.2353048 C8.24375,14.5726639 7.75625,14.5726639 7.5125,14.3196446 Z M5.4,3.18679534 C4.18125,3.18679534 3.125,4.28321231 3.125,5.54830881 C3.125,7.40378368 5.96875,10.6086948 8,12.4641697 C9.70625,10.8617141 12.875,7.57246322 12.875,5.54830881 C12.875,4.19887254 11.81875,3.18679534 10.6,3.18679534 C9.86875,3.18679534 9.1375,3.60849417 8.73125,4.28321231 C8.40625,4.78925091 7.675,4.78925091 7.35,4.28321231 C6.8625,3.60849417 6.2125,3.18679534 5.4,3.18679534 Z">
    </path>
    
  </symbol>
  <symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" id="plus-icon">
    <path fill-rule="evenodd" clip-rule="evenodd"
        d="M12 2C6.48 2 2 6.48001 2 12C2 17.52 6.48 22 12 22C17.52 22 22 17.52 22 12C22 6.48001 17.52 2 12 2ZM11 7V11H7V13H11V17H13V13H17V11H13V7H11ZM4 12C4 16.41 7.59 20 12 20C16.41 20 20 16.41 20 12C20 7.59 16.41 4 12 4C7.59 4 4 7.59 4 12Z" />
    
  </symbol>
  <symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 570" id="user-icon">
    <path d="M313.6 304c-28.7 0-42.5 16-89.6 16-47.1 0-60.8-16-89.6-16C60.2 304 0 364.2 0 438.4V464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48v-25.6c0-74.2-60.2-134.4-134.4-134.4zM400 464H48v-25.6c0-47.6 38.8-86.4 86.4-86.4 14.6 0 38.3 16 89.6 16 51.7 0 74.9-16 89.6-16 47.6 0 86.4 38.8 86.4 86.4V464zM224 288c79.5 0 144-64.5 144-144S303.5 0 224 0 80 64.5 80 144s64.5 144 144 144zm0-240c52.9 0 96 43.1 96 96s-43.1 96-96 96-96-43.1-96-96 43.1-96 96-96z" />
    
  </symbol>
</svg>
<script>
    function findGroup() {
      alert("모임방에 가입해주세요!");
      window.location.href = "<c:url value='/views/club/${clid}'/>";
    }
  </script>
  
</body>
</html>