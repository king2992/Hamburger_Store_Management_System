<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="update">
		<div>
			<label>상품번호:</label> <input name="pNumber" type="text"
				value="${item.bookid}" readonly>
		</div>
		<div>
			<label>상품명:</label> <input name="pName" type="text"
				value="${item.pName}">
		</div>
		<div>
			<label>가격:</label> <input name="pPirce" type="text"
				value="${item.pPrice}">
		</div>
		<div>
			<label>수량:</label> <input name="pAccount" type="text"
				value="${item.pAccount}">
		</div>
		<div>
			<label>총 금액:</label> <input name="pTotal" type="text"
				value="${item.pTotal}">
		</div>
		<div>
			<input type="submit" value="등록">
		</div>
	</form>
</body>
</html>