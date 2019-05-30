<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보변경</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/personalInfomationChange.js"></script>
<link rel="stylesheet" href="/resources/css/personalInfomationChange.css">
</head>
<body>
	<h2>개인정보변경</h2>
	<ul>
		<li><span class="userId">아이디 : ${user.userId}</span></li>
		<li><span>비밀번호 : <input type="password" class="userPw"></span><button type="button" class="pwChange">비밀번호 변경</button></li>
		<li><span>전화번호 : <input type="text" value="${user.userPhone}"  class="userPhone"></span></li>
		<li><span>이름 : <input type="text" value="${user.userName}" class="userName"></span></li>
	</ul>
	<button type="button" id="userInfoUpdate">변경하기</button>
	<button type="button" id="userPayCardUpdate">카드등록</button>
	<!-- Trigger/Open The Modal -->
 
    <!-- The Modal -->
    <div id="myModal" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close">&times;</span>                                                               
     <ul class="pwUpdate">
		<li><span>현재 비밀번호<input type="password" class="nowPw"></span></li>
		<li><span>새 비밀번호<input type="password" class="newPw"></span></li>
		<li><span>새 비밀번호 확인<input type="password" class="newPwCheck"></span></li>
	</ul>
	<div><button type="button" class="pwUpSubmit">변경하기</button></div>
      </div>
 
    </div>
    
		
</body>
</html>