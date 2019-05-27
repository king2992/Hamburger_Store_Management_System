<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>

</head>
<body>
	<h1>회원탈퇴</h1>
	<h2>사용하고 계신 아이디(${userId})는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</h2>
	<h3>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</h3>
	 
	<ul>
		<li>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</li>
		<li>탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</li>
	</ul>
	
	<button type="button" id="withdrawal">회원탈퇴</button>
</body>
</html>