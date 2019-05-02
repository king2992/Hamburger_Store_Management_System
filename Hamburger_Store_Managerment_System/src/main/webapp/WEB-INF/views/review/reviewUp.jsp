<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
.add { border-style:none; width: 70px; height:35px; background-color:#2d70be; font-weight:bold; color:#fff; cursor: pointer;}
.fileDrop { width: 100%; height: 200px; border: 2px dotted #0b58a2; }
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
<script id="fileTemplate" type="text/x-handlebars-template">
	<li>
		<span class="mailbox-attachment-icon has-img">
			<img src="{{imgSrc}}" alt="Attachment">
		</span>
		<div class="mailbox-attachment-info">
			<a href="{{originalFileUrl}}" class="mailbox-attachment-name">
				<i class="fa fa-paperclip"></i> {{originalFileName}}
			</a>
			<a href="{{fileName}}" class="btn btn-default btn-xs pull-right delBtn">
				<i class="fa fa-fw fa-remove"></i>
			</a>
		</div>
	</li>
</script>
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
<!-- 		<div> -->
<!-- 			<label>첨부파일:</label> -->
<%-- 			<input type="file" name="attach" multiple="multiple">(${reviewUp.file}) --%>
<!-- 		</div> -->
		
		<div>
			<input class="add" id="btnUpdate" type="submit" value="수정">
		</div>					
	</form>
</body>
<script type="text/javascript" src="/resources/lightbox/js/lightbox.js"></script>
</html>