<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 현황 판</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/orderDisplay.js"></script>
<style>
*{margin:0; padding:0;}
ul li{list-style: none; display:inline-block;}
	.container{width:100%; margin: 0 auto;}
	.center-wrap{width: 1024px; margin: 0 auto;}
	.center-wrap > h1 {text-align: center; margin-top:60px; }
	#orderListCenter{display: table; width:100%; border:1px solid #dddddd; margin-top:60px;}
	/* #orderList li:nth-child(4n){} */
	#orderListCenter > li{ font-size:35px; width:50%; display:table-cell; text-align: center; border-right:1px solid #dddddd;}
/* 	#orderList li:nth-child(4n) {border-right:1px solid #dddddd;}
	#orderList li:nth-child(3n) {border-left:1px solid #dddddd;}
	#orderList li:nth-child(6n){border:none;} */
	#orderListCenter h1{font-size: 40px; border-bottom:1px solid #dddddd; padding-bottom:20px; padding-top:20px; background-color: #eeeeee; width:100%; color:#808080; display:inline-block; text-align: center;}
	/* #orderList h1:first-child {border-right:1px solid #dddddd;} */
	#orderListReady li,#orderListFinish li{width:48%; text-align: center; float: left; padding-top:30px; padding-bottom:30px;}
	
</style>
</head>
<body>
	<div class="container">
	<div class="center-wrap">
	<h1>주문번호를 확인해주세요.</h1>
<!-- 	<ul id="orderList">
	</ul> -->
	<ul id="orderListCenter">
		<li>
		<h1>제품을<br>준비중 입니다.</h1>
		<ul id="orderListReady">
			<c:choose>
		<c:when test="${list.size() > 0 }">
			<c:forEach items="${list}" var="list">
			<li>${list.orderId}</li>
			</c:forEach>
			</c:when>
			<c:otherwise>
			</c:otherwise>
			</c:choose>
		</ul>
		</li>
		
		<li>
		<h1>주문하신<br>제품이 나왔습니다.</h1>
		<ul id="orderListFinish">
				<c:choose>
		<c:when test="${successList.size() > 0 }">
			<c:forEach items="${successList}" var="list">
			<li>${list.orderId}</li>
			</c:forEach>
			</c:when>
			<c:otherwise>
			</c:otherwise>
			</c:choose>
		</ul>
	</ul>
	</div>
	</div>
</body>
</html>