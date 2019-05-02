<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예매완료</title>
     <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
    </script>

</head>
<body>

<h3>${sessionScope.user}님의 예매내역입니다.</h3>
	<c:choose>
		<c:when test="${ticketingList.size() > 0}">
			<c:forEach var="list" items="${ticketingList}">
				<ul> 
					<li>${list.id}님 예매완료 </li>
					<li>좌석 : ${list.seatName}</li>
					<li>날짜 : ${list.reservedDate}</li>
					<li>금액 : ${list.ticketPrice}</li>
					<li>시간 : ${list.reservedTime}</li>
				</ul>   
			</c:forEach>
		</c:when>  
		
		<c:otherwise>예약 내역이 없습니다.</c:otherwise> 
	</c:choose>
<div>
<a href="/">홈으로</a>
</div>
</body>
</html>