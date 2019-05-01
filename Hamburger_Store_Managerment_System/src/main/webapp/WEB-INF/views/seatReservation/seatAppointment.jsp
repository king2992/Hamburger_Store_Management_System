<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="toDay" class="java.util.Date" />
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Hind" rel="stylesheet">
     <link href="/resources/css/reservated.css" rel="stylesheet">
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/font-awesome.min.css" rel="stylesheet">
    <link href="/resources/css/animate.min.css" rel="stylesheet">
    <link href="/resources/css/prettyPhoto.css" rel="stylesheet">
    <link href="/resources/css/owl.carousel.min.css" rel="stylesheet">
    <link href="/resources/css/icomoon.css" rel="stylesheet">
    <link href="/resources/css/main.css" rel="stylesheet">
    <link href="/resources/css/responsive.css" rel="stylesheet">
    <link rel="shortcut icon" href="/resources/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/resources/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/resources/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/resources/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="/resources/images/ico/apple-touch-icon-57-precomposed.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src='/resources/fullcalendar-4.0.2/packages/core/main.js'></script>
<script src='/resources/fullcalendar-4.0.2/packages/daygrid/main.js'></script>
<script src='/resources/fullcalendar-4.0.2/packages/timegrid/main.js'></script>
<script src='/resources/fullcalendar-4.0.2/packages/interaction/main.js'></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href='/resources/fullcalendar-4.0.2/packages/core/main.css' rel='stylesheet' />
<link href='/resources/fullcalendar-4.0.2/packages/daygrid/main.css' rel='stylesheet' />
<link rel="stylesheet" type="text/css"
	href="/resources/css/seatAppointment.css">
<script src="http://localhost:84/socket.io/socket.io.js"></script>
<script>
			var userId = "${sessionScope.user}";
            $(document).ready(function(){
                var socket = io("http://localhost:84");
                //msg에서 키를 누를떄
                $("#msg").keydown(function(key){
                    //해당하는 키가 엔터키(13) 일떄
                    if(key.keyCode == 13){
                        //msg_process를 클릭해준다.
                        msg_process.click();
                    }
                });
                //msg_process를 클릭할 때
                $("#msg_process").click(function(){
                    //소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
                     socket.emit("send_msg", $("#msg").text());
                    //#msg에 벨류값을 비워준다.
                    $("#msg").text("");
                });
              //소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
                socket.on('send_msg', function(msg) {
                    //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
                    $('<div></div>').text('새로운 주문이 있습니다.').appendTo("#chat_box");
                });
            });
        </script>
<title>햄버거 테이크아웃 예약</title>
<style type="text/css">
 /* The Modal (background) */
             .modal {
                 display: none; /* Hidden by default */ 
                 position: fixed; /* Stay in place */ 
                 z-index: 10000; /* Sit on top */ 
                 left: 0; */
                 top: 0; */
                 width: 100%; /* Full width */ 
                 height: 100%; /* Full height */ 
                 overflow: auto; /* Enable scroll if needed */ 
                 background-color: rgb(0,0,0); /* Fallback color */ 
                 background-color: rgba(0,0,0,0.4); /* Black w/ opacity */ 
             } 
        
             /* Modal Content/Box */ 
            .modal-content { 
                 background-color: #fefefe; 
                 margin: 15% auto; /* 15% from the top and centered */ 
                 padding: 20px; 
                 border: 1px solid #888; 
                 width: 30%; /* Could be more or less, depending on screen size */                           
            } 


</style>
</head>
<body>
	
 <section class="window-height" id="error" style="background-image: url(/resources/img/background/village-burger-bar-3799973_1920.jpg);">
         <div><p class="ticket" ><a href="/">Hamburger Take Out</a></p></div>
       <div class="container">
           <div class="seats" style="position: relative; top: 35px;"> 
                <div class="left-box">
                	<div id="orderList">
                		<ul id="orderListUl"></ul>
                	</div>
                	<div id="calendar">
                		<div class="dateAlert" style="position:relative; top:50px; left:10px;z-index:99999; max-width:1024px; color:black; opactiy: 1.0;font-family:'Hind', sans-serif ">
                			<img src="/resources/img/icon101.png" style="width:70px; height:70px; float:left;">
							<p style="font-size:35px; position:relative; top: 15px;">날짜를 선택해 주세요.</p>
						</div>
                	</div>
               </div>
       <div class="right-box">
       <ul>
       		<li><button type="button" onclick="chickenBlock()">치킨 메뉴</button></li> 
   			<li><button type="button" onclick="burgerListBlock()">버거 메뉴</button></li>
   			<li><button type="button" onclick="sideMenuListBlock()">사이드 메뉴</button></li>
   			<li><button type="button" onclick="drinkMenuListBlock()">음료류</button></li>
   		</ul>
       	<ul class="chickenList" id="chickenList">
  			<li><img src="/resources/img/chickenMenu/chiPao.jpg" class="menu-item" data-id="chiPao0" value="치파오" data-code="9800" data-cnt="1">치파오</li>
  			<li><img src="/resources/img/chickenMenu/chiPaOChicken.jpg" class="menu-item" data-id="chiPaOChicken0" value="치파오 치킨" data-code="8900" data-cnt="1">치파오 치킨</li>
  			<li><img src="/resources/img/chickenMenu/jjimHatDag.jpg" class="menu-item" data-id="jjimHatDag0" value="찜햇닭" data-code="10500" data-cnt="1">찜햇닭</li>
  			<li><img src="/resources/img/chickenMenu/JjimHatDagGangJung.jpg" class="menu-item" data-id="JjimHatDagGangJung0" value="찜햇닭 강정" data-code="9900" data-cnt="1">찜햇닭 강정</li>
  			<li><img src="/resources/img/chickenMenu/JjimHatDagWing.jpg" class="menu-item" data-id="JjimHatDagWing0" value="찜햇닭 윙" data-code="11000" data-cnt="1">찜햇닭 윙</li>
  			<li><img src="/resources/img/chickenMenu/masillaChicken.jpg" class="menu-item" data-id="masillaChicken0" value="마실라 치킨" data-code="9500" data-cnt="1">마실라 치킨</li>
  			<li><img src="/resources/img/chickenMenu/masillaTender.jpg" class="menu-item" data-id="masillaTender0" value="마실라 텐더" data-code="8500" data-cnt="1">마실라 텐더</li>
  			<li><img src="/resources/img/chickenMenu/masillaWing.jpg" class="menu-item" data-id="masillaWing0" value="마실라 윙" data-code="9200" data-cnt="1">마실라 윙</li>
       	</ul>
       	<ul class="burgerList" id="burgerList">
       			<li><img src="/resources/img/burger/increderble.jpg" class="menu-item" data-id="burger1"value="언빌리버블버거" data-code="4500" data-cnt="1">언빌리버블버거</li>
       			<li><img src="/resources/img/burger/20180220459667.jpg" class="menu-item" data-id="burger2" value="인크레더블버거" data-code="5700"data-cnt="1" >인크레더블버거</li>
       			<li><img src="/resources/img/burger/20180416932721.jpg" class="menu-item" data-id="burger3" value="마살라" data-code="5200"data-cnt="1" >마살라 버거</li>
       			<li><img src="/resources/img/burger/20180704461546.jpg" class="menu-item" data-id="burger4" value="치즈베이컨버거" data-code="6200" data-cnt="1">치즈베이컨버거</li>
       			<li><img src="/resources/img/burger/20181026165774.jpg" class="menu-item" data-id="burger5" value="치킨커틀렛버거" data-code="6400"data-cnt="1" >치킨커틀렛버거</li>
       			<li><img src="/resources/img/burger/20190328995768.jpg" class="menu-item" data-id="burger6" value="딥치즈버거" data-code="5500"data-cnt="1" >딥치즈버거</li>
       			<li><img src="/resources/img/burger/20170227485176.jpg" class="menu-item" data-id="burger7" value="불싸이버거" data-code="4800" data-cnt="1">불싸이버거</li>
       			<li><img src="/resources/img/burger/20170412442355.jpg" class="menu-item" data-id="burger8" value="불갈비치킨버거" data-code="5800" data-cnt="1">불갈비치킨버거</li>
       	</ul>
       	<ul class="sideMenuList" id="sideMenuList">
       			<li><img src="/resources/img/sideMenu/20170331173889.jpg" class="menu-item" data-id="sideMenu1" value="에그랩(2종)" data-code="2700" data-cnt="1">에그랩(2종)</li>
       			<li><img src="/resources/img/sideMenu/20170821851383.jpg" class="menu-item" data-id="sideMenu2" value="콘배지샐러드" data-code="2000" data-cnt="1">콘배지샐러드</li>
       			<li><img src="/resources/img/sideMenu/20171120319875.jpg" class="menu-item" data-id="sideMenu3" value="배지샐러드" data-code="2200" data-cnt="1">배지샐러드</li>
       			<li><img src="/resources/img/sideMenu/20171120979582.jpg" class="menu-item" data-id="sideMenu4" value="라이스&치킨너겟" data-code="1800" data-cnt="1">라이스&치킨너겟</li>
       			<li><img src="/resources/img/sideMenu/20180704788027.jpg" class="menu-item" data-id="sideMenu5" value="어니언치즈감자" data-code="1500" data-cnt="1">어니언치즈감자</li>
       			<li><img src="/resources/img/sideMenu/20180903624821.jpg" class="menu-item" data-id="sideMenu6" value="치즈감자" data-code="1500" data-cnt="1">치즈감자</li>
       			<li><img src="/resources/img/sideMenu/20180903730621.jpg" class="menu-item" data-id="sideMenu7" value="치즈할라피뇨너겟" data-code="2000" data-cnt="1">치즈할라피뇨너겟</li>
       			<li><img src="/resources/img/sideMenu/20181026154178.jpg" class="menu-item" data-id="sideMenu8" value="할라피뇨너겟" data-code="2200" data-cnt="1">할라피뇨너겟</li>
       	</ul>
       		<ul class="drinkMenuList" id="drinkMenuList">
       			<li><img src="/resources/img/drink/20150223992319.jpg" class="menu-item" data-id="drink1" value="음료1" data-code="1500" data-cnt="1">음료1</li>
       			<li><img src="/resources/img/drink/20161129735987.jpg" class="menu-item" data-id="drink2" value="음료2" data-code="1800" data-cnt="1">음료2</li>
       			<li><img src="/resources/img/drink/20170825874361.jpg" class="menu-item" data-id="drink3" value="음료3" data-code="2000" data-cnt="1">음료3</li>
       			<li><img src="/resources/img/drink/20180220231170.jpg" class="menu-item" data-id="drink4" value="음료4" data-code="1600" data-cnt="1">음료4</li>
       			<li><img src="/resources/img/drink/20180220239529.jpg" class="menu-item" data-id="drink5" value="음료5" data-code="1800" data-cnt="1">음료5</li>
       			<li><img src="/resources/img/drink/20180416547805.jpg" class="menu-item" data-id="drink6" value="음료6" data-code="2200" data-cnt="1">음료6</li>
       			<li><img src="/resources/img/drink/20181113571936.jpg" class="menu-item" data-id="drink7" value="음료7" data-code="1500" data-cnt="1">음료6</li>
       			<li><img src="/resources/img/drink/20181113609096.jpg" class="menu-item" data-id="drink8" value="음료8" data-code="2500" data-cnt="1">음료6</li>
       		</ul>	
       </div>
    </div>
    <div id="reservedTimeList" >
	</div>
	<div class="orderListMsg">
		<ul id="msg">
		</ul>
<!--     	<button id="msg_process">전송</button> -->
    </div>	
        <div class="tnb" style="height: 160px;">
            <div class="tnb-container">
                <div class="tnb-reset">
                </div>
                <div class="tnb step1">
                    <div style="text-align: right; margin-left: 100px;">
                    <div class="info date">
                             <ul class="date">
                             	<li class="header">날짜</li>
                             	<li id="dateInnerHTML" class="data"></li>
                             </ul>
                             <ul class="date">
                             	<li class="header" style="position:absolute; top:30px; left:180px;">시간</li>
                             	<li id="time" class="data"></li>
                             </ul>
                    </div>
                    <div class="info seat">
                      <ul class="date">
                      	<li class="header" style="">-</li>
                      	<li id="seatNumber" class="data"></li>
                      </ul>
                    </div>
                      <div class="info price">
                   <ul class="date">
                      	<li class="header" style="">총금액</li>
                      	<li id="priceSum" class="data"></li>
                      </ul>

                    </div>
                        </div>
                    <div class="panel">
                        <a href="#login_form" class="btn-right" >주 문</a>
                    </div>
                    <div>
                        <a href="" class="btn-left">이 전</a>
                    </div>
                </div>
            </div>   
        </div>
        
        </div>
    </section><!--/#error-->
    <script src="/resources/js/jquery.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery.prettyPhoto.js"></script>
    <script src="/resources/js/owl.carousel.min.js"></script>
    <script src="/resources/js/jquery.isotope.min.js"></script>
    <script src="/resources/js/main.js"></script>
    <script type="text/javascript" src="/resources/js/seatAppointment.js"></script>
	<!-- The Modal -->
<div id="myModal" class="modal">
  <!-- Modal content -->
  <div class="modal-content">
           <div><p style="text-align: center;"><span style="font-size: 14pt;"><b>시간을 선택해주세요.<span style="font-size: 24pt;"></span></b></span></p><button type="button" onclick="amView()">오전</button><button type="button" onclick="pmView()">오후</button></div>
           <div id="am">
            <p style="text-align: center; line-height: 1.5;"><br />오전</p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" >01:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" >02:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" >03:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" >04:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" >05:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" >06:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" >07:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" >08:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" >09:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" >10:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" >11:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" >12:00</button></span></p>
            <button type="button">직접 입력</button>
            <p style="text-align: center; line-height: 1.5;"><br /></p>
            <p><br /></p>
            </div>
            <div id="pm">
            <p style="text-align: center; line-height: 1.5;"><br />오후</p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" >13:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" >14:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" >15:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" >16:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" >17:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" >18:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" >19:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" >20:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" >21:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" >22:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" >23:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" >24:00</button></span></p>
            <button type="button">직접 입력</button>
            <p style="text-align: center; line-height: 1.5;"><br /></p>
            <p><br /></p>
            </div>
  </div>

</div>
    <!--End Modal-->



	<!-- 숨겨왔던 나의 수줍은 모달-->
	<a href="#x" class="overlay" id="login_form"></a>

	<div class="popup">
		<h2>주문자 정보</h2>
		<h3>주문 하시는 분의 정보를 입력해주세요.</h3>
		<form action="/seatReservation/ticketingSuccess" method="POST"
			id="formSubmit" name="formValue">
			<p id="pId">${sessionScope.user}님 이 내용으로 주문 하시겠습니까 ?</p>
			<span>이름 : <input type="text"></span>
			<span>전화번호 : <input type="text"></span>
			<ul style="list-style: none;" class="reservedCheck">
				 <li value="">날짜 : <span id="dateCheck"></span></li>
				 <li value="">시간 : <span id="timeModal"></span></li>
			</ul>
				<input type="hidden" name="id" value="${sessionScope.user}">
				<input type="hidden" id="ticketPrice2" name="ticketPrice" value="" /> 
				<input type="hidden" id="reservedDate2" name="reservedDate" value="" />
				<input type="hidden" id="reservedTime" name="reservedTime" value="" />  
			<div>
				<a href="#" id="msg_process"   value="예매" onclick="goTicketing()" />주문</a>
			</div>
			<a class="close" href="#close"></a>
		</form>
	</div>




</body>
</html>