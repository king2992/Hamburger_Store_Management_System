<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="/resources/css/adminAdd.css" rel="stylesheet" type="text/css">
<script>
	$(document).ready(function(){
		$(document).on("click", "#adminLogin" , function(){
			var adminId = $("#adminId").val();
			var adminPassword = $("#adminPassword").val();
			console.log(adminId);
			console.log(adminPassword);
			$.ajax({
				url :"/admin/adminLogin",
				type : "POST",
				data : {adminId: adminId, adminPassword:adminPassword},
				success : function(data){
					console.log(data);
					if(data == "auth"){
						alert("이메일 인증을 진행해주세요.");
						location.href="/admin/myPage";
					}else if(data == "loginSuccess"){
						alert("환영합니다.");
						location.href="/";
					}else if(data == "noId"){
						alert("아이디 또는 비밀번호를 확인해주세요.");
						$("#adminId").val("");
						$("#adminPassword").val("");
					}else if(data == 1){
						alert("호로로로");
					}
				}
			})
		});
	})
</script>
</head>
<body>
	<div><span>아이디 : <input type="text" name="adminId" id="adminId"></span></div>
	<div><span>비밀번호 : <input type="password" name="adminPassword" id="adminPassword"></span></div>
	<div><button type="button" id="adminLogin">로그인</button></div>
</body> 
</html>