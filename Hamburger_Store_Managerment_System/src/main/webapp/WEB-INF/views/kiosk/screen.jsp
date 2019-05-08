<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kiosk First Web Screen</title>
</head>
<link rel="stylesheet" type="text/css" href="${path}/resources/kiosk/css/screen.css">
<script type="text/javascript" src="${path}/resources/kiosk/js/main.js"></script>
<body>
<!-- 배경 이미지 영역 -->
	<div class="body_image">
<!-- 	카테고리 바깥 영역 -->
	<div class="kategorie_div">
<!-- 	카테고리 안쪽 영역 -->
		<nav>
			<ul class="List_ul">
				<li><button class="ListBtn" type="button" onclick="#">추천메뉴</button></li>
				<li><button class="ListBtn" type="button" onclick="burgerList()">햄버거</button></li>
				<li><button class="ListBtn" type="button" onclick="chicken()">디저트/치킨</button></li>
				<li><button class="ListBtn" type="button" onclick="coffee()">음료/커피</button></li>
				<li><button class="ListBtn" type="button" onclick="side()">사이드/기타</button></li>
			</ul>
		</nav>
	</div>
<!-- 	주문메뉴  큰 영역  -->
	<div class="order_div">
<!-- 	주문메뉴 list 영역 -->
		<div class="center-wrap">
<!-- 		메뉴 ul -->
			<ul class="menu_list">
				<li><img class="buger" src="${path}/resources/img/burger/20170227485176.jpg"></li>
				<li><img class="buger" src="${path}/resources/img/burger/20170412442355.jpg"></li>
				<li><img class="buger" src="${path}/resources/img/burger/20180220459667.jpg"></li>
				<li><img class="buger" src="${path}/resources/img/burger/20180416932721.jpg"></li>
				<li><img class="buger" src="${path}/resources/img/burger/20180704461546.jpg"></li>
				<li><img class="buger" src="${path}/resources/img/burger/20181026165774.jpg"></li>
				<li><img class="buger" src="${path}/resources/img/burger/20190328995768.jpg"></li>
				<li><img class="buger" src="${path}/resources/img/burger/increderble.jpg"></li>
			</ul>
			<div class="order_history_div">
				<ul class="order_history_ul">
					<li>주문내역</li>
					<li>수량내역</li>
					<li>금액내역</li>
				</ul>
			</div>
			<div class="order">
				
			</div>
		</div>
	</div>
	</div>
</body>
</html>