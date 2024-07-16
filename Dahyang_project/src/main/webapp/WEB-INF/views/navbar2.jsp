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
  .icon-container {
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
  }

  .icon-container a {
    text-decoration: none; /* 링크의 밑줄 제거 */
    color: white; /* 텍스트 색상 */
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
  }

  .icon-container svg {
    width: 24px;
    height: 24px;
    margin-bottom: 5px;
  }

  .icon-container p {
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
            <svg><use xlink:href="#home-icon"></use></svg>
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
          <a href="<c:url value='/views/club/${clid}/chat'/>">
            <svg><use xlink:href="#user-icon"></use></svg>
            <p>채팅</p>
          </a>
        </div>
      </li>
    </ul>
   
    </div>
  </nav>

  <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" id="home-icon">
    <path
        d="M13.1428571,14.5 C13.6571429,14.5 14,14.175507 14,13.6887676 L14,6.38767551 C14,6.14430577 13.9142857,5.90093604 13.6571429,5.73868955 L8.51428571,1.6825273 C8.17142857,1.43915757 7.74285714,1.43915757 7.4,1.6825273 L2.25714286,5.73868955 C2.08571429,5.90093604 2,6.14430577 2,6.38767551 L2,13.6887676 C2,14.175507 2.34285714,14.5 2.85714286,14.5 L13.1428571,14.5 Z M5.42857143,12.8775351 L3.71428571,12.8775351 L3.71428571,6.79329173 L8,3.38611544 L12.2857143,6.79329173 L12.2857143,12.8775351 L10.5714286,12.8775351 L5.42857143,12.8775351 Z">
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

  
</body>
</html>