<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 작성 한 글</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/myWritten.js"></script>
</head>
<body>
	<table class="reserved-table" border="1">
			<tr>
				<th></th>
				<th>작성일</th>
				<th>제목</th>
				<th></th>
			</tr>
			<tbody class="reservedContainer">
	<c:choose>
		<c:when test="${list.size() > 0 }">
			<c:forEach items="${list}" var="list">
			<tr>
				<td><button type="button" data-number="${list.number }">게시글 보러가기</button></td>
				<td>${list.date}</td>
				<td>${list.title}</td>
				<td><button type="button">게시글 삭제</button></td>
			</tr> 
			</c:forEach>
		</c:when>
	</c:choose>
	</tbody>
	</table>
	
</body>
</html>