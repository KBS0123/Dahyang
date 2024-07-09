<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Board</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style>
        .community-section {
            margin-top: 25px;
            display: flex;
            justify-content: center;
            flex-direction: column;
            align-items: center;
        }
        th, td {
            text-align: center;
            border-bottom: 1px solid #ffffff;
          	padding: 5px;
        }
        .pagination .btn {
            color: #fff;
            background-color: transparent;
            border-color: #fff;
        }
        .pagination {
            justify-content: center;
        }
        .table-container2 {
            border-bottom: 1px solid #ffffff;
            margin: 0 auto;  /* 게시판 틀 가운데 정렬 */
            margin-top: 5px;
            margin-bottom: 5px;
        }
        .table-header {
            border-bottom: none; ;
            color: #fff;
            
        }
     
       
        .table-content {
            color: #fff;
            text-align : center;
        }
 
   
     .table-content .col {
       text-align: center; /* .table-content의 텍스트를 가운데 정렬합니다. */
         padding: 5px; /* 각 열의 간격을 조정합니다. */
}

.table-header .col {
    text-align: center; /* .table-header의 텍스트를 가운데 정렬합니다. */
    border-top: 3px solid #ffffff;
    border-bottom: 3px solid #ffffff;
}

.table-header .col:nth-child(1) {
    padding-left: 30px;
 
}

.table-header .col:nth-child(2) {
 text-align: center;
  
}

.table-header .col:nth-child(3) { 
    text-align: center; /* 작성자 열의 텍스트를 가운데 정렬합니다. */
}

.table-header .col:nth-child(4) {
   
  padding-right: 20px;
}

.table-header .col:nth-child(5) {
   padding-right: 20px;
   
}

    </style>
</head>
<body style="background-color:#2E2E2E">
    <h3 class="text-white" align="center">커뮤니티</h3>
    <div class="community-section">
        <div class="table-container" style="width: 65%;">
            <div class="table-header">  
	            <div class="row text-white">            
	                <div class="col">No</div>
	                <div class="col">제목</div>
	            </div>
	        </div>
	        <div class="table-content">
		         <c:forEach var="club" items="${clubs}">
		                <div class="row table-container2">
		                    <div class="col">${club.clid}</div>
		                    <div class="col"><a href="<c:url value='/views/club/${club.clid}' />">${club.title}</a></div>
		                </div>
		         </c:forEach>
	        </div>
        </div>
    </div>
</body>
</html>