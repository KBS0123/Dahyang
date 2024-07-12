<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<script type="text/javascript">
   function readURL(input) {
      var file = input.files[0]; 
      console.log(file);
      if (file !== undefined) {
         var reader = new FileReader();
         reader.readAsDataURL(file);
         reader.onload = function (e) { 
            console.log(e.target);
            console.log(e.target.result);
            $('#preview').attr('src', e.target.result);
         };
      }
  }  
</script>
</head>
<body style="background-color:#2E2E2E">
	<div class="container mb-4">
		<div class="row justify-content-center mb-3">
			<div class="col-md-6 mb-3">
				<h4 class="text-white" align="center">
					주의<br/>
					모임 생성시 월 5000원씩<br/>
					요금이 부과됩니다.
				</h4>
				<form action="<c:url value='/views/club/write'/>" method="post" enctype="multipart/form-data">
					<div class="col-sm-3">
		            	<input type="file" class="form-control form-control-sm" id="img" name="img" onchange="readURL(this);">
		        	</div>
					<div class="mb-3">
						<input type="text" class="form-control" name="title" id="title" placeholder="모임 이름">
					</div>
					<div class="mb-3">
						<textarea class="form-control" name="content" id="content" rows="15" cols="50" placeholder="모임 설명"></textarea>
					</div>
					<input type="hidden" class="form-control" id="uid" name="uid" value="${user.uid}">
					<input type="hidden" class="form-control" id="notice" name="notice">
					<div class="d-flex justify-content-between">						
						<button type="submit" class="btn btn-success mr-2">만들기</button>
					</div>
				</form>
				<form action="<c:url value='/kakaoPay'/>" method="post">
                	<button type="submit">결제하기</button>
                </form>
			</div>
		</div> 
	</div>
</body>
</html>