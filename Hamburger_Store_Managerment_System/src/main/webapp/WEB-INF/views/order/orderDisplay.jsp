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
	body{background:black; color:white;}
	.container{width:100%; margin: 0 auto;}
	.center-wrap{width: 1024px; margin: 0 auto;}
	.center-wrap > h1 {text-align: center;}
	#orderListCenter{display: table; width:100%; border:2px solid #dddddd; margin-top:60px;}
	/* #orderList li:nth-child(4n){} */
	#orderListCenter > li{ font-size:35px;  display:table-cell; text-align: center; border-right:1px solid #dddddd;}
/* 	#orderList li:nth-child(4n) {border-right:1px solid #dddddd;}
	#orderList li:nth-child(3n) {border-left:1px solid #dddddd;}
	#orderList li:nth-child(6n){border:none;} */
	#orderListCenter h1{font-size: 40px;  padding-top:20px; background-color: #eeeeee; width:100%; color:#808080; display:inline-block; text-align: center;}
	#orderListCenter p{font-size: 18px; border-bottom:1px solid #dddddd; padding-bottom:20px; padding-top:20px; background-color: #eeeeee; width:100%; color:#808080; display:inline-block; text-align: center;}
	/* #orderList h1:first-child {border-right:1px solid #dddddd;} */
	#orderListHead{width:37%;}
	#orderListFinish li{width:47%; padding-top:5px; padding-bottom:5px; }
	#orderListFinish li{color:yellow; font-weight : 600; font-size : 100px; display : block; position:relative; left:100px; border-bottom: 1px solid #dddddd;}
/*  	#orderListFinish li:last-child {border:none;} */
	/* #orderListReady li{width:33%; padding-top:5px; padding-bottom:5px; font-weight:600; font-size : 100px;  border-bottom : 2px solid #dddddd;} */
 	#orderListReady{margin:0 auto; width: 70%;}
	#orderListReady li{ font-weight:600; font-size : 100px;}
	#orderListReady li:nth-child(odd){width: 45%; display: table-cell; float: left; border-bottom: 1px solid #dddddd;} 
	#orderListReady li:nth-child(even){width: 45%; display: table-cell; border-bottom: 1px solid #dddddd;}
	/* #orderListReady li:last-child {border:none;} */
	/* #orderListReady li:nth-last-child(1),#orderListReady li:nth-last-child(2) {border-bottom:none;} */
	</style>
	<script type="text/javascript">
	$(document).ready(function(){
			var length = $('#orderListReady > li').length;
			
			$(document).on("click","#orderListReady>li",function(){
				console.log(length)
			});
			
			if(length%2 == 0){
				$('#orderListReady li:nth-last-child(1),#orderListReady li:nth-last-child(2)').css('border-bottom','none');
			}else{
				$('#orderListReady li:nth-last-child(1)').css('border-bottom','none');
			}
	});
	</script>
</head>
<body>
	<div class="container">
	<div class="center-wrap">
	<h1>주문번호를 확인해주세요.</h1>
<!-- 	<ul id="orderList">
	</ul> -->
	<ul id="orderListCenter">
		<li id="orderListHead">
			<h1>준비 완료 | Ready</h1>
			<p>영수증 상단의 주문번호를 확인하세요.</p>
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
		</li>
		<li>
			<h1>준비 중 | Preparing</h1>
			<p>음식이 준비중이에요!</p>
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
	</ul>
	</div>
	</div>
</body>
</html>