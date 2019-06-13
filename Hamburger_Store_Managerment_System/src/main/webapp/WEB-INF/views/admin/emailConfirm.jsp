<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 인증</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/js/joinConfirm.js"></script>
<link href="/resources/css/adminAdd.css" rel="stylesheet" type="text/css">
<script>
	$(document).ready(function(){
		$(document).on("click", "#authGo", function(){
			$("#authSuccess").submit();
		})
	});
</script>
</head>
<body>
	<h1>이메일 본인 인증</h1>
	<form action="/admin/authSuccess" method="POST" id="authSuccess">
		<input type="text" name="authkey">
		<button type="button" id="authGo">인증하기</button>
	</form>
</body> 
</html>