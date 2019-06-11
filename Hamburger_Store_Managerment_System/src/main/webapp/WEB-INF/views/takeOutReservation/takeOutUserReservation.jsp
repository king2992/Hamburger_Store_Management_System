<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="toDay" class="java.util.Date" />
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link href="https://fonts.googleapis.com/css?family=Hind"
	rel="stylesheet">
<link href="/resources/css/reservated.css" rel="stylesheet">
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/css/icomoon.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- <script src="http://localhost:84/socket.io/socket.io.js"></script> -->
<script src="sweetalert2.all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>

<!--   <link href="/resources/css/main.css" rel="stylesheet">  
<!--   <link href="/resources/css/responsive.css" rel="stylesheet">  -->
<!-- 모달  -->
<!--  <link href="/resources/css/bootstrap-min.css" rel="stylesheet">
<link href="/resources/css/font-awesome-min.css" rel="stylesheet">
<link href="/resources/css/prettyPhoto.css" rel="stylesheet"> -->
<link href="/resources/css/mainIndex.css" rel="stylesheet" type="text/css">


<link rel="stylesheet" href="/resources/css/mainR.css">
<!-- <link rel="stylesheet" href="/resources/css/sub.css">  -->
<script src="/resources/js/mainR.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@7.32.2/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<script src="sweetalert2.all.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>



<link rel="shortcut icon" href="/resources/images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="/resources/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="/resources/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="/resources/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="/resources/images/ico/apple-touch-icon-57-precomposed.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src='/resources/fullcalendar-4.0.2/packages/core/main.js'></script>
<script src='/resources/fullcalendar-4.0.2/packages/daygrid/main.js'></script>
<script src='/resources/fullcalendar-4.0.2/packages/timegrid/main.js'></script>
<script src='/resources/fullcalendar-4.0.2/packages/interaction/main.js'></script>
<link href='/resources/fullcalendar-4.0.2/packages/core/main.css'
	rel='stylesheet' />
<link href='/resources/fullcalendar-4.0.2/packages/daygrid/main.css'
	rel='stylesheet' />
<link rel="stylesheet" type="text/css"
	href="/resources/css/seatAppointment.css">
<script>
	var userId = "${sessionScope.user}";
// 	$(document).ready(function() {
// 		var socket = io("http://localhost:84");
// 		//msg에서 키를 누를떄
// 		$("#msg").keydown(function(key) {
// 			//해당하는 키가 엔터키(13) 일떄
// 			if (key.keyCode == 13) {
// 				//msg_process를 클릭해준다.
// 				msg_process.click();
// 			}
// 		});
// 		//msg_process를 클릭할 때
// 		$("#msg_process").click(function() {
// 			//소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
// 			socket.emit("send_msg", $("#msg").text());
// 			//#msg에 벨류값을 비워준다.
// 			$("#msg").text("");
// 		});
// 		//소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
// 		socket.on('send_msg', function(msg) {
// 			//div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
// 			$('<div></div>').text('새로운 주문이 있습니다.').appendTo("#chat_box");
// 		});
// 	});
</script>
<title>햄버거 테이크아웃 예약</title>
<style type="text/css">
.footQuickUl{margin:0;}
.footer .inner address p{margin:0}
html{
	font-size: 100% !important;
}
.space{text-align: center; font-size: 20px; font-weight: 700; color: #555555;}
.reservedCheck li{
	margin-top:30px;
}
/* The Modal (background) */
.modal {
	 display: none;  /* Hidden by default */
/* 	position: fixed; */  /* Stay in place */
	 z-index: 10000;  /* Sit on top */
	 left: 0; 
	 top: 0;  
	 width: 100%;  /* Full width */
	  height: 100%; */ /* Full height */
	 /* overflow: auto;   *//* Enable scroll if needed */
	 background-color: rgb(0, 0, 0); /* Fallback color */
	 background-color: rgba(0, 0, 0, 0.4);  /* Black w/ opacity */
/* 	 position:absolute; */
	 margin:0 auto;
	
}

/* Modal Content/Box */
.modal-content {
 	background-color: #fefefe;
    margin: 10% auto;  
	padding: 20px;
	border: 1px solid #888;
/* 	height:40px; */
/* 	min-width:40px; */
	/* width:100%; */
	width: 685px; 
	top:120px;
	 
	
/* 	position: relative;
	bottom: 200px;  */
}

.content-display{margin: 0 auto;}
.timeCenter{margin-top: 40px;}


.addModal {
	display: none; /* Hidden by default */
	/* Stay in place */
	z-index: 10000; /* Sit on top */
	left: 0; */
	top: 0; */
	width: 50%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.addModal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 30%; /* Could be more or less, depending on screen size */
}

[data-tooltip-text]:hover {
	position: relative;
}

[data-tooltip-text]:after {
	-webkit-transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
	-moz-transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
	transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
	background-color: rgba(0, 0, 0, 0.8);
	-webkit-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	-moz-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	color: #FFFFFF;
	font-size: 12px;
	margin-bottom: 10px;
	padding: 7px 12px;
	position: absolute;
	width: auto;
	min-width: 50px;
	max-width: 300px;
	word-wrap: break-word;
	z-index: 9999;
	opacity: 0;
	left: -9999px;
	top: 90%;
	content: attr(data-tooltip-text);
}

[data-tooltip-text]:hover:after {
	top: 130%;
	left: 0;
	opacity: 1;
}
.input{
width: 300px;
    /* height: 30px; */
    line-height: 30px;
    background-color: #efefef;
    border-radius: 10px;
    border: 1px solid #dedede;
    padding: 10px;
    /* margin-top: 3px; */
    margin-bottom: 20px;
    font-size: 0.9em;
    color: #3a3a3a;
    margin: 0 auto;
    display: block;
}

a.animated-button:link, a.animated-button:visited {
	position: relative;
	display: block;
	margin: 30px auto 0;
	padding: 14px 15px;
	color: #fff;
	font-size:14px;
	font-weight: bold;
	text-align: center;
	text-decoration: none;
	text-transform: uppercase;
	overflow: hidden;
	letter-spacing: .08em;
	border-radius: 0;
	text-shadow: 0 0 1px rgba(0, 0, 0, 0.2), 0 1px 0 rgba(0, 0, 0, 0.2);
	-webkit-transition: all 1s ease;
	-moz-transition: all 1s ease;
	-o-transition: all 1s ease;
	transition: all 1s ease;
}
a.animated-button:link:after, a.animated-button:visited:after {
	content: "";
	position: absolute;
	height: 0%;
	left: 50%;
	top: 50%;
	width: 150%;
	z-index: -1;
	-webkit-transition: all 0.75s ease 0s;
	-moz-transition: all 0.75s ease 0s;
	-o-transition: all 0.75s ease 0s;
	transition: all 0.75s ease 0s;
}
a.animated-button:link:hover, a.animated-button:visited:hover {
	color: #FFF;
	text-shadow: none;
}
a.animated-button:link:hover:after, a.animated-button:visited:hover:after {
	height: 450%;
}
a.animated-button:link, a.animated-button:visited {
	position: relative;
	display: block;
	margin: 30px auto 0;
	padding: 14px 15px;
	color: #fff;
	font-size:14px;
	border-radius: 0;
	font-weight: bold;
	text-align: center;
	text-decoration: none;
	text-transform: uppercase;
	overflow: hidden;
	letter-spacing: .08em;
	text-shadow: 0 0 1px rgba(0, 0, 0, 0.2), 0 1px 0 rgba(0, 0, 0, 0.2);
	-webkit-transition: all 1s ease;
	-moz-transition: all 1s ease;
	-o-transition: all 1s ease;
	transition: all 1s ease;
}
a.animated-button.victoria-one {
	border: 2px solid #D24D57;
    width:300px;
}
a.animated-button.victoria-one:after {
	background: #D24D57;
	-moz-transform: translateX(-50%) translateY(-50%) rotate(-25deg);
	-ms-transform: translateX(-50%) translateY(-50%) rotate(-25deg);
	-webkit-transform: translateX(-50%) translateY(-50%) rotate(-25deg);
	transform: translateX(-50%) translateY(-50%) rotate(-25deg);
}
.dropdown-item:hover{color:#fff !important; background:#ffc107 !important; }
.nav .open>a, .nav .open>a:hover, .nav .open>a:focus{background: transparent;}
.nav>li>a:hover, .nav>li>a:focus{background:transparent;}

</style>
<script type="text/javascript">
<script>
/* Demo purposes only */
$(".hover").mouseleave(
function () {
$(this).removeClass("hover");
}
);

</script>
</head>
<body>

	<div id="container">
		       <header class="header">
		      
                    <nav class="navi navbar navbar-expand-lg navbar-light" id="mainNav">
                     <a href="/" class="navbar-brand js-scroll-trigger msa" style="color:rgba(255,255,255,0.5)"><img src="/resources/images/m-sa.png" style="padding-bottom: 18px;"></a>
                        <ul>
                            
                          <!--   <li class="nav-item"> <a class="nav-link js-scroll-trigger" id="triggerup" href="#">SignUp</a></li> -->
                            
                                
                             <!-- <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/include/header">header</a></li> -->
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/review/reviewList">Community</a></li>
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/store/storeFind">Takeout</a></li>
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/kiosk/screen">Kiosk</a></li>
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/pos/posmanagement">Pos</a></li>
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/order/orderDisplay">Display</a></li>
                       
                        </ul>
                          <ul class="nav navbar-nav menu-infobtn">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle menu-dropicon" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expaneded="false">
                        <i class="fa fa-cog fa-spin fa-fw menu-icon"></i>
                    </a>
                    <div class="dropdown-menu menu-dropmenu" style="left: -93px;">
                        <a class="dropdown-item modal_open modal_menu" data="modifyModal" id="triggerup" href="#">SignUp</a>
                            <c:choose>
                  <c:when test="${sessionScope.user eq null }">
          <a class="dropdown-item modal_open modal_menu" href="#"  id="trigger">Login</a> 
          </c:when>
          <c:otherwise>
              <a class="dropdown-item modal_open modal_menu" href="/user/userLogout">LogOut</a>
            </c:otherwise>
          </c:choose>
                          <c:choose>
          <c:when test="${sessionScope.user ne null }">
            <a class="dropdown-item modal_open modal_menu" href="/user/myPage">My Page</a>
          </c:when>
          </c:choose>
                    </div>
                </li>
            </ul>
                    </nav>
                </header>
           <div class="inline">
         <div class="div">
		<!-- <hr width="77%;"> -->
		<p class="reservation">RESERVATION</p>
		<p class="reservation">${sessionScope.places}</p>
		<!-- <hr width="77%;"> -->
		</div>
	<!-- 	<ul class="value-document">
			<li><span>날짜</span><span id="dateInnerHTML"></span></li>
			<li><span>시간</span><span id="hours"></span><span id="minutes"></span></li>
			<li><span>총금액</span><span id="priceSum"></span></li>
		</ul> -->
  <table class="type09">
            <thead>
            <tr>
                <th scope="cols" colspan="3">주문정보</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">날짜</th>
                <td><span id="dateInnerHTML"></span></td>
            </tr>
            <tr>
                <th scope="row">시간</th>
                <td><span id="hours"></span><span id="minutes"></span></td>
            </tr>
            <tr>
                <th scope="row">총금액</th>
                <td><span id="priceSum"></span></td>
            </tr>
            </tbody>
        </table>
        </div>		
		<div class="seats">
			<div class="left-box">
				<div id="orderList">
					<table id="orderListUl" class="table">
					 <tr class="orderListTr">
					 <th style="width:160px">상품정보</th>
					 <th style="width: 90px;">가격</th>
					 <th style="width: 109px;">수량</th>
					 <th style="width: 121px;"><a href="#" class="button3" id="orderReset">리셋</a></th>
					 </tr>
					 </table>
				</div>
				<div id="calendar">
					
				</div>
			</div>
			<div class="right-box">
				<ul>
					<li><button type="button" class="chickenMenuLoad">치킨
							메뉴</button></li>
					<li><button type="button" class="burgerMenuLoad">버거
							메뉴</button></li>
					<li><button type="button" class="sideMenuLoad">사이드 메뉴</button></li>
					<li><button type="button" class="drinkMenuLoad">음료류</button></li>
				</ul>
				<ul class="chickenList" id="chickenList">
					<c:choose>
						<c:when test="${chicken.size() > 0 }">
							<c:forEach items="${chicken}" var="chicken">
								<li>
									<img src="/upload/${chicken.menuImg}" class="menu-item"
									data-id="${chicken.dataId}" data-num="${chicken.menuId }"
									value="${chicken.menuName}" data-code="${chicken.menuPrice }"
									data-cnt="1">${chicken.menuName }</li>
							</c:forEach>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</ul>
				<ul class="burgerList" id="burgerList">
					<c:choose>
						<c:when test="${burger.size() > 0 }">
							<c:forEach items="${burger}" var="burger">
								<li>
									<img src="/upload/${burger.menuImg}" class="menu-item"
									data-id="${burger.dataId}" value="${burger.menuName}"
									data-code="${burger.menuPrice }" data-cnt="1"
									data-num="${burger.menuId }">${burger.menuName}</li>
							</c:forEach>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</ul>
				<ul class="setList" id="setList">
					<c:choose>
						<c:when test="${burger.size() > 0 }">
							<c:forEach items="${burger}" var="burger">
								<li>
									<img src="/upload/${burger.menuImg}" class="set-item"
									data-id="set${burger.dataId}" value="${burger.menuName} 세트"
									data-code="${burger.menuPrice }" data-cnt="1"
									data-num="${burger.menuId }">${burger.menuName} 세트</li>
							</c:forEach>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</ul>
				<ul class="setSelect" style="margin: 0 auto;">
					<li>
					<figure class="snip1384">
            <img src="/resources/images/set.jpg" alt="" class="setButton"/>
            <figcaption class="setButton">
              <h3>세트<br>(set)</h3>
               <i class="ion-ios-arrow-right"></i>
            	</figcaption>
            <a href="#" class="setButton"></a>
          </figure>
					</li>
<!-- <button type="button" class="setButton">세트</button> -->

					<li>
			<figure class="snip1384">
            <img src="/resources/images/singleimg.jpg" height="205px;" alt="" class="singleButton"/>
            <figcaption class="singleButton">
              <h3>단품(single)</h3>
       
               <i class="ion-ios-arrow-right"></i>
            	</figcaption>
            <a href="#" class="singleButton"></a>
          </figure>
					
					</li>
					<!-- <button type="button" class="singleButton">단품</button> -->
				</ul>
				<ul class="sideMenuList" id="sideMenuList">
					<c:choose>
						<c:when test="${side.size() > 0 }">
							<c:forEach items="${side}" var="side">
								<li>
									<img src="/upload/${side.menuImg}" class="menu-item"
									data-id="${side.dataId}" value="${side.menuName}"
									data-code="${side.menuPrice }" data-cnt="1"
									data-num="${side.menuId }">${side.menuName }</li>
							</c:forEach>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</ul>
				<ul class="drinkMenuList" id="drinkMenuList">
					<c:choose>
						<c:when test="${drink.size() > 0 }">
							<c:forEach items="${drink}" var="drink">
								<li>
									<img src="/upload/${drink.menuImg}" class="menu-item"
									data-id="${drink.dataId}" value="${drink.menuName}"
									data-code="${drink.menuPrice }" data-cnt="1"
									data-num="${drink.menuId }">${drink.menuName }</li>
							</c:forEach>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</ul>
				<ul class="setSideList" id="sideMenuList">
					<c:choose>
						<c:when test="${setSide.size() > 0 }">
							<c:forEach items="${setSide}" var="setSide">
								<li>
									<img src="/upload/${setSide.menuImg}" class="set-side-item"
									 value="${setSide.menuName}" data-id="${setSide.dataId }"
									data-code="${setSide.menuPrice }" data-cnt="1"
									data-num="${setSide.sdId }">${setSide.menuName }</li>
							</c:forEach>
						</c:when>
						<c:otherwise> 
						</c:otherwise>
					</c:choose>
				</ul> 
				<ul class="setDrinkList" id="sideMenuList">
					<c:choose>
						<c:when test="${setDrink.size() > 0 }">
							<c:forEach items="${setDrink}" var="setDrink">
								<li>
									<img src="/upload/${setDrink.menuImg}" class="set-drink-item"
									 value="${setDrink.menuName}" data-id="${setDrink.dataId }"
									data-code="${setDrink.menuPrice }" data-cnt="1"
									data-num="${setDrink.sdId }">${setDrink.menuName }</li>
							</c:forEach>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
				
		</div>
		<div id="reservedTimeList"></div>
		<div class="orderListMsg">
			<ul id="msg">
			</ul>
		</div>
		<div class="order-center">
					<a href="#login_form" class="snip1535" id="orderModal">주 문</a>
				</div>
		 <div style="clear: both; position: relative;">
        
        <div>
            <div class="mainFootArea">
                <div class="footerNoticeArea">
                    <h3>NOTICE&NEWS</h3>
                    <div class="footNoticeWrap">
                        <ul class="footNoticeUl">
                            <li>
                                <p>
                                    <a href="">공휴일 및 넷째 주 일요일 휴업</a>
                                </p>
                            </li>
                        </ul>
                    </div>
                </div>
                
                <ul class="footQuickUl">
                    <li><a href=""><img src="/resources/images/24.gif"></a></li>
<!--                     <li><a href=""><img src="images/drive.jpg"></a></li>-->
                     <li><a href=""><img src="/resources/images/home.gif"></a></li>
                     <li class="btn_ria_insta"><a href=""><img src="/resources/images/instargram.gif"></a></li>
                     <li class="btn_ria_movie"><a href=""><img src="/resources/images/grow.gif"></a></li>
                </ul>
            </div>          
        </div>
                  
                   <footer class="footer">
                    <div class="inner">
                        <address>
                            <p>대전광역시 동구 우암로 352-21 대표문의 : 010-8950 - 1914</p>
                            <p>고객지원센터 010-5456-0801 (고객불편사항 등)대표자:주이원박조</p>
                            <p>COPYRIGHT &copy; 2019 M-SA ALL RIGHT RESERVED</p>
                        </address>
                        <div>
                            <img src="/resources/images/footer2.jpg">
                            <img src="/resources/images/footer.jpg">
                            <img src="/resources/images/footer4.gif">
                            <img src="/resources/images/footer5.gif">
                            <img src="/resources/images/footer6.gif">
                        </div>
                        
                        
                    </div>
                </footer>
    </div>
	</div>

	<!--/#error-->
<script src="/resources/js/jquery.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery.prettyPhoto.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/jquery.isotope.min.js"></script>
	<script src="/resources/js/main.js"></script> 
	<script type="text/javascript" src="/resources/js/seatAppointment.js"></script>
	
		
		<div id="modalLayer">
						
		<div class="modalContent">
		<button type="button" class="modalLayerClose">X</button>
			<div class="modalContentHide">
				<h1 class="title">결제 방법을 선택해주세요.</h1>
				<div class="col-md-3 col-sm-3 col-xs-6"> <a href="#" id="modalContentCard" class="btn2 btn-sm animated-button victoria-one">카드</a> </div>
			    <div class="col-md-3 col-sm-3 col-xs-6"> <a href="#" id="modalContentPay" class="btn btn-sm animated-button victoria-two" style="width:300px;">현금</a> </div></div>
		
			<div class="modalContentShow" style="text-align: center; color:#BDC3C7">
				<h1 class="titlecash">무통장 입금</h1> 
          		<ul>
          			<li>은행명 : 신한은행</li>
          			<li>계좌번호 : 110-397-061375</li>
          			<li class="modalContentShowPay"></li>
          		</ul> 
          <a href="#" id="submitcash" class="buttonsubmit">보내기</a> <!-- <input type="button" id="submitcash" value="보내기"> --> 
			</div>
<!-- 			카드 결제 과정 -->
			<div class="myCardCheck" style="text-align: left; color: #BDC3C7;">
			    <div class="button_base b03_skewed_slide_in userInputCard">
                <div>직접 입력 하기</div>
                <div></div>
                <div class="userInputCard" style="margin-bottom: 10px;">직접 입력 하기</div>
            </div>
			 
				<!-- <button type="button" class="userInputCard">직접 입력 하기</button> -->
				<div><span>은행</span></div>
			<div>
				<select name="bankName" id="myBankName" style="width:140px;">
					<option>농협</option>
					<option>신한은행</option>
					<option>국민은행</option>
					<option>하나은행</option>
					<option>카카오뱅크</option>
				</select>
			</div>
				<div><span>카드 번호</span></div>
				<input type="text" name="cardNum" id="myCardNum" style="width: 200px;">
		
				<div><span>카드 비밀번호</span></div>
				<div><input type="password" name="myCardPw" id="myCardPw" style="width: 200px;"></div>
			<a id="cardPay" class="buttonsubmit">결제</a>
					</div>
					
			<div class="cardPay">
			  <div class="button_base b03_skewed_slide_in myCardLoad">
                <div>내 카드 가져오기</div>
                <div></div>
                <div class="userInputCard">내 카트 가져오기</div>
            </div>
				<!-- <button type="button" class="myCardLoad">내 카드 가져오기</button> -->
				<div><span>은행</span></div>
			<div>
				<select name="bankName" id="bankName">
					<option>농협</option>
					<option>신한은행</option>
					<option>국민은행</option>
					<option>하나은행</option>
					<option>카카오뱅크</option>
				</select>
			</div>
				<div><span>카드 번호</span></div>
				<input type="text" name="cardNum" id="cardNum" style="float:left; width:200px; text-align: left !important;">
				<div style="clear: both"><span >만기일</span></div>
			<div id="validity">
				<select name="validityMonth" id="validityMonth" >
					<option value="" selected>MM</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option>
				</select>
				<select name="validityYears" id="validityYears">
					<option value="" selected>YY</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
				</select>
			</div>
				<div><span>보안 코드</span></div>
				<div><input type="text" name="securityCode" id="securityCode"></div>
				<div><span>카드 비밀번호</span></div>
				<div><input type="password" name="cardPw" id="cardPw"></div>
			<a id="cardAdd" class="buttonsubmit" >결제</a></div>		
					
<!-- 			카드 결제 과정 -->					
				</div>
		</div>
	<!-- The Modal -->
	 <div id="myModal" class="modal">
  <div class="modal-content">
  <div class="content-display"> 
  <h2 style="text-align: center; margin-top:20px; ">시간을 선택해주세요</h2>
        	
           <div class="timenCenter">
           		 <div class="timeWrapper">
           		<button type="button" class="btn-three green rounded" id="am-btn">오전</button>
           		<button type="button" class="btn-three green rounded" id="pm-btn">오후</button>
           		</div>
           		 
				 <div id="containerScroll" class="sb02 hours" >
                    <div class="item">1</div>
                    <div class="item">2</div>
                    <div class="item">3</div>
                    <div class="item">4</div>
                    <div class="item">5</div>
                    <div class="item">6</div>
                    <div class="item">7</div>
                    <div class="item">8</div>
                    <div class="item">9</div>
                    <div class="item">10</div>
                    <div class="item">11</div>
                    <div class="item">12</div>
            </div>
            <div id="containerScroll3" class="sb02 hours" >
                    <div class="item">13</div>
                    <div class="item">14</div>
                    <div class="item">15</div>
                    <div class="item">16</div>
                    <div class="item">17</div>
                    <div class="item">18</div>
                    <div class="item">19</div>
                    <div class="item">20</div>
                    <div class="item">21</div>
                    <div class="item">22</div>
                    <div class="item">23</div>
                    <div class="item">24</div>
            </div>
				<div id="containerScroll2" class="sb02 minutes" >
                    <div class="item">00</div>
                    <div class="item">05</div>
                    <div class="item">10</div>
                     <div class="item">15</div>
                    <div class="item">20</div>
                    <div class="item">25</div>
                    <div class="item">30</div>
                    <div class="item">35</div>
                    <div class="item">40</div>
                    <div class="item">45</div>
                    <div class="item">50</div>
                    <div class="item">55</div>
            </div>
            <div class="timeBtnCenter">
             <button type="button" id="timeSelect" class="btn-two green rounded">선택</button>
             </div>
            </div>
           </div>
          </div>
         </div>
	<!-- The Modal -->
	<div id="menuModal" class="addModal" style="position: relative;">
		<!-- Modal content -->
		<div class="addModal-content">
			<div>
				<button type="button" onclick="menuModalClose()"
					style="position: relative; left: 450px;">닫기</button>
			</div>
			<form id="menuAddForm" enctype="multipart/form-data" method="post"
				action="/takeOutReservation/menuAdd">
				<select name="menuCategory">
					<option value="chicken">chicken</option>
					<option value="burger">burger</option>
					<option value="side">side</option>
					<option value="drink">drink</option>
				</select>
				<div>
					<span>메뉴 이름<input type="text" name="menuName"></span>
				</div>
				<div>
					<span>메뉴 가격<input type="text" name="menuPrice"></span>
				</div>
				<div>
					<span>메뉴 이미지<input type="file" name="file"></span>
				</div>
				<div>
					<button type="submit">메뉴 등록</button>
				</div>
			</form>

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
			<ul style="list-style: none;" class="reservedCheck">
				<li class="space">${sessionScope.places}<input type="hidden" name="frcName" value="${sessionScope.places}"></li>
				<li><span class="span">아이디  <input type="text" name="userId" id="userId" readonly="readonly" value="${sessionScope.user}" class="input"></span></li>
				<li><span class="span">이름  <input type="text" name="reservedName" class="input" id="orderUserName"></span></li>
				<li><span class="span">전화번호  <input type="text" name="reservedPhone" class="input" id="orderUserPhone"></span></li>
				<li><span class="span">날짜</span>  <span id="dateCheck"></span></li>
				<li><span class="span">시간 </span><span id="timeModalHours"></span><span id="timeModalMinutes"></span></li>
				<li><span class="span">금액</span>  <span id="payment"></span></li>
			</ul>
			 <input type="hidden" id="formMenuPrice" name="formMenuPrice" value="" /> 
			 <input type="hidden" id="formReservedDate" name="formReservedDate" value="" />
			 <input type="hidden" id="formReservedTime" name="formReservedTime" value="" />
			<div class="center">
<!-- 			<a href="#modalLayer" class="modalLink">간단한 모달 창 만들기</a> -->
				<button id="msg_process" type="button"
					 class="snip1535 center modalLink">주문</button>  <!-- onclick="takeOutReservedGo();" -->
			</div>
			<!--결제 선택  -->
			<a class="close" href="#close"></a>
		</form>
		
	</div>
	
	<!-- 영수증 -->
	<div class="documentPopup">
		<div class="documentCenter">
		<h2>[ 영수증 ]</h2>
			<ul style="list-style: none;" class="documentUl">
				<li><span>[ 매장명 ]</span><span>${sessionScope.places}</span></li>
				<!-- <li><span>[ 주 &nbsp;&nbsp;&nbsp;소 ]</span><span>주소</span></li> -->
				<li><span>[ 발행일 ]</span><span id="documentTimeCheck"></span></li>
				<li><span>[ 영수증 ]</span><span id="documentTimeCheck"><span id="documentTimeModalHours"></span></span></li>
				<li><span>[주문번호]</span><span></span></li>
			</ul>
			<table class="menuTable">
				<thead>
					<tr>
						<th>메뉴명</th>
						<th>수 량</th>
						<th>금 액</th>
					</tr>
				</thead>
				<tbody class="documentTable">
				</tbody>
			</table>
			<table class="totalTable">
			<thead>
				<tr>
					<th style="letter-spacing: 5px;">합계 금액</th>
					 <th></th>
					<th><span id="documentPayment"></span></th>
				</tr>
				</thead>
			</table>
			<div class="documentBtnCenter">
				<button id="" type="button"
					onclick="takeOutReservedGo()" class="documentClose">출력</button>
			</div>
		<!-- 	<a class="close" href="#close"></a> -->
	</div>
	</div>
</body>
</html>