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
	<form action="#" method="POST" name="" id="" enctype="multipart/form-data">
		<h2 class="adminTitle">관리자 회원가입</h2>
	 	<button type="button" onClick="idCk()" class="check">중복체크</button>
		<input type="text" class="input" name="userId" placeholder="ID"  id="userId">
	 	<p id="idCheck"></p>
	 	
		<input type="password" class="input" name="userPassword" placeholder="password" id="userPassword">
		<p id="pwCheck"></p>
		
	 	<input type="text" class="input" name="userName" placeholder="your name" id="userName" >
		<p id="nameCheck"></p>
		
		<div class="phoneDiv">
		<select class="selectPhone" style="width: 90px;">
		 	<option value="010">010</option>
		</select> -
		<input type="text" class="selectPhone" name="userPhone1" style="ime-mode:disabled; height:20px;" id="userPhone1"> -
		<input type="text" class="selectPhone" name="userPhone2" id="userPhone2" style="ime-mode:disabled; height:20px;" >
		</div>
		<p id="phoneCheck"></p>
		
	 	<div class="emilDiv"><input type="text"class="emil" placeholder="emil"> @ <input type="text"class="emil"></div>
	 	<button type="button" class="emil_check">이메일 본인 인증</button>
	 	
	 	<p class="buisnessNum"><span style="color:red; font-size:15px;">*</span> 사업자 등록 번호</p>
		<div class="phoneDiv">
		<select class="selectPhone" style="width: 90px;">
		 	<option value="010">010</option>
		</select> -
		<input type="text" class="selectPhone" name="userPhone1" style="ime-mode:disabled; height:20px;" id="userPhone1"> -
		<input type="text" class="selectPhone" name="userPhone2" id="userPhone2" style="ime-mode:disabled; height:20px;" >
		</div>
		
		<button type="button" class="Num_check">등록 번호 인증</button>
	 	<button type="button" class="adminSingup">회원가입</button> 
	</form>
</body> 
</html>