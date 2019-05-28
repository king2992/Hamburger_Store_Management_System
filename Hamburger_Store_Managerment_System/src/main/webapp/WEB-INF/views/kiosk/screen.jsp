<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kiosk First Web Screen</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript" src="${path}/resources/kiosk/js/main.js"></script>
<link rel="stylesheet" type="text/css" href="${path}/resources/kiosk/css/screen.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<!-- <script src="sweetalert2.all.min.js"></script> -->
<!-- Optional: include a polyfill for ES6 Promises for IE11 and Android browser -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<style>
/*zoomoutdown animation*/
 .zoomOutDown {
/*    position: absolute; */
  animation-name: zoomOutDown;
  animation-duration: 1s;
  animation-fill-mode: both;
  background-image:url("/resources/img/chickenMenu/chipao.png");
  z-index: 99;
  width:240px;
  height: 200px;
  background-position: center center;
  background-repeat: no-repeat;
  background-size: contain;
  }
  @keyframes zoomOutDown {
  40% {
  opacity: 1;
  z-index: 99;
  transform: scale3d(.475, .475, .475) translate3d(0, -60px, 0);
  animation-timing-function: cubic-bezier(0.550, 0.055, 0.675, 0.190);
 
  }
  100% {
  opacity: 0;
  transform: scale3d(.1, .1, .1) translate3d(0, 2000px, 0);
  transform-origin: center bottom;
  animation-timing-function: cubic-bezier(0.175, 0.885, 0.320, 1);
  }
 } 

</style>
<body>
<!-- 배경 이미지 영역 -->
	<div class="body_image">
<!-- 	카테고리 바깥 영역 -->
	<div class="background-image"> 
<!-- 	카테고리 안쪽 영역 -->
		<nav>
			<ul class="tab_btn">
				<li><button class="ListBtn btn1" type="button">전체 메뉴</button></li>
				<li><button class="ListBtn btn2" type="button">치킨 메뉴</button></li>
				<li><button class="ListBtn btn3" type="button">버거 메뉴</button></li>
				<li><button class="ListBtn btn4" type="button">사이드 메뉴</button></li>
				<li><button class="ListBtn btn5" type="button">음료류</button></li>
			</ul>
		</nav>
	</div>
<!-- 	주문메뉴  큰 영역  -->
	<div class="order_div">
<!-- 	주문메뉴 list 영역 -->
		<div class="center-wrap">
		<h2>주문하실 메뉴를 선택하신 후 <span class="title-span">장바구니에 담아</span></h2>
		<h2>한번에 주문<span class="title-span">하실 수 있습니다.</span></h2>
<!-- 		메뉴 ul -->
<!-- 			전체메뉴 -->
			<div>
				<ul class="tab_cont">
					<li><img data-menuname="치파오" data-price="10000" src="${path}/resources/img/chickenMenu/chiPao.jpg"><div class="addclass" style="position: absolute;"></div><p>치파오</p><p class="price_p">10000</p></li>
					<li><img data-menuname="치파오 치킨" data-price="10000" src="${path}/resources/img/chickenMenu/chiPaOChicken.jpg"><p>치파오 치킨</p><p class="price_p">10000</p></li>
					<li><img data-menuname="찜햇닭" data-price="10000" src="${path}/resources/img/chickenMenu/jjimHatDag.jpg"><p>찜햇닭</p><p class="price_p">10000</p></li>
					<li><img data-menuname="찜햇닭 강정" data-price="10000" src="${path}/resources/img/chickenMenu/JjimHatDagGangJung.jpg"><p>찜햇닭 강정</p><p class="price_p">10000</p></li>
					<li><img data-menuname="찜햇닭 윙" data-price="10000" src="${path}/resources/img/chickenMenu/JjimHatDagWing.jpg"><p>찜햇닭 윙</p><p class="price_p">10000</p></li>
					<li><img data-menuname="마살라 치킨" data-price="10000" src="${path}/resources/img/chickenMenu/masillaChicken.jpg"><p>마살라 치킨</p><p class="price_p">10000</p></li>
					<li><img data-menuname="마살라 텐더" data-price="10000" src="${path}/resources/img/chickenMenu/masillaTender.jpg"><p>마살라 텐더</p><p class="price_p">10000</p></li>
					<li><img data-menuname="마살라 윙" data-price="10000" src="${path}/resources/img/chickenMenu/masillaWing.jpg"><p>마살라 윙</p><p class="price_p">10000</p></li>
					<li><img data-menuname="불갈비 치킨 버거" data-price="10000" src="${path}/resources/img/burger/20170227485176.jpg"><p>불갈비 치킨버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="불싸이 버거" data-price="10000" src="${path}/resources/img/burger/20170412442355.jpg"><p>불싸이 버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="치킨커틀렛 버거" data-price="10000" src="${path}/resources/img/burger/20180220459667.jpg"><p>치킨커틀렛 버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="치즈베이컨 버거" data-price="10000" src="${path}/resources/img/burger/20180416932721.jpg"><p>치즈베이컨 버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="마살라 치킨" data-price="10000" src="${path}/resources/img/burger/20180704461546.jpg"><p>마살라치킨 버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="인크레더블 버거" data-price="10000" src="${path}/resources/img/burger/20181026165774.jpg"><p>인크레더블 버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="언빌리버블 버거" data-price="10000" src="${path}/resources/img/burger/20190328995768.jpg"><p>언빌리버블 버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="딥치즈 버거" data-price="10000" src="${path}/resources/img/burger/increderble.jpg"><p>딥치즈 버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="할라피뇨 너겟" data-price="10000" src="${path}/resources/img/sideMenu/20170331173889.jpg"><p>할라피뇨 너겟</p><p class="price_p">10000</p></li>
					<li><img data-menuname="치즈할라피뇨 너겟" data-price="10000" src="${path}/resources/img/sideMenu/20170821851383.jpg"><p>치즈할라피뇨 너겟</p><p class="price_p">10000</p></li>
					<li><img data-menuname="치즈감자" data-price="10000" src="${path}/resources/img/sideMenu/20171120319875.jpg"><p>치즈감자</p><p class="price_p">10000</p></li>
					<li><img data-menuname="어니언치즈 감자" data-price="10000" src="${path}/resources/img/sideMenu/20171120979582.jpg"><p>어니언치즈 감자</p><p class="price_p">10000</p></li>
					<li><img data-menuname="라이스&치즈너겟" data-price="10000" src="${path}/resources/img/sideMenu/20180704788027.jpg"><p>라이스&amp;치즈너겟</p><p class="price_p">10000</p></li>
					<li><img data-menuname="콘베지 샐러드" data-price="10000" src="${path}/resources/img/sideMenu/20180903624821.jpg"><p>콘베지 샐러드</p><p class="price_p">10000</p></li>
					<li><img data-menuname="베지 샐러드" data-price="10000" src="${path}/resources/img/sideMenu/20180903730621.jpg"><p>베지샐러드</p><p class="price_p">10000</p></li>
					<li><img data-menuname="에그랩(2종)" data-price="10000" src="${path}/resources/img/sideMenu/20181026154178.jpg"><p>에그랩(2종)</p><p class="price_p">10000</p></li>
					<li><img data-menuname="콜라" data-price="10000" src="${path}/resources/img/drink/20150223992319.jpg"><p>콜라</p><p class="price_p">10000</p></li>
					<li><img data-menuname="라떼류" data-price="10000" src="${path}/resources/img/drink/20161129735987.jpg"><p>라떼류</p><p class="price_p">10000</p></li>
					<li><img data-menuname="스트로베리밀크" data-price="10000" src="${path}/resources/img/drink/20170825874361.jpg"><p>스트로베리밀크</p><p class="price_p">10000</p></li>
					<li><img data-menuname="레몬티" data-price="10000" src="${path}/resources/img/drink/20180220231170.jpg"><p>레몬티</p><p class="price_p">10000</p></li>
					<li><img data-menuname="레몬에이드" data-price="10000" src="${path}/resources/img/drink/20180220239529.jpg"><p>레몬에이드</p><p class="price_p">10000</p></li>
					<li><img data-menuname="딸기크림빙수" data-price="10000" src="${path}/resources/img/drink/20180416547805.jpg"><p>딸기크림빙수</p><p class="price_p">10000</p></li>
					<li><img data-menuname="레몬홍차" data-price="10000" src="${path}/resources/img/drink/20181113571936.jpg"><p>레몬홍차</p><p class="price_p">10000</p></li>
					<li><img data-menuname="홍차" data-price="10000" src="${path}/resources/img/drink/20181113609096.jpg"><p>홍차</p><p class="price_p">10000</p></li>
				</ul>
			</div>
<!-- 			햄버거 메뉴 -->
			<div  class="hide">
				<ul class="tab_cont">
					<li><img data-menuname="치파오" data-price="10000" src="${path}/resources/img/chickenMenu/chiPao.jpg"><p>치파오</p><p class="price_p">10000</p></li>
					<li><img data-menuname="치파오 치킨" data-price="10000" src="${path}/resources/img/chickenMenu/chiPaOChicken.jpg"><p>치파오 치킨</p><p class="price_p">10000</p></li>
					<li><img data-menuname="찜햇닭" data-price="10000" src="${path}/resources/img/chickenMenu/jjimHatDag.jpg"><p>찜햇닭</p><p class="price_p">10000</p></li>
					<li><img data-menuname="찜햇닭 강정" data-price="10000" src="${path}/resources/img/chickenMenu/JjimHatDagGangJung.jpg"><p>찜햇닭 강정</p><p class="price_p">10000</p></li>
					<li><img data-menuname="찜햇닭 윙" data-price="10000" src="${path}/resources/img/chickenMenu/JjimHatDagWing.jpg"><p>찜햇닭 윙</p><p class="price_p">10000</p></li>
					<li><img data-menuname="마살라 치킨" data-price="10000" src="${path}/resources/img/chickenMenu/masillaChicken.jpg"><p>마살라 치킨</p><p class="price_p">10000</p></li>
					<li><img data-menuname="마살라 텐더" data-price="10000" src="${path}/resources/img/chickenMenu/masillaTender.jpg"><p>마살라 텐더</p><p class="price_p">10000</p></li>
					<li><img data-menuname="마살라 윙" data-price="10000" src="${path}/resources/img/chickenMenu/masillaWing.jpg"><p>마살라 윙</p><p class="price_p">10000</p></li>
				</ul>
			</div>
<!-- 			치킨 메뉴 -->
			<div  class="hide">
				<ul class="tab_cont">
					<li><img data-menuname="불갈비 치킨 버거" data-price="10000" src="${path}/resources/img/burger/20170227485176.jpg"><p>불갈비 치킨버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="불싸이 버거" data-price="10000" src="${path}/resources/img/burger/20170412442355.jpg"><p>불싸이 버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="치킨커틀렛 버거" data-price="10000" src="${path}/resources/img/burger/20180220459667.jpg"><p>치킨커틀렛 버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="치즈베이컨 버거" data-price="10000" src="${path}/resources/img/burger/20180416932721.jpg"><p>치즈베이컨 버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="마살라 치킨" data-price="10000" src="${path}/resources/img/burger/20180704461546.jpg"><p>마살라치킨 버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="인크레더블 버거" data-price="10000" src="${path}/resources/img/burger/20181026165774.jpg"><p>인크레더블 버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="언빌리버블 버거" data-price="10000" src="${path}/resources/img/burger/20190328995768.jpg"><p>언빌리버블 버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="딥치즈 버거" data-price="10000" src="${path}/resources/img/burger/increderble.jpg"><p>딥치즈 버거</p><p class="price_p">10000</p></li>
				</ul>
			</div>
<!-- 			사이드 메뉴 -->
			<div  class="hide">
				<ul class="tab_cont">
					<li><img data-menuname="할라피뇨 너겟" data-price="10000" src="${path}/resources/img/sideMenu/20170331173889.jpg"><p>할라피뇨 너겟</p><p class="price_p">10000</p></li>
					<li><img data-menuname="치즈할라피뇨 너겟" data-price="10000" src="${path}/resources/img/sideMenu/20170821851383.jpg"><p>치즈할라피뇨 너겟</p><p class="price_p">10000</p></li>
					<li><img data-menuname="치즈감자" data-price="10000" src="${path}/resources/img/sideMenu/20171120319875.jpg"><p>치즈감자</p><p class="price_p">10000</p></li>
					<li><img data-menuname="어니언치즈 감자" data-price="10000" src="${path}/resources/img/sideMenu/20171120979582.jpg"><p>어니언치즈 감자</p><p class="price_p">10000</p></li>
					<li><img data-menuname="라이스&치즈너겟" data-price="10000" src="${path}/resources/img/sideMenu/20180704788027.jpg"><p>라이스&amp;치즈너겟</p><p class="price_p">10000</p></li>
					<li><img data-menuname="콘베지 샐러드" data-price="10000" src="${path}/resources/img/sideMenu/20180903624821.jpg"><p>콘베지 샐러드</p><p class="price_p">10000</p></li>
					<li><img data-menuname="베지 샐러드" data-price="10000" src="${path}/resources/img/sideMenu/20180903730621.jpg"><p>베지샐러드</p><p class="price_p">10000</p></li>
					<li><img data-menuname="에그랩(2종)" data-price="10000" src="${path}/resources/img/sideMenu/20181026154178.jpg"><p>에그랩(2종)</p><p class="price_p">10000</p></li>
				</ul>
			</div>
<!-- 			음료류 -->
			<div  class="hide">
				<ul class="tab_cont">
					<li><img data-menuname="콜라" data-price="10000" src="${path}/resources/img/drink/20150223992319.jpg"><p>콜라</p><p class="price_p">10000</p></li>
					<li><img data-menuname="라떼류" data-price="10000" src="${path}/resources/img/drink/20161129735987.jpg"><p>라떼류</p><p class="price_p">10000</p></li>
					<li><img data-menuname="스트로베리밀크" data-price="10000" src="${path}/resources/img/drink/20170825874361.jpg"><p>스트로베리밀크</p><p class="price_p">10000</p></li>
					<li><img data-menuname="레몬티" data-price="10000" src="${path}/resources/img/drink/20180220231170.jpg"><p>레몬티</p><p class="price_p">10000</p></li>
					<li><img data-menuname="레몬에이드" data-price="10000" src="${path}/resources/img/drink/20180220239529.jpg"><p>레몬에이드</p><p class="price_p">10000</p></li>
					<li><img data-menuname="딸기크림빙수" data-price="10000" src="${path}/resources/img/drink/20180416547805.jpg"><p>딸기크림빙수</p><p class="price_p">10000</p></li>
					<li><img data-menuname="레몬홍차" data-price="10000" src="${path}/resources/img/drink/20181113571936.jpg"><p>레몬홍차</p><p class="price_p">10000</p></li>
					<li><img data-menuname="홍차" data-price="10000" src="${path}/resources/img/drink/20181113609096.jpg"><p>홍차</p><p class="price_p">10000</p></li>
				</ul>
			</div>
		</div>
<!-- 			주문/갯수/금액 내역 영역 -->
			<div class="order_list_wrap">
			<p class="p">메뉴를 선택해주세요.</p>
			<div class="order_list_div">
				<table class="table_list">
				<thead>
					<tr>
						<th>주문내역</th>
						<th>수량(개)</th>
						<th>금액(원)</th>
					</tr>
					</thead>
					<tbody class="table_tr2">
						
					</tbody>
				</table>
			</div>
<!-- 			결제/취소 영역 -->
			<div class="order_payment_div">
				<table class="total_table">
					<tr>
						<td>주문 총 금액 :&nbsp;&nbsp;</td>
<!-- 			총액 금액 영역 -->
<!-- 						<td><input class="total_pay" type="text">&nbsp;원</td> -->
							<td><label id="total_price">요기야</label></td>
					</tr>
				</table>
           			 <div class="button_base b03_skewed_slide_in">
               	 <div>결제취소</div>
                <div></div>
                <div onclick="cancel()">결제취소</div>
            </div>
				   <div class="back">
           			 <div class="button_base b03_skewed_slide_in">
               	 <div>결제하기</div>
                <div></div>
                <div onclick="payment()">결제하기</div>
                
            </div>
        </div>
			</div>
			</div>
		</div>
	</div>
</body>
</html>