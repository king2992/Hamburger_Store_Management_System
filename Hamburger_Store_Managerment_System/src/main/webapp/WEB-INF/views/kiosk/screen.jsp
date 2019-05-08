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
	<%-- <div class="header_div">
		<img src="${path}/resources/kiosk/images/Hamburger_kiosk_first_screen.jpg">
	</div> --%>
<!-- 	카테고리 영역 -->
	<div class="image_out_div"></div>
	<div class="kategorie_div">
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
<!-- 	주문메뉴 영역 -->
	<div class="side_left"></div>
	<div class="order_div">
		<div class="center-wrap">
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
		<h1>주문내역 H1 태그 위치확인</h1>
	</div>
		</div>
	
	</div> 
	
</body>
</html>