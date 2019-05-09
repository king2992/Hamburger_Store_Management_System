<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kiosk First Web Screen</title>
</head>
<link rel="stylesheet" type="text/css" href="${path}/resources/kiosk/css/screen.css">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
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
				<li><button id="hamburger_list_btn" class="ListBtn" type="button">햄버거</button></li>
				<li><button id="chicken_list_btn" class="ListBtn" type="button">디저트/치킨</button></li>
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
			<ul class="hamburger_list">
				<li><img class="buger" src="${path}/resources/img/burger/20170227485176.jpg"></li>
				<li><img class="buger" src="${path}/resources/img/burger/20170412442355.jpg"></li>
				<li><img class="buger" src="${path}/resources/img/burger/20180220459667.jpg"></li>
				<li><img class="buger" src="${path}/resources/img/burger/20180416932721.jpg"></li>
				<li><img class="buger" src="${path}/resources/img/burger/20180704461546.jpg"></li>
				<li><img class="buger" src="${path}/resources/img/burger/20181026165774.jpg"></li>
				<li><img class="buger" src="${path}/resources/img/burger/20190328995768.jpg"></li>
				<li><img class="buger" src="${path}/resources/img/burger/increderble.jpg"></li>
			</ul>
			
			<ul class="chicken_list">
				<li><img class="chicken" src="${path}/resources/img/chickenMenu/chiPao.jpg"></li>
				<li><img class="chicken" src="${path}/resources/img/chickenMenu/chiPaOChicken.jpg"></li>
				<li><img class="chicken" src="${path}/resources/img/chickenMenu/jjimHatDag.jpg"></li>
				<li><img class="chicken" src="${path}/resources/img/chickenMenu/JjimHatDagGangJung.jpg"></li>
				<li><img class="chicken" src="${path}/resources/img/chickenMenu/JjimHatDagWing.jpg"></li>
				<li><img class="chicken" src="${path}/resources/img/chickenMenu/masillaChicken.jpg"></li>
				<li><img class="chicken" src="${path}/resources/img/chickenMenu/masillaTender.jpg"></li>
				<li><img class="chicken" src="${path}/resources/img/chickenMenu/masillaWing.jpg"></li>
			</ul>
		</div>
<!-- 			주문/갯수/금액 내역 영역 -->
			<div class="order_list_wrap">
			<div class="order_list_div">
				<p>메뉴를 선택해주세요.</p>
				<h1 style="color:white;">주문내역</h1>
			</div>
<!-- 			결제/취소 영역 -->
			<div class="order_payment_div">
				<button class="paymentBtn" type="button" onclick="payment()">결제</button>
				<button class="cancelBtn" type="button" onclick="cancel()">결제취소</button>
				<table class="total_table">
					<tr>
						<td>총 합계 금액 :&nbsp;&nbsp;</td>
						<td><input class="total_pay" type="text">&nbsp;원</td>
					</tr>
				</table>
			</div>
			</div>
		</div>
	</div>
	
</body>
</html>