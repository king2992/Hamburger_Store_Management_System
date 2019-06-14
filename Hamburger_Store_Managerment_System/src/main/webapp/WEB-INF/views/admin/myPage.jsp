<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 마이페이지</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/js/adminMyPage.js"></script>
<link href="/resources/css/adminMyPage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h1>이곳은 관리자 마이페이지 이다</h1>
	<div>아이디 : <input type="text" readonly="readonly" value="${admin.adminId}"id="adminId"></div>
	<div>이름 : <input type="text" readonly="readonly" value="${admin.adminName}"></div>
	<div>전화번호 : <input type="text" value="${admin.adminPhone}"></div>
	<div>
		이메일 : <input type="text" value="${admin.adminEmail}" id="adminEmail"> 
		<c:choose>
			<c:when test="${admin.authstatus eq 'y_auth' }">
				<p>본인 인증 완료 된 계정입니다. </p>
			</c:when>
			<c:otherwise>
				<p>본인 인증을 진행해주세요.</p>
				<button type="button" id="emailAuth">인증하기</button>
			</c:otherwise>
		</c:choose>
	</div>
	<div>
		사업자 등록 번호 : <input type="text">-<input type="text">-<input type="text">
		<button type="button">등록하기</button>
	</div>
	<div>등록상태 : <p>미등록</p></div>
	<div><button type="button">개인정보 변경</button></div>
</body> 
</html>