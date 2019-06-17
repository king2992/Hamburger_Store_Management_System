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
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css'/>
<script src='//code.jquery.com/jquery.min.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
<body>
<!-- 배경 이미지 영역 -->
 <div class="body_image" id="swiper">
<!--    카테고리 바깥 영역  슬라이드 영역-->
  <div class="swiper-wrapper">
<!-- 슬라이드 내부 영역 -->
   <div class="swiper-slide">
<!-- 카테고리 이미지 영역    -->
   <div class="background-image"> 
<!--    카테고리 안쪽 영역 -->
   <nav>
      <ul class="tab_btn">
         <li><button class="ListBtn btn1" type="button">추천 메뉴</button></li>
         <li><button class="ListBtn btn2" type="button">치킨 메뉴</button></li>
         <li><button class="ListBtn btn3" type="button">버거 메뉴</button></li>
         <li><button class="ListBtn btn4" type="button">사이드 메뉴</button></li>
         <li><button class="ListBtn btn5" type="button">음료류</button></li>
      </ul>
   </nav>
   </div>
<!--    주문메뉴  큰 영역  -->
   <div class="order_div">
<!--    주문메뉴 list 영역 -->
      <div class="center-wrap">
      <h2>주문하실 메뉴를 선택하신 후 <span class="title-span">장바구니에 담아</span></h2>
      <h2>한번에 주문<span class="title-span">하실 수 있습니다.</span></h2>
<!--       메뉴 ul -->
<!--          추천메뉴 -->
         <div>
            <ul class="tab_cont">
               <li><img data-menuname="치파오" data-price="10000" src="${path}/resources/img/chickenMenu/chiPao.jpg"><div class="animate_div" style="position: absolute;"></div><p>치파오</p><p class="price_p">10000</p></li>
               <li><img data-menuname="치파오치킨" data-price="10000" src="${path}/resources/img/chickenMenu/chiPaOChicken.jpg"><p>치파오 치킨</p><p class="price_p">10000</p></li>
               <li><img data-menuname="찜햇닭" data-price="10000" src="${path}/resources/img/chickenMenu/jjimHatDag.jpg"><p>찜햇닭</p><p class="price_p">10000</p></li>
               <li><img data-menuname="찜햇닭강정" data-price="10000" src="${path}/resources/img/chickenMenu/JjimHatDagGangJung.jpg"><p>찜햇닭 강정</p><p class="price_p">10000</p></li>
               <li><a href="#ex1" rel="modal:open"><img data-menuname="불갈비치킨버거" data-price="10000" src="${path}/resources/img/burger/20170227485176.jpg"></a><p>불갈비 치킨버거</p><p class="price_p">10000</p></li>
               <li><a href="#ex1" rel="modal:open"><img data-menuname="불싸이버거" data-price="10000" src="${path}/resources/img/burger/20170412442355.jpg"></a><p>불싸이 버거</p><p class="price_p">10000</p></li>
               <li><a href="#ex1" rel="modal:open"><img data-menuname="치킨커틀렛버거" data-price="10000" src="${path}/resources/img/burger/20180220459667.jpg"></a><p>치킨커틀렛 버거</p><p class="price_p">10000</p></li>
               <li><a href="#ex1" rel="modal:open"><img data-menuname="치즈베이컨버거" data-price="10000" src="${path}/resources/img/burger/20180416932721.jpg"></a><p>치즈베이컨 버거</p><p class="price_p">10000</p></li>
            </ul>
         </div>
<!--          햄버거 메뉴 -->
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
<!--          치킨 메뉴 -->
         <div  class="hide">
            <ul class="tab_cont">
               <li><a href="#ex1" rel="modal:open"><img data-menuname="불갈비치킨버거" data-price="10000" src="${path}/resources/img/burger/20170227485176.jpg"></a><p>불갈비 치킨버거</p><p class="price_p">10000</p></li>
               <li><a href="#ex1" rel="modal:open"><img data-menuname="불싸이버거" data-price="10000" src="${path}/resources/img/burger/20170412442355.jpg"></a><p>불싸이 버거</p><p class="price_p">10000</p></li>
               <li><a href="#ex1" rel="modal:open"><img data-menuname="치킨커틀렛버거" data-price="10000" src="${path}/resources/img/burger/20180220459667.jpg"></a><p>치킨커틀렛 버거</p><p class="price_p">10000</p></li>
               <li><a href="#ex1" rel="modal:open"><img data-menuname="치즈베이컨버거" data-price="10000" src="${path}/resources/img/burger/20180416932721.jpg"></a><p>치즈베이컨 버거</p><p class="price_p">10000</p></li>
               <li><a href="#ex1" rel="modal:open"><img data-menuname="마살라치킨" data-price="10000" src="${path}/resources/img/burger/20180704461546.jpg"></a><p>마살라치킨 버거</p><p class="price_p">10000</p></li>
               <li><a href="#ex1" rel="modal:open"><img data-menuname="인크레더블버거" data-price="10000" src="${path}/resources/img/burger/20181026165774.jpg"></a><p>인크레더블 버거</p><p class="price_p">10000</p></li>
               <li><a href="#ex1" rel="modal:open"><img data-menuname="언빌리버블버거" data-price="10000" src="${path}/resources/img/burger/20190328995768.jpg"></a><p>언빌리버블 버거</p><p class="price_p">10000</p></li>
               <li><a href="#ex1" rel="modal:open"><img data-menuname="딥치즈버거" data-price="10000" src="${path}/resources/img/burger/increderble.jpg"></a><p>딥치즈 버거</p><p class="price_p">10000</p></li>
            </ul>
         </div>
<!--          사이드 메뉴 -->
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
<!--          음료류 -->
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
<!--          주문/갯수/금액 내역 영역 -->
   <div class="order_list_wrap">
<!--          결제/취소 영역 -->
    <div class="order_payment_div">
         <table class="total_table">
            <tr>
               <td>주문 총 금액 :</td>
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
                <div class="swiper-button-next">결제하기</div>
            </div>
        </div>
    </div>
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
   </div>
  </div>
     <div class="swiper-button-next" id="next_div"><p>다<br>음</p></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
</div>
<div class="swiper-slide">
 <div class="swiper-wrapper">
 <div class="ad">
 <img class="mySlides" src="${path}/resources/images/carousel1.jpg" width="1024px">
 <img class="mySlides" src="${path}/resources/images/carousel2.jpg" width="1024px">
 <img class="mySlides" src="${path}/resources/images/carousel3.jpg" width="1024px">
 <img class="mySlides" src="${path}/resources/images/carousel4.jpg" width="1024px">
 </div>
   <div class="order_div" style="top: 300px;">
<!--    주문메뉴 list 영역 -->
   <div class="center-wrap" style="display: flex; padding-top:0; box-sizing: border-box;">
     <div class="order_list_div2" style="overflow-x: hidden;">
      <table class="table_list2">
         <thead>
            <tr>
               <th>제품</th>
               <th>수량</th>
               <th>금액</th>
            </tr>
         </thead>
         <tbody class="order_tbody">
         
         </tbody>
      </table>
      <table class="ordertable">
         <thead>
            <tr>
               <th>주문금액</th>
               <th>1000</th>
            </tr>
            <tr>
               <th style="border-top:1px solid #c0c0c0;">할인금액</th>
               <th style="border-top:1px solid #c0c0c0;">0</th>
            </tr>
         </thead>
      </table>
         <ul class="payfuture">
            <li>결제할 금액</li>
            <li>1000</li>
         </ul>
         <ul class="paymented">
            <li>결제한 금액</li>
            <li>1000</li>
         </ul>
      <table class="paykind">
         <thead>
            <tr>
               <th>결제종류</th>
               <th>금액</th>
            </tr>
         </thead>
         <tbody>
            <tr>
               <td>현금</td>
               <td>1000</td>
            </tr>
         </tbody>
      </table>
   </div>
   <div class="slide_div2" style=" border:3px solid red;">
      <table class="takeout_table">
         <thead>
            <tr>
               <th colspan="2">Step1.포장을 선택하세요.</th>
            </tr>
         </thead>
         <tbody>
            <tr class="choice_check" style="cursor:pointer">
               <td style="border-right: 1px solid #c0c0c0;"><img id="img_icon" src="${path}/resources/kiosk/images/takeOut.png"><img class="v_img" src="${path}/resources/kiosk/images/v.png"><p>포장</p><p>(1회용기 제공)</p></td>
               <td><img id="img_icon" src="${path}/resources/kiosk/images/store.png"><img class="v_img2" src="${path}/resources/kiosk/images/v.png"><p>매장</p><p>(다회용기 제공)</p></td>
            </tr>
         </tbody>
      </table>
      <table class="sale_point_table">
         <thead>
            <tr>
               <th colspan="3">Step2.할인/적립을 선택하세요.</th>
            </tr>
         </thead>
         <tbody>
            <tr class="choice_check2">
               <td style="border-right:1px solid #c0c0c0;"><img id="img_icon" src="${path}/resources/kiosk/images/sale.png"><img class="v_img3" src="${path}/resources/kiosk/images/v.png"><p>제휴사<br>할인</p></td>
               <td style="border-right:1px solid #c0c0c0;"><img id="img_icon" src="${path}/resources/kiosk/images/point.png"><img class="v_img4" src="${path}/resources/kiosk/images/v.png"><p>포인트<br>사용/적립</p></td>
               <td><img id="img_icon" src="${path}/resources/kiosk/images/X.png"><img class="v_img5" src="${path}/resources/kiosk/images/v.png"><p>선택<br>없음</p></td>
            </tr>
         </tbody>
      </table>
      <table class="payment_table">
         <thead>
            <tr>
               <th colspan="3">Step3.결제를 선택하세요.</th>
            </tr>
         </thead>
         <tbody>
            <tr class="choice_check3">
               <td style="border-right:1px solid #c0c0c0;"><a href="#pay" rel="modal:open"><img id="img_icon" src="${path}/resources/kiosk/images/check_card.png"><img class="v_img6" src="${path}/resources/kiosk/images/v.png"><p>신용/체크<br>카드</p></a></td>
               <td style="border-right:1px solid #c0c0c0;"><a href="#mobile_div" rel="modal:open"><img id="img_icon" src="${path}/resources/kiosk/images/mobile.png"></a><img class="v_img7" src="${path}/resources/kiosk/images/v.png"><p>모바일<br>(pay)</p></td>
               <td><a href="#bus_card" rel="modal:open"><img id="img_icon" src="${path}/resources/kiosk/images/card_.png"></a><img class="v_img8" src="${path}/resources/kiosk/images/v.png"><p>교통카드</p></td>
            </tr>
         </tbody>
      </table>
   </div>
  </div>
<!-- 결제 footer -->
  <div class="footer_div">
        <ul class="side_img">
           <li><a href="/"><img src="${path}/resources/kiosk/images/home.png"></a><p>Home</p></li>
           <li><img src="${path}/resources/kiosk/images/seach.png"><p>크게</p></li> 
           <li><img src="${path}/resources/kiosk/images/return.png"><p>직원호출</p></li>
        </ul>
     <button class="order_cancel_btn" onclick="cancel();">결제취소</button>
     <button class="swiper-button-prev" id="order_add_btn" style="background:rgba(255, 0, 0, 0.4);">추가주문</button>
  </div>
   <!-- 이전 버튼 -->   
   </div>
   </div>
   <div class="swiper-button-prev" id="prev_div" style="top:85.5%;"><p>이<br>전</p></div>
   </div>
   </div>
   </div>

<!--    모달 부분 -->
<div id="ex1" class="modal">
   <h2><span class="modal_span">세트로 드시겠어요?</span></h2>
      <div class="modal_div">
           <div><a href="#" rel="modal:close"><img src="${path}/resources/kiosk/images/single.png" ></a><h4>버거만</h4></div>
           <div><a href="#set" rel="modal:open"><img src="${path}/resources/kiosk/images/set.png"></a><h4>세트</h4></div>
        </div>
</div>
<!-- 세트 모달 부분     -->
   <div class="modal" id="set" style="max-width:1000px; margin:0; padding:0;">
   
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
   <a href="#" rel="modal:close"><button class="set_cancel"><p>취소하기</p></button></a>
   <a href="#" rel="modal:close"><button class="set_choice"><p>선택완료</p></button></a>
   </div>
   </div>
<!-- 카드결제 Modal -->
<div id="pay" class="modalPay" style="display:none;">
   <div class="text_header">신용/체크카드</div>
   <div class="text_div">그림과 같이 카드를 넣어주세요<br/>(IC칩이 단말기에 투입되도록 넣어주세요)</div>
   <div class="pay_img"><img class="wallet" src="${path}/resources/kiosk/images/pay_1.jpg"></div>
   <div class="pay_gif"><img class="wallet" src="${path}/resources/kiosk/images/card.gif"></div>
   <a href="" rel="modal:close"><button type="button" class="pay_btn">취소</button></a>
</div>   
<!-- 모바일 결제 -->
<div id="mobile_div" class="modalPay" style="display:none;">
   <div class="text_header">Mobile(pay)</div>
   <div class="text_div">그림과 같이 바코드를 찍어주세요</div>
   <div class="pay_img"><img class="wallet" src="${path}/resources/kiosk/images/pay_2.jpg"></div>
   <div class="pay_gif"><img class="wallet" src="${path}/resources/kiosk/images/mobile_pay.gif"></div>
   <a href="" rel="modal:close"><button type="button" class="pay_btn">취소</button></a>
</div>
<!-- 교통카드결제 Modal -->
<div id="bus_card" class="modalPay" style="display:none;">
   <div class="text_header">교통카드</div>
   <div class="text_div">그림과 같이 카드를 넣어주세요</div>
   <div class="pay_img"><img class="wallet" src="${path}/resources/kiosk/images/pay_3.jpg"></div>
   <div class="pay_gif"><img class="wallet" src="${path}/resources/kiosk/images/jj1JW.gif"></div>
   <a href="" rel="modal:close"><button type="button" class="pay_btn">취소</button></a>
</div>   
</body>
</html>