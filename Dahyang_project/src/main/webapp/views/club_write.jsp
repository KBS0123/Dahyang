<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<body style="background-color:#2E2E2E">
	<div class="container mb-4">
		<div class="row justify-content-center mb-3">
			<div class="col-md-6 mb-3">
				<h4 class="text-white" align="center">
					주의<br/>
					모임 생성시 월 5000원씩<br/>
					요금이 부과됩니다.
				</h4>
				<form action="<c:url value='/views/test'/>" method="post" enctype="multipart/form-data">
					<div class="col-sm-3">
		            	<input type="file" class="form-control form-control-sm" id="img" name="img" onchange="readURL(this);">
		        	</div>
					<div class="mb-3">
						<input type="text" class="form-control" name="title" id="title" placeholder="모임 이름">
					</div>
					<div class="mb-3">
						<textarea class="form-control" name="context" id="context" rows="15" cols="50" placeholder="모임 설명"></textarea>
					</div>
					<div class="d-flex justify-content-between">						
						<button type="submit" class="btn btn-success mr-2">만들기</button>
					</div>
				</form>
			</div>
		</div> 
	</div>
</body>
</html>