<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>  
<meta charset="UTF-8">
<title></title>
<link rel="shortcut icon" href="${path}/review/reviewAdd">
 <style>
button { border-style:none; width: 70px; height:35px; background-color:#2d70be; font-weight:bold; color:#fff; cursor: pointer;}
.fileDrop { width : 100%; height: 200px;  border : 2px dotted #0b58a2; }
.uploadedFileList li{ margin-right:20px !important; }
 </style>
<c:if test="${sessionScope.user == null}">
<script type="text/javascript">
		alert("로그인 하신 후에 이용해 주세요.");
			location.href="${pageContext.request.contextPath}/";
</script>
</c:if>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/12.1.0/classic/ckeditor.js"></script>
<link rel="stylesheet" href="${path}/resources/lightbox/css/lightbox.css">
<script type="text/javascript" src="${path}/resources/js/summernote.js"></script>
<script id="fileTemplate" type="text/x-handlebars-template">
	<li style="list-style: none; margin: 0 0 0 0; padding: 0 0 0 0; border: 0; float:left;">
		<span class="mailbox-attachment-icon has-img">
			<img src="{{imgSrc}}" alt="Attachment">
		</span>
		<div class="mailbox-attachment-info">
			<a href="{{originalFileUrl}}" class="mailbox-attachment-name">
				<i class="fa fa-paperclip"></i> {{originalFileName}}
			</a>
			<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delBtn">
				<i class="fa fa-fw fa-remove">삭제</i>
			</a>
		</div>
	</li>
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/fileUpload.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<script type="text/javascript" src="/resources/lightbox/js/lightbox.js"></script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
</head>
<body>
	<!-- input 태그의 속성값이 file이면 enctype을 사용해서 multipart써줘야 서버가 인식을한다. -->
	<form id="writeForm" method="post" action="reviewAdd" >
	<div>
		<div>
			<label>제목</label>
			<input type="text" name="title" placeholder="제목을 입력해주세요">
		</div>
		<div>
			<textarea name="contents" id="summernote" placeholder="내용을 입력해주세요"></textarea>
		</div>	
<!-- 		첨부파일 영역 추가 -->
		<div class="form-group">
			<div class="fileDrop">
				<p class="text-center" style="line-height:200px;"><i class="fa fa-paperclip"></i> 첨부파일을 드래그해주세요.</p>
			</div>
		</div>
	</div>
		<div class="box-footer">
			<ul class="uploadedFileList"></ul>
		</div>
		<div style="clear:both;">
			<button class="resetBtn" type="reset"><i></i>초기화</button>
			<button class="addBtn" type="submit"><i></i>저장</button>
		</div>	
	</form>
</body>
</html>