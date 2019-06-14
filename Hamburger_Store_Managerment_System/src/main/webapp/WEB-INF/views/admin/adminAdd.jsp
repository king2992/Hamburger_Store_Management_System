<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원가입</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/js/adminAdd.js"></script>
<link href="/resources/css/adminAdd.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container">
	<form action="/admin/adminSignUp" method="POST" id="frm">
	<a href="/"><span class="close-buttonupAdd">&times;</span></a>
		<h2 class="adminTitle">관리자 회원가입</h2>
	 	<a href="#"><button type="button" id="idCk" class="check">중복체크</button></a>
	 	<!-- 아이디 -->
		<input type="text" class="input inputId" name="adminId" placeholder="ID"  id="adminId">
	 	<p id="idCheck"></p>
	 	<!-- 비밀번호-->
		<input type="password" class="input" name="adminPassword" placeholder="password" id="adminPassword">
		<p id="pwCheck"></p>
		<!-- 이름-->
	 	<input type="text" class="input" name="adminName" placeholder="your name" id="adminName" >
		<p id="nameCheck"></p>
		<!-- 전화번호-->
		<div class="phoneDiv">
		<select class="selectPhone" style="width: 90px;" name="adminPhoneFirst">
		 	<option value="010">010</option>
		</select> -
		<input type="text" class="selectPhone" name="adminPhoneCenter" style="ime-mode:disabled; height:20px;" id="adminPhoneCenter"> -
		<input type="text" class="selectPhone" name="adminPhoneLast" id="adminPhoneLast" style="ime-mode:disabled; height:20px;" >
		</div>
		<p id="phoneCheck"></p>
		<!-- 이메일 -->
		<div class="emailDiv">
			<input type="text" name="adminEmailFirst" class="email" placeholder="e-mail"> @ <input type="text" name="adminEmailLast" class="email">
		</div>
	</form>
		 	<button type="button" class="adminSignUp">회원가입</button>
</div>		 	 
</body> 
</html>