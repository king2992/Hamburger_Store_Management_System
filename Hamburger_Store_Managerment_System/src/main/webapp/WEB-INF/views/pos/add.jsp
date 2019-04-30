<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포스기(관리자)</title>
</head>
<body>
		<form method="post" action="add">
		<div>
			<label>상품명:</label> <input name="pName" type="text">
		</div>
		<!-- <div>
			<label>수량:</label> <input name="pAccount" type="number">
		</div> -->
		<div>
			<label>가격:</label> <input name="pPrice" type="text">
		</div>
		<div>
			<input type="submit" value="등록">
		</div>
	</form>
</body>
</html>