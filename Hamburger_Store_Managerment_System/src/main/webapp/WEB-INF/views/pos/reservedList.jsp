<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 내역</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/reservedList.js"></script>
 <script src='/resources/fullcalendar-4.0.2/packages/core/main.js'></script>
<script src='/resources/fullcalendar-4.0.2/packages/daygrid/main.js'></script>
<script src='/resources/fullcalendar-4.0.2/packages/timegrid/main.js'></script>
<script src='/resources/fullcalendar-4.0.2/packages/interaction/main.js'></script>
<link href='/resources/fullcalendar-4.0.2/packages/core/main.css' rel='stylesheet'/>
<link href='/resources/fullcalendar-4.0.2/packages/daygrid/main.css' rel='stylesheet'/>
</head>
<body>
	<h1>예약 내역</h1>
	
	<table border="1">
			<tr>
				<th>주문번호</th>
				<th>주문날짜</th>
				<th>주문금액</th>
				<th>예약상세</th>
				<th>상태</th>
			</tr>
			<tbody class="reservedContainer">
	<c:choose>
		<c:when test="${orders.size() > 0 }">
			<c:forEach items="${orders}" var="orders">
			
			<tr>
				<td class="reservedOrderId">${orders.orderId}</td>
				<td>${orders.regDate} ${orders.regTime} </td>
				<td>${orders.payTotal}</td>
				<td data-tooltip-text="예약내역 확인하기"><button type='button' class="reservedCheck">예약 메뉴 확인</button></td>
				<td>상품 준비 중 <button type="button" class="orderReady">조리완료</button></td>
			</tr>
			
			</c:forEach>
		</c:when>
		<c:otherwise>
			<p>예약 내역이 없습니다.</p>
		</c:otherwise>
	</c:choose>
	</tbody>
	</table>
		<ul class="reservedCheckList">
		</ul>
		<div id="calendar"></div>
</body>
<style>
[data-tooltip-text]:hover {
	position: relative;
}

[data-tooltip-text]:hover:after {
	background-color: #000000;
	background-color: rgba(0, 0, 0, 0.8);

	-webkit-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	-moz-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);

	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;

	color: #FFFFFF;
	font-size: 12px;
	content: attr(data-tooltip-text);

  margin-bottom: 10px;
	top: 130%;
	left: 0;    
	padding: 20px 40px;
	position: absolute;
	width: auto;
	min-width: 50px;
	max-width: 300px;
/* 	word-wrap: break-word; */

	z-index: 9999;
}
</style>
</html>