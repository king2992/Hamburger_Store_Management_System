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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>



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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href='/resources/fullcalendar-4.0.2/packages/core/main.css'
	rel='stylesheet' />
<link href='/resources/fullcalendar-4.0.2/packages/daygrid/main.css'
	rel='stylesheet' />
<link rel="stylesheet" type="text/css"
	href="/resources/css/seatAppointment.css">
<script src="http://localhost:84/socket.io/socket.io.js"></script>
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

		<!-- <div><p class="ticket" ><a href="/">Hamburger Take Out</a><button type="button" onclick="menuModal()" style="width:80px; height:40px; font-size:15px; line-height:40px; margin-left:20px;">메뉴 등록</button></p></div> -->
		<!--     <div class="container"> -->

		<hr width="30%;">
		<p class="reservation">RESERVATION</p>
		<hr width="30%;">
		<ul class="value-document">
			<li><span>날짜</span><span id="dateInnerHTML"></span></li>
			<li><span>시간</span><span id="time"></span></li>
			<li><span>총금액</span><span id="priceSum"></span></li>
		</ul>
		
		<div class="seats" style="position: relative; top: 35px;">
			<div class="left-box">
				<div id="orderList">
					<ul id="orderListUl"></ul>
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
								<li><button type="button" onclick="menuListDel()"
										style="width: 20px; height: 20px;">X</button>
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
								<li><button type="button" onclick="menuListDel()"
										style="width: 20px; height: 20px;">X</button>
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
								<li><button type="button" onclick="menuListDel()"
										style="width: 20px; height: 20px;">X</button>
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
			<!--     	<button id="msg_process">전송</button> -->
		</div>
		<!-- <div class="tnb" style="height: 160px;">
			<div class="tnb-container">
				<div class="tnb-reset"></div>
				<div class="tnb step1">
					<div style="text-align: right; margin-left: 100px;">
						<div class="info date">
							<ul class="date">
								<li class="header">날짜</li>
								<li id="dateInnerHTML" class="data"></li>
							</ul>
							<ul class="date">
								<li class="header"
									style="position: absolute; top: 30px; left: 180px;">시간</li>
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
						<a href="#login_form" class="btn-right" id="orderModal">주 문</a>
					</div>
					<div>
						<a href="" class="btn-left">이 전</a>
					</div>
				</div>
			</div>

		</div>
 -->
		<!--          <script src="js/jquery.js"></script>
   <script src="js/bootstrap.min.js"></script>
   <script src="js/jquery.prettyPhoto.js"></script>
  <script src="js/owl.carousel.min.js"></script>

  <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script> -->

   				
		<!--  </div> -->

 		<!-- 	<div class="side">
                    <a href="" alt="logo" class="logo"><img src></a>
                    <div class="top-menu">
                        <ul class="menu-ul">
                            <li>
                                <img src="s1.png" class="s1">
                                <span class="a1">날짜</span><span id="dateInnerHTML" class=""></span>
                            </li>
                            <li>
                               <span class="a1">시간</span><span id="time"></span>
                            </li>
                             <li>
                                <span class="a1">메뉴</span><span id="seatNumber"></span>
                            </li>
                            <li>
                                <span class="a1">총 금액</span><span id="priceSum"></span>
                            </li>
                           
                        </ul>
                    </div>
 -->





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
           <div><p style="text-align: center;"><span style="font-size: 14pt;"><b>시간을 선택해주세요.<span style="font-size: 24pt;"></span></b></span></p>
          <!--  <button type="button" onclick="amView()">오전</button><button type="button" onclick="pmView()">오후</button> -->
            <button type="button" class="directInput" data-tooltip-text="시간을 직접 입력 할 때 에는 정확한 시간을 입력해주세요 . ex) 오후09시,21시,21:00 ">직접 입력</button>
              <div class="divDirectInput">
	           
	            </div>
           </div>
           
            <!-- <p style="text-align: center; line-height: 1.5;" class="ampm">오전</p> -->
        <!--    <div id="am"> -->
           <div class="left-am">
	          
  <div class="button-4"><div class="eff-4"></div><a id="" onClick="timeAdd();" >01:00</a></div>
 <div class="button-4"><div class="eff-4"></div><a id="" onClick="timeAdd();" >07:00</a></div>
<div class="button-4"><div class="eff-4"></div><a id="" onClick="timeAdd();" >13:00</a></div>
<div class="button-4"><div class="eff-4"></div><a id="" onClick="timeAdd();" >19:00</a></div>
<div class="button-4"><div class="eff-4"></div><a id="" onClick="timeAdd();" >02:00</a></div>
<div class="button-4"><div class="eff-4"></div><a id="" onClick="timeAdd();" >08:00</a></div>
<!--             <div class="right-p"> -->
<div class="button-4"><div class="eff-4"></div><a id="" onClick="timeAdd();" >14:00</a></div>
<div class="button-4"><div class="eff-4"></div><a id="" onClick="timeAdd();" >20:00</a></div>
<div class="button-4"><div class="eff-4"></div><a id="" onClick="timeAdd();" >03:00</a></div>
<div class="button-4"><div class="eff-4"></div><a id="" onClick="timeAdd();" >09:00</a></div>
<div class="button-4"><div class="eff-4"></div><a id="" onClick="timeAdd();" >15:00</a></div>
<div class="button-4"><div class="eff-4"></div><a id="" onClick="timeAdd();" >21:00</a></div>
           <!--  <p style="text-align: center; line-height: 1.5;"><br /></p> -->
       <!--      </div> -->
            
            </div>
        <!--     </div> -->
      <!--       <div id="pm"> -->
  <!--         <p style="text-align: center; line-height: 1.5;" class="ampm pm">오후</p> -->
          <div class="right-pm">
            
	             <!-- <div class="divDirectInput">
	            <button type="button" class="directInput" data-tooltip-text="시간을 직접 입력 할 때 에는 정확한 시간을 입력해주세요 . ex) 오후09시,21시,21:00 ">직접 입력</button> 
	            </div> -->
           <!-- <p style="text-align: center; line-height: 1.5;"> --><!-- </p> -->
<div class="button-4"><div class="eff-4"></div><a id="" onClick="timeAdd();" >04:00</a></div>
<div class="button-4"><div class="eff-4"></div><a id="" onClick="timeAdd();" >10:00</a></div>
<div class="button-4"><div class="eff-4"></div><a id="" onClick="timeAdd();" >16:00</a></div>
<div class="button-4"><div class="eff-4"></div><a id="" onClick="timeAdd();" >22:00</a></div>
<div class="button-4"><div class="eff-4"></div><a id="" onClick="timeAdd();" >05:00</a></div>
<div class="button-4"><div class="eff-4"></div><a id="" onClick="timeAdd();" >11:00</a></div>
<div class="button-4"><div class="eff-4"></div><a id="" onClick="timeAdd();" >17:00</a></div>
<div class="button-4"><div class="eff-4"></div><a id="" onClick="timeAdd();" >23:00</a></div>
<div class="button-4"><div class="eff-4"></div><a id="" onClick="timeAdd();" >06:00</a></div>
<div class="button-4"><div class="eff-4"></div><a id="" onClick="timeAdd();" >12:00</a></div>
<div class="button-4"><div class="eff-4"></div><a id="" onClick="timeAdd();" >18:00</a></div>
<div class="button-4"><div class="eff-4"></div><a id="" onClick="timeAdd();" >24:00</a></div>
      <!--       <p style="text-align: center; line-height: 1.5;"><br /></p> -->
       <!--      <p><br /></p> -->
          <!--   </div> -->
            </div>
            </div>
            </div>
  </div>

<!-- </div>  -->
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
				<li><span>아이디 : <input type="text" name="userId"
						value="${sessionScope.user}"></span></li>
				<li><span>이름 : <input type="text" name="reservedName"></span></li>
				<li><span>전화번호 : <input type="text" name="reservedPhone"></span></li>
				<li>날짜 : <span id="dateCheck"></span></li>
				<li>시간 : <span id="timeModal"></span></li>
				<li>결제 금액 : <span id="payment"></span></li>
			</ul>
			<input type="hidden" value="${sessionScope.user}"> <input
				type="hidden" id="formMenuPrice" name="formMenuPrice" value="" /> <input
				type="hidden" id="formReservedDate" name="formReservedDate" value="" />
			<input type="hidden" id="formReservedTime" name="formReservedTime"
				value="" />
			<div>
				<!-- 				<a href="#" id="msg_process" onclick="takeOutReservedGo()"/>주문</a> -->
				<button id="msg_process" type="button"
					onclick="takeOutReservedGo();">주문</button>
			</div>
			<a class="close" href="#close"></a>
		</form>
	</div>




</body>
</html>