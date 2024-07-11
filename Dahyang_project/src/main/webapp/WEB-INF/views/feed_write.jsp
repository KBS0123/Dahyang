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
				<form action="<c:url value='/views/club/${clid}/feed/write'/>" method="post" enctype="multipart/form-data">
					<div class="col-sm-3">
		            	<input type="file" class="form-control form-control-sm" id="img" name="img" onchange="readURL(this);">
		        	</div>
					<div class="mb-3">
						<textarea class="form-control" name="content" id="content" rows="15" cols="50" placeholder="내용"></textarea>
					</div>
					<input type="hidden" class="form-control" id="clid" name="clid" value="${clid}">
					<input type="hidden" class="form-control" id="uid" name="uid" value="${user.uid}">
					<input type="hidden" class="form-control" id="writer" name="writer" value="${user.nickname}">
					<input type="hidden" class="form-control" id="uimg" name="uimg" value="${user.images}">
					<input type="hidden" class="form-control" id="likes" name="likes" value="0">
					<div class="d-flex justify-content-between">						
						<button type="submit" class="btn btn-success mr-2">만들기</button>
					</div>
				</form>
			</div>
		</div> 
	</div>
</body>
</html>