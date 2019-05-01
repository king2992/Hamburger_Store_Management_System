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
 <link rel="shortcut icon" type="image/x-icon" href="/resources/images/etc/check.ico" />
 <style>
  .reply { border-style:none; width: 70px; height:35px; background-color:#2d70be; font-weight:bold; color:#fff; cursor: pointer;}
 </style>
 <!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
<script src="/resources/js/summernote.js"></script>
</head>
<body>
	<!-- input 태그의 속성값이 file이면 enctype을 사용해서 multipart써줘야 서버가 인식을한다. -->
	<form method="post" action="reply">
		<input type="hidden" name="groupNum" value="${reply.groupNum}">
		<input type="hidden" name="groupOrd" value="${reply.groupOrd}">
		<input type="hidden" name="groupDepth" value="${reply.groupDepth}">
		 
		<div>
			<label>제목:</label>
			<input type="text" name="title">
		</div>
		
		<div>
			<label>내용:</label>
			<textarea id="summernote" name="contents" rows="10" cols="140"></textarea>
		</div>
		
<!-- 		<div>
			<label>첨부파일:</label>
			<input type="file" name="attach" multiple="multiple">
		</div> -->
		<div>
			<input class="reply" type="submit" value="등록">
		</div>					
	</form>
</body>
</html>