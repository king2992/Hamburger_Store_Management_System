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
	<div> 
<!-- 	카테고리 안쪽 영역 -->
		<nav>
			<ul class="tab_btn">
				<li><button class="ListBtn" type="button">전체 메뉴</button></li>
				<li><button class="ListBtn" type="button">치킨 메뉴</button></li>
				<li><button class="ListBtn" type="button">버거 메뉴</button></li>
				<li><button class="ListBtn" type="button">사이드 메뉴</button></li>
				<li><button class="ListBtn" type="button">음료류</button></li>
			</ul>
		</nav>
	</div>
<!-- 	주문메뉴  큰 영역  -->
	<div class="order_div">
<!-- 	주문메뉴 list 영역 -->
		<div class="center-wrap">
<!-- 		메뉴 ul -->
<!-- 			전체메뉴 -->
			<div>
				<ul class="tab_cont">
					<li><img src="${path}/resources/img/chickenMenu/chiPao.jpg"><p>치파오</p></li>
					<li><img src="${path}/resources/img/chickenMenu/chiPaOChicken.jpg"><p>치파오 치킨</p></li>
					<li><img src="${path}/resources/img/chickenMenu/jjimHatDag.jpg"><p>찜햇닭</p></li>
					<li><img src="${path}/resources/img/chickenMenu/JjimHatDagGangJung.jpg"><p>찜햇닭 강정</p></li>
					<li><img src="${path}/resources/img/chickenMenu/JjimHatDagWing.jpg"><p>찜햇닭 윙</p></li>
					<li><img src="${path}/resources/img/chickenMenu/masillaChicken.jpg"><p>마살라 치킨</p></li>
					<li><img src="${path}/resources/img/chickenMenu/masillaTender.jpg"><p>마살라 텐더</p></li>
					<li><img src="${path}/resources/img/chickenMenu/masillaWing.jpg"><p>마살라 윙</p></li>
					<li><img src="${path}/resources/img/burger/20170227485176.jpg"><p>불갈비 치킨버거</p></li>
					<li><img src="${path}/resources/img/burger/20170412442355.jpg"><p>불싸이 버거</p></li>
					<li><img src="${path}/resources/img/burger/20180220459667.jpg"><p>치킨커틀렛 버거</p></li>
					<li><img src="${path}/resources/img/burger/20180416932721.jpg"><p>치즈베이컨 버거</p></li>
					<li><img src="${path}/resources/img/burger/20180704461546.jpg"><p>마살라치킨 버거</p></li>
					<li><img src="${path}/resources/img/burger/20181026165774.jpg"><p>인크레더블 버거</p></li>
					<li><img src="${path}/resources/img/burger/20190328995768.jpg"><p>언빌리버블 버거</p></li>
					<li><img src="${path}/resources/img/burger/increderble.jpg"><p>딥치즈 버거</p></li>
					<li><img src="${path}/resources/img/sideMenu/20170331173889.jpg"><p>할라피뇨 너겟</p></li>
					<li><img src="${path}/resources/img/sideMenu/20170821851383.jpg"><p>치즈할라피뇨 너겟</p></li>
					<li><img src="${path}/resources/img/sideMenu/20171120319875.jpg"><p>치즈감자</p></li>
					<li><img src="${path}/resources/img/sideMenu/20171120979582.jpg"><p>어니언치즈 감자</p></li>
					<li><img src="${path}/resources/img/sideMenu/20180704788027.jpg"><p>라이스&치즈너겟</p></li>
					<li><img src="${path}/resources/img/sideMenu/20180903624821.jpg"><p>콘베지 샐러드</p></li>
					<li><img src="${path}/resources/img/sideMenu/20180903730621.jpg"><p>베지샐러드</p></li>
					<li><img src="${path}/resources/img/sideMenu/20181026154178.jpg"><p>에그랩(2종)</p></li>
					<li><img src="${path}/resources/img/drink/20150223992319.jpg"><p>콜라</p></li>
					<li><img src="${path}/resources/img/drink/20161129735987.jpg"><p>라떼류</p></li>
					<li><img src="${path}/resources/img/drink/20170825874361.jpg"><p>스트로베리밀크</p></li>
					<li><img src="${path}/resources/img/drink/20180220231170.jpg"><p>레몬티</p></li>
					<li><img src="${path}/resources/img/drink/20180220239529.jpg"><p>레몬에이드</p></li>
					<li><img src="${path}/resources/img/drink/20180416547805.jpg"><p>딸기크림빙수</p></li>
					<li><img src="${path}/resources/img/drink/20181113571936.jpg"><p>레몬홍차</p></li>
					<li><img src="${path}/resources/img/drink/20181113609096.jpg"><p>홍차</p></li>
				</ul>
			</div>
<!-- 			햄버거 메뉴 -->
			<div  class="hide">
				<ul class="tab_cont">
					<li><img src="${path}/resources/img/chickenMenu/chiPao.jpg"><p>치파오</p></li>
					<li><img src="${path}/resources/img/chickenMenu/chiPaOChicken.jpg"><p>치파오 치킨</p></li>
					<li><img src="${path}/resources/img/chickenMenu/jjimHatDag.jpg"><p>찜햇닭</p></li>
					<li><img src="${path}/resources/img/chickenMenu/JjimHatDagGangJung.jpg"><p>찜햇닭 강정</p></li>
					<li><img src="${path}/resources/img/chickenMenu/JjimHatDagWing.jpg"><p>찜햇닭 윙</p></li>
					<li><img src="${path}/resources/img/chickenMenu/masillaChicken.jpg"><p>마살라 치킨</p></li>
					<li><img src="${path}/resources/img/chickenMenu/masillaTender.jpg"><p>마살라 텐더</p></li>
					<li><img src="${path}/resources/img/chickenMenu/masillaWing.jpg"><p>마살라 윙</p></li>
				</ul>
			</div>
<!-- 			치킨 메뉴 -->
			<div  class="hide">
				<ul class="tab_cont">
					<li><img src="${path}/resources/img/burger/20170227485176.jpg"><p>불갈비 치킨버거</p></li>
					<li><img src="${path}/resources/img/burger/20170412442355.jpg"><p>불싸이 버거</p></li>
					<li><img src="${path}/resources/img/burger/20180220459667.jpg"><p>치킨커틀렛 버거</p></li>
					<li><img src="${path}/resources/img/burger/20180416932721.jpg"><p>치즈베이컨 버거</p></li>
					<li><img src="${path}/resources/img/burger/20180704461546.jpg"><p>마살라치킨 버거</p></li>
					<li><img src="${path}/resources/img/burger/20181026165774.jpg"><p>인크레더블 버거</p></li>
					<li><img src="${path}/resources/img/burger/20190328995768.jpg"><p>언빌리버블 버거</p></li>
					<li><img src="${path}/resources/img/burger/increderble.jpg"><p>딥치즈 버거</p></li>
				</ul>
			</div>
<!-- 			사이드 메뉴 -->
			<div  class="hide">
				<ul class="tab_cont">
					<li><img src="${path}/resources/img/sideMenu/20170331173889.jpg"><p>할라피뇨 너겟</p></li>
					<li><img src="${path}/resources/img/sideMenu/20170821851383.jpg"><p>치즈할라피뇨 너겟</p></li>
					<li><img src="${path}/resources/img/sideMenu/20171120319875.jpg"><p>치즈감자</p></li>
					<li><img src="${path}/resources/img/sideMenu/20171120979582.jpg"><p>어니언치즈 감자</p></li>
					<li><img src="${path}/resources/img/sideMenu/20180704788027.jpg"><p>라이스&치즈너겟</p></li>
					<li><img src="${path}/resources/img/sideMenu/20180903624821.jpg"><p>콘베지 샐러드</p></li>
					<li><img src="${path}/resources/img/sideMenu/20180903730621.jpg"><p>베지샐러드</p></li>
					<li><img src="${path}/resources/img/sideMenu/20181026154178.jpg"><p>에그랩(2종)</p></li>
				</ul>
			</div>
<!-- 			음료류 -->
			<div  class="hide">
				<ul class="tab_cont">
					<li><img src="${path}/resources/img/drink/20150223992319.jpg"><p>콜라</p></li>
					<li><img src="${path}/resources/img/drink/20161129735987.jpg"><p>라떼류</p></li>
					<li><img src="${path}/resources/img/drink/20170825874361.jpg"><p>스트로베리밀크</p></li>
					<li><img src="${path}/resources/img/drink/20180220231170.jpg"><p>레몬티</p></li>
					<li><img src="${path}/resources/img/drink/20180220239529.jpg"><p>레몬에이드</p></li>
					<li><img src="${path}/resources/img/drink/20180416547805.jpg"><p>딸기크림빙수</p></li>
					<li><img src="${path}/resources/img/drink/20181113571936.jpg"><p>레몬홍차</p></li>
					<li><img src="${path}/resources/img/drink/20181113609096.jpg"><p>홍차</p></li>
				</ul>
			</div>
		</div>
<!-- 			주문/갯수/금액 내역 영역 -->
			<div class="order_list_wrap">
			<div class="order_list_div">
				<p>메뉴를 선택해주세요.</p>
				<div class="order_list_view">
				<h1 style="color:white;">주문내역</h1>
				</div>
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