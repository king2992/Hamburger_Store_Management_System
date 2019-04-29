<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
.add { border-style:none; width: 70px; height:35px; background-color:#2d70be; font-weight:bold; color:#fff; cursor: pointer;}
</style>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
<script src="/resources/js/summernote.js"></script>
<script type="text/javascript" src="/resources/js/fileUpload.js"></script>
<link rel="stylesheet" href="/resources/lightbox/css/lightbox.css">
</head>
<body>
	<form id="form1" method="post" action="reviewUp" enctype="multipart/form-data">
		<input type="hidden" id="number" name="number" value="${reviewUp.number}">
		<div>
			<label>제목:</label>
			<input id="title" type="text" name="title" value="${reviewUp.title}">
		</div>
		
		<div>
			<textarea name="contents" id="summernote" maxlength="140" rows="7">${reviewUp.contents}</textarea>
		</div>
		<div class="form-group">
			<div class="fileDrop">
				<br/>
				<br/>
				<br/>
				<br/>
				<p class="text-center"><i class="fa fa-paperclip"></i>첨부파일을 드래그 해주세요.</p>
			</div>
		</div>
		<div>
			<input class="add" id="btnUpdate" type="submit" value="수정">
		</div>					
	</form>
</body>
</html>