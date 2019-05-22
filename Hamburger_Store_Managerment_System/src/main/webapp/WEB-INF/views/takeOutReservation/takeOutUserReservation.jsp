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
<link href="https://fonts.googleapis.com/css?family=Hind"
	rel="stylesheet">
<link href="/resources/css/reservated.css" rel="stylesheet">
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/css/icomoon.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://localhost:84/socket.io/socket.io.js"></script>
<script src="sweetalert2.all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>

<!--   <link href="/resources/css/main.css" rel="stylesheet">  
<!--   <link href="/resources/css/responsive.css" rel="stylesheet">  -->
<!-- 모달  -->
<!--  <link href="/resources/css/bootstrap-min.css" rel="stylesheet">
<link href="/resources/css/font-awesome-min.css" rel="stylesheet">
<link href="/resources/css/prettyPhoto.css" rel="stylesheet"> -->



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
	$(document).ready(function() {
		var socket = io("http://localhost:84");
		//msg에서 키를 누를떄
		$("#msg").keydown(function(key) {
			//해당하는 키가 엔터키(13) 일떄
			if (key.keyCode == 13) {
				//msg_process를 클릭해준다.
				msg_process.click();
			}
		});
		//msg_process를 클릭할 때
		$("#msg_process").click(function() {
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
	height:450px;
	
	 
	
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
</style>
</head>
<body>

	<div id="container">
		<nav
			class="navbar navbar-expand-sm navbar-dark fixed-top1 layout-menu"
			style="padding:0;"> <!-- Brand --> <a
			class="navbar-brand menu-title" href='<c:url value="/"/>'> <span
			class="menu-pre">store</span><span class="menu-last">management</span>
		</a> <!-- Links -->
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link"
				href='<c:url value="/"/>'> <i class="fa fa-home menu-icon"></i>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href='<c:url value="/review/reviewList"/>'> <i
					class="fa fa-edit menu-icon"></i>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href='<c:url value="/study/list"/>'> <i
					class="fas fa-book menu-icon"></i>
			</a></li>
		</ul>

		<ul class="nav navbar-nav menu-infobtn">
			<li class="dropdown"><a href="#"
				class="dropdown-toggle menu-dropicon" data-toggle="dropdown"
				role="button" aria-haspopup="true" aria-expaneded="false"> <i
					class="fa fa-cog fa-spin fa-fw menu-icon"></i>
			</a>
				<div class="dropdown-menu menu-dropmenu">
					<a class="dropdown-item modal_open modal_menu" data="modifyModal"
						href="#">정보수정</a> <a class="dropdown-item modal_open modal_menu"
						data="passModal" href="#">비밀번호변경</a> <a
						class="dropdown-item modal_open modal_menu" data="logoutModal"
						href="<c:url value='/user/userLogout'/>">로그아웃</a> <a
						class="dropdown-item modal_open modal_menu" data="secessionModal"
						href="#">회원탈퇴</a>
				</div></li>
		</ul>
		</nav>
		<hr width="30%;">
		<p class="reservation">RESERVATION</p>
		<p class="reservation">${sessionScope.places}</p>
		<hr width="30%;">
		<ul class="value-document">
			<li><span>날짜</span><span id="dateInnerHTML"></span></li>
			<li><span>시간</span><span id="hours"></span><span id="minutes"></span></li>
			<li><span>총금액</span><span id="priceSum"></span></li>
		</ul>
		
		<div class="seats" style="position: relative; top: 35px;">
			<div class="left-box">
				<div id="orderList">
					<table id="orderListUl" class="table">
					 <tr>
					 <th>상품정보</th>
					 <th>가격</th>
					 <th>수량</th>
					 <th>삭제</th>
					 </tr>
					 </table>
				</div>
				<div id="calendar">
					<div class="dateAlert"
						style="position: relative; top: 50px; left: 10px; z-index: 99999; max-width: 1024px; color: black; opactiy: 1.0; font-family: 'Hind', sans-serif">
						<img src="/resources/img/icon101.png"
							style="width: 70px; height: 70px; float: left;">
						<p style="font-size: 35px; position: relative; top: 15px;">날짜를
							선택해 주세요.</p>
					</div>
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
							<p>메뉴가 없슴돠.</p>
						</c:otherwise>
					</c:choose>
				</ul>
				<ul class="burgerList" id="burgerList">
					<c:choose>
						<c:when test="${burger.size() > 0 }">
							<c:forEach items="${burger}" var="burger">
								<li><button type="button" onclick="menuListDel()"
										style="width: 20px; height: 20px;">X</button>
									<img src="/upload/${burger.menuImg}" class="menu-item"
									data-id="${burger.dataId}" value="${burger.menuName}"
									data-code="${burger.menuPrice }" data-cnt="1"
									data-num="${burger.menuId }">${burger.menuName}</li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<p>메뉴가 없슴돠.</p>
						</c:otherwise>
					</c:choose>
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
							<p>메뉴가 없슴돠.</p>
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
							<p>메뉴가 없슴돠.</p>
						</c:otherwise>
					</c:choose>
				</ul>

			</div>
				<div class="order-center">
					<a href="#login_form" class="snip1535" id="orderModal">주 문</a>
				</div>
		</div>
		<div id="reservedTimeList"></div>
		<div class="orderListMsg">
			<ul id="msg">
			</ul>
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

	<!-- The Modal -->
	 <div id="myModal" class="modal">
  <div class="modal-content">
  <div class="content-display"> 
  <h2 style="text-align: center; margin-top:40px;">시간을 선택해주세요</h2>
         <!--   <div><p style="text-align: center;"><span style="font-size: 14pt;"><b>시간을 선택해주세요.<span style="font-size: 24pt;"></span></b></span></p>
           <button type="button" onclick="amView()">오전</button><button type="button" onclick="pmView()">오후</button>
            <button type="button" class="directInput button buttonblack" data-tooltip-text="시간을 직접 입력 할 때 에는 정확한 시간을 입력해주세요 . ex) 오후09시,21시,21:00 ">직접 입력</button>
              <div class="divDirectInput">
	           
	            </div>
           </div> -->
           
           <div class="timenCenter">
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
         <!--    </div> -->
            </div>
            <!-- <div class="right-pm"> -->
				<div id="containerScroll2" class="sb02 minutes" >
                    <div class="item">01</div>
                    <div class="item">02</div>
                    <div class="item">03</div>
                    <div class="item">04</div>
                    <div class="item">05</div>
                    <div class="item">06</div>
                    <div class="item">07</div>
                    <div class="item">08</div>
                    <div class="item">09</div>
                    <div class="item">10</div>
                    <div class="item">11</div>
                    <div class="item">12</div>
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
                    <div class="item">25</div>
                    <div class="item">26</div>
                    <div class="item">27</div>
                    <div class="item">28</div>
                    <div class="item">29</div>
                    <div class="item">30</div>
                     <div class="item">31</div>
                    <div class="item">32</div>
                    <div class="item">33</div>
                    <div class="item">34</div>
                    <div class="item">35</div>
                    <div class="item">36</div>
                    <div class="item">37</div>
                    <div class="item">38</div>
                    <div class="item">39</div>
                    <div class="item">40</div>
                     <div class="item">41</div>
                    <div class="item">42</div>
                    <div class="item">43</div>
                    <div class="item">44</div>
                    <div class="item">45</div>
                    <div class="item">46</div>
                    <div class="item">47</div>
                    <div class="item">48</div>
                    <div class="item">49</div>
                    <div class="item">50</div>
                     <div class="item">51</div>
                    <div class="item">52</div>
                    <div class="item">53</div>
                    <div class="item">54</div>
                    <div class="item">55</div>
                    <div class="item">56</div>
                    <div class="item">57</div>
                    <div class="item">58</div>
                    <div class="item">59</div>
                    
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
				<li><span class="span">아이디  <input type="text" name="userId" readonly="readonly" value="${sessionScope.user}" class="input"></span></li>
				<li><span class="span">이름  <input type="text" name="reservedName" class="input"></span></li>
				<li><span class="span">전화번호  <input type="text" name="reservedPhone" class="input"></span></li>
				<li><span class="span">날짜</span>  <span id="dateCheck"></span></li>
				<li><span class="span">시간 </span><span id="timeModalHours"></span><span id="timeModalMinutes"></span></li>
				<li><span class="span">금액</span>  <span id="payment"></span></li>
			</ul>
			 <input type="hidden" id="formMenuPrice" name="formMenuPrice" value="" /> 
			 <input type="hidden" id="formReservedDate" name="formReservedDate" value="" />
			 <input type="hidden" id="formReservedTime" name="formReservedTime" value="" />
			<div class="center">
				<button id="msg_process" type="button"
					 class="snip1535 center">주문</button>  <!-- onclick="takeOutReservedGo();" -->
					 
			</div>
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
				<!-- 	<tr>
						<th><span id="documentMenuName"></span></th>
						<th><span id="documentCnt"></span></th>
						<th><span id="documentPrice"></span></th>
					</tr> -->
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
			   <button type="button" id="cancel" class="documentClose">취소</button> 
			</div>
		<!-- 	<a class="close" href="#close"></a> -->
	</div>
	</div>
	<script>
	$(document).on('click','#msg_process',function() {
		/* $('.documentPopup').css('display','block');
		$('.popup').css('display','none'); */
		/* $('.documentPopup').show(); */
		$('.popup').hide();
		$('.overlay').hide();
		$('.documentPopup').show();
		
		var documentPayment = $('#priceSum').text();
		var documentTimeCheck = $('#dateInnerHTML').text();
		var documentHours = $('#timeModalHours').text();
		var documentMinutes = $('#timeModalMinutes').text();
		var documentTime = documentTimeCheck + " - " + documentHours + " " + documentMinutes;
		
	
		
		$('#documentTimeModalHours').text(documentTime);
		$('#documentPayment').text(documentPayment);
		$('#documentTimeCheck').text(documentTimeCheck);
		
		
	  /*   var ordermenuName = $('.orderMenuName').text(); */
     	
		/* var price = $('.menu-price').text(); */
		
 		/*  $('#documentMenuName').text(ordermenuName);  */
/* 		$('#documentCnt').text(cnt); */
		/* $('#documentPrice').text(price);  */
		/* $('#menuName').text(menuName); */
	});
	
	$('.documentClose').click(function(){
		$('.documentPopup').hide();
	});
	
	</script>
</body>
</html>