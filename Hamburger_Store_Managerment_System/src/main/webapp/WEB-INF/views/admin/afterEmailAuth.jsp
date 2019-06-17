<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 인증</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/js/joinConfirm.js"></script>
<link href="/resources/css/email.css" rel="stylesheet" type="text/css">
<script>
	$(document).ready(function(){
		var authkey = $("#authkey").val();
		$(document).on("click", "#authGo", function(){
			$("#authSuccess").submit();
			alert("인증 완료 되었습니다.");
		})		
	})
</script>
</head>
<body>
<div class="Email">
	<h1 class="h1">이메일 본인 인증</h1>
	<form action="/admin/authSuccess" method="POST" id="authSuccess" class="classForm">
		<input type="text" name="authkey" id="authkey" class="inputEmail">
		<button type="button" id="authGo" class="certification">인증하기</button>
	</form>
</div>	
</body> 
</html>