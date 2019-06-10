<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kiosk First Web Screen</title>
</head>
<link rel="shortcut icon" href="${path}/kiosk/screen">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript" src="${path}/resources/kiosk/js/main.js"></script>
<link rel="stylesheet" type="text/css" href="${path}/resources/kiosk/css/screen.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 and Android browser -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<!-- Remember to include jQuery :) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css'/>
<script src='//code.jquery.com/jquery.min.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
<style>
.swiper-container {
	width:640px;
	height:380px;
	border:5px solid silver;
	border-radius:7px;
	box-shadow:0 0 20px #ccc inset;
} 

</style>

<body>
<!-- 배경 이미지 영역 -->
	<div class="body_image" id="swiper">
<!-- 	카테고리 바깥 영역 -->
	<div class="background-image"> 
<!-- 	카테고리 안쪽 영역 -->
		<nav>
			<ul class="tab_btn">
				<li><button class="ListBtn btn1" type="button">전체 메뉴</button></li>
				<li><button class="ListBtn btn2" type="button">치킨 메뉴</button></li>
				<li><a href="#ex1" rel="modal:open"><button class="ListBtn btn3" type="button">버거 메뉴</button></a></li>
				<li><button class="ListBtn btn4" type="button">사이드 메뉴</button></li>
				<li><button class="ListBtn btn5" type="button">음료류</button></li>
			</ul>
		</nav>
	</div>
<!-- 	주문메뉴  큰 영역  -->
<div class="swiper-wrapper">
	<div class="swiper-slide">
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
					<li><img data-menuname="치파오치킨" data-price="10000" src="${path}/resources/img/chickenMenu/chiPaOChicken.jpg"><p>치파오 치킨</p><p class="price_p">10000</p></li>
					<li><img data-menuname="찜햇닭" data-price="10000" src="${path}/resources/img/chickenMenu/jjimHatDag.jpg"><p>찜햇닭</p><p class="price_p">10000</p></li>
					<li><img data-menuname="찜햇닭강정" data-price="10000" src="${path}/resources/img/chickenMenu/JjimHatDagGangJung.jpg"><p>찜햇닭 강정</p><p class="price_p">10000</p></li>
					<li><img data-menuname="찜햇닭윙" data-price="10000" src="${path}/resources/img/chickenMenu/JjimHatDagWing.jpg"><p>찜햇닭 윙</p><p class="price_p">10000</p></li>
					<li><img data-menuname="마살라치킨" data-price="10000" src="${path}/resources/img/chickenMenu/masillaChicken.jpg"><p>마살라 치킨</p><p class="price_p">10000</p></li>
					<li><img data-menuname="마살라텐더" data-price="10000" src="${path}/resources/img/chickenMenu/masillaTender.jpg"><p>마살라 텐더</p><p class="price_p">10000</p></li>
					<li><img data-menuname="마살라윙" data-price="10000" src="${path}/resources/img/chickenMenu/masillaWing.jpg"><p>마살라 윙</p><p class="price_p">10000</p></li>
					<li><img data-menuname="불갈비치킨버거" data-price="10000" src="${path}/resources/img/burger/20170227485176.jpg"><p>불갈비 치킨버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="불싸이버거" data-price="10000" src="${path}/resources/img/burger/20170412442355.jpg"><p>불싸이 버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="치킨커틀렛버거" data-price="10000" src="${path}/resources/img/burger/20180220459667.jpg"><p>치킨커틀렛 버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="치즈베이컨버거" data-price="10000" src="${path}/resources/img/burger/20180416932721.jpg"><p>치즈베이컨 버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="마살라치킨" data-price="10000" src="${path}/resources/img/burger/20180704461546.jpg"><p>마살라치킨 버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="인크레더블버거" data-price="10000" src="${path}/resources/img/burger/20181026165774.jpg"><p>인크레더블 버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="언빌리버블버거" data-price="10000" src="${path}/resources/img/burger/20190328995768.jpg"><p>언빌리버블 버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="딥치즈버거" data-price="10000" src="${path}/resources/img/burger/increderble.jpg"><p>딥치즈 버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="할라피뇨너겟" data-price="10000" src="${path}/resources/img/sideMenu/20170331173889.jpg"><p>할라피뇨 너겟</p><p class="price_p">10000</p></li>
					<li><img data-menuname="치즈할라피뇨너겟" data-price="10000" src="${path}/resources/img/sideMenu/20170821851383.jpg"><p>치즈할라피뇨 너겟</p><p class="price_p">10000</p></li>
					<li><img data-menuname="치즈감자" data-price="10000" src="${path}/resources/img/sideMenu/20171120319875.jpg"><p>치즈감자</p><p class="price_p">10000</p></li>
					<li><img data-menuname="어니언치즈감자" data-price="10000" src="${path}/resources/img/sideMenu/20171120979582.jpg"><p>어니언치즈 감자</p><p class="price_p">10000</p></li>
					<li><img data-menuname="라이스&치즈너겟" data-price="10000" src="${path}/resources/img/sideMenu/20180704788027.jpg"><p>라이스&amp;치즈너겟</p><p class="price_p">10000</p></li>
					<li><img data-menuname="콘베지샐러드" data-price="10000" src="${path}/resources/img/sideMenu/20180903624821.jpg"><p>콘베지 샐러드</p><p class="price_p">10000</p></li>
					<li><img data-menuname="베지샐러드" data-price="10000" src="${path}/resources/img/sideMenu/20180903730621.jpg"><p>베지샐러드</p><p class="price_p">10000</p></li>
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
			<div class="hide">
				<ul class="tab_cont">
					<li><img data-menuname="치파오" data-price="10000" src="${path}/resources/img/chickenMenu/chiPao.jpg"><p>치파오</p><p class="price_p">10000</p></li>
					<li><img data-menuname="치파오치킨" data-price="10000" src="${path}/resources/img/chickenMenu/chiPaOChicken.jpg"><p>치파오 치킨</p><p class="price_p">10000</p></li>
					<li><img data-menuname="찜햇닭" data-price="10000" src="${path}/resources/img/chickenMenu/jjimHatDag.jpg"><p>찜햇닭</p><p class="price_p">10000</p></li>
					<li><img data-menuname="찜햇닭강정" data-price="10000" src="${path}/resources/img/chickenMenu/JjimHatDagGangJung.jpg"><p>찜햇닭 강정</p><p class="price_p">10000</p></li>
					<li><img data-menuname="찜햇닭윙" data-price="10000" src="${path}/resources/img/chickenMenu/JjimHatDagWing.jpg"><p>찜햇닭 윙</p><p class="price_p">10000</p></li>
					<li><img data-menuname="마살라치킨" data-price="10000" src="${path}/resources/img/chickenMenu/masillaChicken.jpg"><p>마살라 치킨</p><p class="price_p">10000</p></li>
					<li><img data-menuname="마살라텐더" data-price="10000" src="${path}/resources/img/chickenMenu/masillaTender.jpg"><p>마살라 텐더</p><p class="price_p">10000</p></li>
					<li><img data-menuname="마살라윙" data-price="10000" src="${path}/resources/img/chickenMenu/masillaWing.jpg"><p>마살라 윙</p><p class="price_p">10000</p></li>
				</ul>
			</div>
<!-- 			치킨 메뉴 -->
			<div  class="hide">
				<ul class="tab_cont">
					<li><img data-menuname="불갈비치킨버거" data-price="10000" src="${path}/resources/img/burger/20170227485176.jpg"><p>불갈비 치킨버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="불싸이버거" data-price="10000" src="${path}/resources/img/burger/20170412442355.jpg"><p>불싸이 버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="치킨커틀렛버거" data-price="10000" src="${path}/resources/img/burger/20180220459667.jpg"><p>치킨커틀렛 버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="치즈베이컨버거" data-price="10000" src="${path}/resources/img/burger/20180416932721.jpg"><p>치즈베이컨 버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="마살라치킨" data-price="10000" src="${path}/resources/img/burger/20180704461546.jpg"><p>마살라치킨 버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="인크레더블버거" data-price="10000" src="${path}/resources/img/burger/20181026165774.jpg"><p>인크레더블 버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="언빌리버블버거" data-price="10000" src="${path}/resources/img/burger/20190328995768.jpg"><p>언빌리버블 버거</p><p class="price_p">10000</p></li>
					<li><img data-menuname="딥치즈버거" data-price="10000" src="${path}/resources/img/burger/increderble.jpg"><p>딥치즈 버거</p><p class="price_p">10000</p></li>
				</ul>
			</div>
<!-- 			사이드 메뉴 -->
			<div  class="hide">
				<ul class="tab_cont">
					<li><img data-menuname="할라피뇨너겟" data-price="10000" src="${path}/resources/img/sideMenu/20170331173889.jpg"><p>할라피뇨 너겟</p><p class="price_p">10000</p></li>
					<li><img data-menuname="치즈할라피뇨너겟" data-price="10000" src="${path}/resources/img/sideMenu/20170821851383.jpg"><p>치즈할라피뇨 너겟</p><p class="price_p">10000</p></li>
					<li><img data-menuname="치즈감자" data-price="10000" src="${path}/resources/img/sideMenu/20171120319875.jpg"><p>치즈감자</p><p class="price_p">10000</p></li>
					<li><img data-menuname="어니언치즈감자" data-price="10000" src="${path}/resources/img/sideMenu/20171120979582.jpg"><p>어니언치즈 감자</p><p class="price_p">10000</p></li>
					<li><img data-menuname="라이스&치즈너겟" data-price="10000" src="${path}/resources/img/sideMenu/20180704788027.jpg"><p>라이스&amp;치즈너겟</p><p class="price_p">10000</p></li>
					<li><img data-menuname="콘베지샐러드" data-price="10000" src="${path}/resources/img/sideMenu/20180903624821.jpg"><p>콘베지 샐러드</p><p class="price_p">10000</p></li>
					<li><img data-menuname="베지샐러드" data-price="10000" src="${path}/resources/img/sideMenu/20180903730621.jpg"><p>베지샐러드</p><p class="price_p">10000</p></li>
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
	
	<div class="swiper-slide" style="display:grid; grid-template-columns: 50% 50%;">
			<div class="order_list_div2">
				<table class="table_list2">
				<thead>
					<tr>
						<th>제품</th>
						<th>수량</th>
						<th>금액</th>
					</tr>
					</thead>
					<tbody>
						
					</tbody>
				</table>
			</div>
			<div class="slide_div2">
		매장/포장
	</div>
	</div>
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev" style="color:red;"></div><!-- 이전 버튼 -->	
	</div>
	</div>
<script>
new Swiper('#swiper', {
	navigation : {
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
});
</script>
<!-- 	모달 부분 -->
	<div id="ex1" class="modal">
	<span class="modal_span"><h2>세트로 드시겠어요?</h2></span>
		<div class="modal_div">
        	<div><a href="#" rel="modal:close"><img src="${path}/resources/kiosk/images/single.png" ></a><h4>버거만</h4></div>
        	<div><a href="#set" rel="modal:open"><img src="${path}/resources/kiosk/images/set.png"></a><h4>세트</h4></div>
        </div>
    </div>
<!-- 세트 모달 부분     -->
	<div class="modal" id="set" style="/* display:inline-block; */ max-width:1000px; margin:0; padding:0;">
	
		<div class="set_div"><h3 style="padding:15px;">세트디저트 1개를 선택해 주세요.</h3></div>
		<div>
			<ul class="modal_set" style="text-align: center;">
				<li><button class="set_btn" type="button"><h4>SET.사이드</h4></button></li>
				<li><button class="set_btn" type="button"><h4>SET.드링크</h4></button></li>
			</ul>
		</div>
		<div class="set_wrap">
		<div class="set_side" id="hide">
			<ul class="set_side_ul">
					<li><img data-menuname="할라피뇨너겟" data-price="10000" src="${path}/resources/img/sideMenu/20170331173889.jpg"><p>할라피뇨 너겟</p><p class="price_p">10000</p></li>
					<li><img data-menuname="치즈할라피뇨너겟" data-price="10000" src="${path}/resources/img/sideMenu/20170821851383.jpg"><p>치즈할라피뇨 너겟</p><p class="price_p">10000</p></li>
					<li><img data-menuname="치즈감자" data-price="10000" src="${path}/resources/img/sideMenu/20171120319875.jpg"><p>치즈감자</p><p class="price_p">10000</p></li>
					<li><img data-menuname="어니언치즈감자" data-price="10000" src="${path}/resources/img/sideMenu/20171120979582.jpg"><p>어니언치즈 감자</p><p class="price_p">10000</p></li>
					<li><img data-menuname="라이스&치즈너겟" data-price="10000" src="${path}/resources/img/sideMenu/20180704788027.jpg"><p>라이스&amp;치즈너겟</p><p class="price_p">10000</p></li>
					<li><img data-menuname="콘베지샐러드" data-price="10000" src="${path}/resources/img/sideMenu/20180903624821.jpg"><p>콘베지 샐러드</p><p class="price_p">10000</p></li>
					<li><img data-menuname="베지샐러드" data-price="10000" src="${path}/resources/img/sideMenu/20180903730621.jpg"><p>베지샐러드</p><p class="price_p">10000</p></li>
					<li><img data-menuname="에그랩(2종)" data-price="10000" src="${path}/resources/img/sideMenu/20181026154178.jpg"><p>에그랩(2종)</p><p class="price_p">10000</p></li>
			</ul>		
		</div>
		<div class="set_drink" id="hide">
			<ul class="set_side_ul">
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
	<div class="set_footer">
	<div class="set_total">선택수량 :<label></label></div>
	<div class="set_cancel"><p><a href="#" rel="modal:close">취소하기</a></p></div>
	<div class="set_choice"><p><a href="#" rel="modal:close">선택완료</a></p></div>
	</div>
	</div>
</body>
</html>