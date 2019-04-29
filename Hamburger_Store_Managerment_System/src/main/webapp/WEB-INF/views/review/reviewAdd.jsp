<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:if test="${sessionScope.user == null}">
<script type="text/javascript">
		alert("로그인 하신 후에 이용해 주세요.");
			location.href="${pageContext.request.contextPath}/";
</script>
</c:if>
<title></title>
 <style>
button { border-style:none; width: 70px; height:35px; background-color:#2d70be; font-weight:bold; color:#fff; cursor: pointer;}
 </style>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/12.1.0/classic/ckeditor.js"></script>
<link rel="stylesheet" href="/resources/lightbox/css/lightbox.css">
<script type="text/javascript" src="/resources/js/summernote.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
<script type="text/javascript" src="/resources/js/fileUpload.js"></script>
</head>
<body>
	<!-- input 태그의 속성값이 file이면 enctype을 사용해서 multipart써줘야 서버가 인식을한다. -->
	<form id="writeForm" method="post" action="reviewAdd" enctype="multipart/form-data">
		<input type="hidden" id="number" name="number">
	<div>
		<div>
			<label>제목</label>
			<input type="text" name="title" placeholder="제목을 입력해주세요">
		</div>

		<div>
			<textarea name="contents" id="summernote" placeholder="내용을 입력해주세요"></textarea>
		</div>

		<div>
			<label>첨부파일:</label>
			<input type="file" name="attach" multiple="multiple">
		</div>
		<div>
			<input class="add" type="submit" value="등록">
		</div>	
	</div>					
	</form>

</body>
</html>