<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테이크 아웃 예약 내역</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/userTakeoutReservedLIst.js"></script>
</head>
<body>
	<table class="reserved-table">
			<tr>
				<th>주문날짜</th>
				<th>주문시간</th>
				<th>예약자 명</th>
				<th>예약자 전화번호</th>
				<th>지점</th>
			</tr>
			<tbody class="reservedContainer">
	<c:choose>
		<c:when test="${list.size() > 0 }">
			<c:forEach items="${list}" var="list">
			<tr>
				<td>${list.reservedDate}</td>
				<td>${list.reservedTime}</td>
				<td>${list.reservedName}</td>
				<td>${list.reservedPhone}</td>
				<td>${list.frcName}<button type="button" class="reservedCheck" data-takeoutid="${list.takeoutId}">
				예약 내역 확인</button></td>
			</tr> 
			</c:forEach>
		</c:when>
	</c:choose>
	</tbody>
	</table>
	<div>
		<ul id="reservedCheckList">
		</ul>
	</div>
</body>
</html>