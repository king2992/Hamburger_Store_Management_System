<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<script>
	function Login(){
		var signIn = document.signIn;
		var userId = document.userId;
		var userPassword = document.userPassword;
		
		if(signIn.userId.value == ""){
			alert("아이디를 입력해주세요.");
		}else if(signIn.userPassword.value == ""){
			alert("비밀번호를 입력해주세요.")
		}else if(signIn.userId.value != "" && signIn.userPassword.value != ""){
			signIn.submit();
			alert("환영합니다.");
		}		
	}

</script> 
<link rel="stylesheet" href="/resources/css/mainR.css">
<link rel="stylesheet" href="/resources/css/sub.css"> 
<script src="/resources/js/mainR.js"></script> 
</head>
<body>



</body>
</html>