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
     <link href="/resources/css/reservated.css" rel="stylesheet">
    <!-- core CSS -->
    
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/font-awesome.min.css" rel="stylesheet">
    <link href="/resources/css/animate.min.css" rel="stylesheet">
    <link href="/resources/css/prettyPhoto.css" rel="stylesheet">
    <link href="/resources/css/owl.carousel.min.css" rel="stylesheet">
    <link href="/resources/css/icomoon.css" rel="stylesheet">
    <link href="/resources/css/main.css" rel="stylesheet">
    <link href="/resources/css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="/resources/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/resources/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/resources/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/resources/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="/resources/images/ico/apple-touch-icon-57-precomposed.png">
    
 <!--  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/resources/js/seatAppointment.js"></script>
<script src='/resources/fullcalendar-4.0.2/packages/core/main.js'></script>
<script src='/resources/fullcalendar-4.0.2/packages/daygrid/main.js'></script>
<script src='/resources/fullcalendar-4.0.2/packages/timegrid/main.js'></script>
<script src='/resources/fullcalendar-4.0.2/packages/interaction/main.js'></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href='/resources/fullcalendar-4.0.2/packages/core/main.css' rel='stylesheet' />
<link href='/resources/fullcalendar-4.0.2/packages/daygrid/main.css' rel='stylesheet' />


<link rel="stylesheet" type="text/css"
	href="/resources/css/seatAppointment.css">
<title>예매</title>
<style type="text/css">


 /* The Modal (background) */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 10000; /* Sit on top */
                left: 0;
                top: 0;
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
<script>
function close_pop(flag) {
    $('#myModal').hide();
};
  
</script>
<script type="text/javascript">

  document.addEventListener('DOMContentLoaded', function() {
	  var calendarEl = document.getElementById('calendar');
	  var timeList = document.getElementById('timeList');
	  var reservedTimeList = document.getElementById("reservedTimeList");
	  var calendar = new FullCalendar.Calendar(calendarEl, {
	    plugins: [ 'interaction', 'dayGrid', 'timeGrid' ], 
	    selectable: true,
	    header: {
	      right: 'prev,next today'  
	    },
	     dateClick: function(info) {
	     var dateInnerHTML = document.getElementById('dateInnerHTML');
	     var reservedDate2 = document.getElementById('reservedDate2');
	     var dateCheck = document.getElementById('dateCheck');
	     var reservedTimeListChilds = reservedTimeList.childNodes;
	     
	     dateInnerHTML.innerHTML = info.dateStr ; 
	     dateCheck.innerHTML = info.dateStr ;
	     
	     reservedDate2.setAttribute("value", dateInnerHTML.innerHTML);
	    /*  reservedTimeList.innerHTML = "<h3>"+"예약 가능 시간"+"</h3>"+ 
		   "<div id='"+info.dateStr+"09:00~11:00' onclick='timeAdd()' style='cursor:pointer;'value='"+info.dateStr+"' data-code='11:00'>"+"09:00~11:00"+"</div>" +
		   "<div id='"+info.dateStr+"11:00~13:00' onclick='timeAdd()' style='cursor:pointer;'value='"+info.dateStr+"' data-code='13:00'>"+"11:00~13:00"+"</div>" +
		   "<div id='"+info.dateStr+"13:00~15:00' onclick='timeAdd()' style='cursor:pointer;'value='"+info.dateStr+"' data-code='15:00'>"+"13:00~15:00"+"</div>" +
		   "<div id='"+info.dateStr+"15:00~17:00' onclick='timeAdd()' style='cursor:pointer;'value='"+info.dateStr+"' data-code='17:00'>"+"15:00~17:00"+"</div>" +
		   "<div id='"+info.dateStr+"17:00~19:00' onclick='timeAdd()' style='cursor:pointer;'value='"+info.dateStr+"' data-code='19:00'>"+"17:00~19:00"+"</div>" +
		   "<div id='"+info.dateStr+"19:00~21:00' onclick='timeAdd()' style='cursor:pointer;'value='"+info.dateStr+"' data-code='21:00'>"+"19:00~21:00"+"</div>" ; */
		   $('#myModal').show();
		/*    $('#myModal').hide(); */
		
		   /* 삭제 예정
	      var result = [] ;
	      $.ajax({
		 		url : "/seatReservation/reservedTime",
		 		type : "GET",
		 		dataType : "JSON",
		 		success : function(data) {
		 			if(data.length == 0){
		 				reservedTimeList.innerHTML = "<h3>"+"예약 가능 시간"+"</h3>"+ 
						   "<div id='"+info.dateStr+"09:00~11:00' onclick='timeAdd()' style='cursor:pointer;'value='"+info.dateStr+"' data-code='11:00'>"+"09:00~11:00"+"</div>" +
						   "<div id='"+info.dateStr+"11:00~13:00' onclick='timeAdd()' style='cursor:pointer;'value='"+info.dateStr+"' data-code='13:00'>"+"11:00~13:00"+"</div>" +
						   "<div id='"+info.dateStr+"13:00~15:00' onclick='timeAdd()' style='cursor:pointer;'value='"+info.dateStr+"' data-code='15:00'>"+"13:00~15:00"+"</div>" +
						   "<div id='"+info.dateStr+"15:00~17:00' onclick='timeAdd()' style='cursor:pointer;'value='"+info.dateStr+"' data-code='17:00'>"+"15:00~17:00"+"</div>" +
						   "<div id='"+info.dateStr+"17:00~19:00' onclick='timeAdd()' style='cursor:pointer;'value='"+info.dateStr+"' data-code='19:00'>"+"17:00~19:00"+"</div>" +
						   "<div id='"+info.dateStr+"19:00~21:00' onclick='timeAdd()' style='cursor:pointer;'value='"+info.dateStr+"' data-code='21:00'>"+"19:00~21:00"+"</div>" ;
		 			}
		 			
		 			$.each(data, function(index,item){
		 					
		 				result += item.reservedDate+ item.reservedTime ; 
		 				
		 			 	reservedTimeList.innerHTML = "<h3>"+"예약 가능 시간"+"</h3>"+ 
						   "<div id='"+info.dateStr+"09:00~11:00' onclick='timeAdd()' style='cursor:pointer;'value='"+info.dateStr+"' data-code='11:00'>"+"09:00~11:00"+"</div>" +
						   "<div id='"+info.dateStr+"11:00~13:00' onclick='timeAdd()' style='cursor:pointer;'value='"+info.dateStr+"' data-code='13:00'>"+"11:00~13:00"+"</div>" +
						   "<div id='"+info.dateStr+"13:00~15:00' onclick='timeAdd()' style='cursor:pointer;'value='"+info.dateStr+"' data-code='15:00'>"+"13:00~15:00"+"</div>" +
						   "<div id='"+info.dateStr+"15:00~17:00' onclick='timeAdd()' style='cursor:pointer;'value='"+info.dateStr+"' data-code='17:00'>"+"15:00~17:00"+"</div>" +
						   "<div id='"+info.dateStr+"17:00~19:00' onclick='timeAdd()' style='cursor:pointer;'value='"+info.dateStr+"' data-code='19:00'>"+"17:00~19:00"+"</div>" +
						   "<div id='"+info.dateStr+"19:00~21:00' onclick='timeAdd()' style='cursor:pointer;'value='"+info.dateStr+"' data-code='21:00'>"+"19:00~21:00"+"</div>" ;		
		 			})
		 		}
		 	});    */
	      
	      
	    } ,
	    select: function(info) {
	    }
	    
	  });
	  calendar.render();
	  
	 
  });
	 
	 

function timeAdd(){
	var time = document.getElementById("time");
	var finishTime = document.getElementById("finishTime");
	var timeModal = document.getElementById("timeModal");
	var reservedTime = document.getElementById("reservedTime");
	time.innerHTML = event.target.innerHTML;
	finishTime.setAttribute("value", event.target.getAttribute("data-code"));
	reservedTime.setAttribute("value", event.target.innerHTML);
	timeModal.innerHTML = event.target.innerHTML;
	var seatArray = new Array();
 	
 	
 	
	var obj = new Object();
	var dateInnerHTML = document.getElementById("dateInnerHTML");
    obj.timeKey = dateInnerHTML.innerHTML + event.target.innerHTML ; 
	 	$.ajax({
	 		url : "/seatReservation/timeKey",
	 		type : "GET",
	 		dataType : "JSON",
	 		data :  obj,
	 		success : function(data) {	
	 			
	 			 $.each(data, function(index,item){
		 				if(0 < data.length){//예약 내역이 있는 좌석은 색깔 및 클릭 이벤트 막기
		 					$("[name='"+item.seatName+"']").find("[name=boothList]").attr("fill","#424242");	
		 					$("[name='"+item.seatName+"']").find("[name=boothList]").attr("style","pointer-events:none");
		 				}
		 			});
	 			 if(data.length == 0){//예약 내역이 없는 시간을 누르면 실행하라
	 				$.ajax({
	 			 		url : "/seatReservation/seatList",
	 			 		type : "GET",
	 			 		dataType : "JSON",
	 			 		success : function(data1) {	//예약 내역이 없는 경우 색깔 되돌리기 및 클릭 이벤트 막기 삭제
	 			 			$.each(data1, function(index,item){
	 			 					$("[name='"+item.seatName+"']").find("[name=boothList]").attr("fill","blue");
	 			 					$("[name='"+item.seatName+"']").find("[name=boothList]").removeAttr("style","pointer-events:none");
	 			 			});
	 			 		}

	 				});
	 			 }
	 			 
				}
	 	});
	 	
	 
}
</script>
</head>
<body>
	
	<!-- <div>
		<div id="seatNumber"></div>
		<div id="priceSum"></div>
		<div id="dateInnerHTML"></div>
		<div id="time"></div>
		<div style="float: left;">
			<button type="button" onclick="timeCheck()">이용가능 시간 확인</button>
			<div id="timeList"></div>
		</div> 
	</div> -->
	<!-- <div>

		<div>
			<input type="hidden" id="seatName" name="seatName" value="" /> <input
				type="hidden" id="ticketPrice" name="ticketPrice" value="" />
		</div>
	</div> -->


	<%-- <div style="text-align: center;">
		<jsp:useBean id="now2" class="java.util.Date" />
		<fmt:formatDate value="${now2}" pattern="yyyyMdd " var="today2" />
	</div> --%>
	<%-- <div>
		<input type="hidden" value="${today2}">
	</div>  --%>

<%-- <div id="calendar" >
</div>

<c:choose>
		<c:when test="${list.size() > 0}">	
			<svg version="1.1" xmlns="http://www.w3.org/2000/svg" id="svgArea">
				<c:forEach var="list" items="${list}">
					<g id="booth" name="${list.seatName }" class="${list.seatName}" onclick="${list.onclick}" onmouseover="style='cursor:pointer;'" value="${list.seatPrice }" >
			            <rect x="${list.x2}" y="${list.y2 }" fill="none" stroke="gray" stroke-miterlimit="10" width="48" height="48" />
			            <rect name="boothList" x="${list.x}" y="${list.y}" fill="${list.fill}" stroke="${list.stroke}" stroke-miterlimit="10" width="${list.width}" height="${list.height}" data-code="${list.status}" />
			        </g>
				</c:forEach>	
			</svg>
		</c:when>  
	<c:otherwise>왜 안나와</c:otherwise> 
</c:choose>
		<div id="reservedTimeList" >
	</div>
	<!-- 예매 버튼 눌렀을때-->

	<div class="panel" style="margin-left: 23%; margin-top: 2%;">
		<a href="#login_form" id="login_pop" onclick="dateCheck()">예매</a>
	</div> --%>
 <section class="window-height" id="error" style="background-image: url(/resources/img/background/village-burger-bar-3799973_1920.jpg);">
         <div><p class="ticket" ><a href="/">Hamburger Take Out</a></p></div>
       <div class="container">
           <div class="seats" style="position: relative; top: 35px;"> 
                <div class="left-box">
                	<div id="orderList">
                		<ul id="orderListUl"></ul>
                	</div>
                	<div id="calendar"></div>
               </div>
       <div class="right-box">
       <ul>
       		<li><button type="button" onclick="chickenBlock()">치킨 메뉴</button></li> 
   			<li><button type="button" onclick="burgerListBlock()">버거 메뉴</button></li>
   			<li><button type="button" onclick="sideMenuListBlock()">사이드 메뉴</button></li>
   			<li><button type="button" onclick="drinkMenuListBlock()">음료류</button></li>
   		</ul>
       	<ul class="chickenList" id="chickenList">
       			<li><img src="/resources/img/chickenMenu/chiPao.jpg" value="치파오" data-code="9800" >치파오</li>
       			<li><img src="/resources/img/chickenMenu/chiPaOChicken.jpg" value="치파오 치킨" data-code="8900">치파오 치킨</li>
       			<li><img src="/resources/img/chickenMenu/jjimHatDag.jpg" value="찜햇닭" data-code="10500">찜햇닭</li>
       			<li><img src="/resources/img/chickenMenu/JjimHatDagGangJung.jpg" value="찜햇닭 강정" data-code="9900">찜햇닭 강정</li>
       			<li><img src="/resources/img/chickenMenu/JjimHatDagWing.jpg" value="찜햇닭 윙" data-code="11000">찜햇닭 윙</li>
       			<li><img src="/resources/img/chickenMenu/masillaChicken.jpg" value="마실라 치킨" data-code="9500">마실라 치킨</li>
       			<li><img src="/resources/img/chickenMenu/masillaTender.jpg" value="마실라 텐더" data-code="8500">마실라 텐더</li>
       			<li><img src="/resources/img/chickenMenu/masillaWing.jpg" value="마실라 윙" data-code="9200">마실라 윙</li>
       	</ul>
       	<ul class="burgerList" id="burgerList">
       			<li><img src="/resources/img/burger/increderble.jpg" value="언빌리버블버거" data-code="4500" >언빌리버블버거</li>
       			<li><img src="/resources/img/burger/20180220459667.jpg" value="인크레더블버거" data-code="5700" >인크레더블버거</li>
       			<li><img src="/resources/img/burger/20180416932721.jpg" value="마살라" data-code="5200" >마살라 버거</li>
       			<li><img src="/resources/img/burger/20180704461546.jpg" value="치즈베이컨버거" data-code="6200" >치즈베이컨버거</li>
       			<li><img src="/resources/img/burger/20181026165774.jpg" value="치킨커틀렛버거" data-code="6400" >치킨커틀렛버거</li>
       			<li><img src="/resources/img/burger/20190328995768.jpg" value="딥치즈버거" data-code="5500" >딥치즈버거</li>
       			<li><img src="/resources/img/burger/20170227485176.jpg" value="불싸이버거" data-code="4800" >불싸이버거</li>
       			<li><img src="/resources/img/burger/20170412442355.jpg" value="불갈비치킨버거" data-code="5800" >불갈비치킨버거</li>
       	</ul>
       	<ul class="sideMenuList" id="sideMenuList">
       			<li><img src="/resources/img/sideMenu/20170331173889.jpg" value="에그랩(2종)" data-code="2700">에그랩(2종)</li>
       			<li><img src="/resources/img/sideMenu/20170821851383.jpg" value="콘배지샐러드" data-code="2000">콘배지샐러드</li>
       			<li><img src="/resources/img/sideMenu/20171120319875.jpg" value="배지샐러드" data-code="2200">배지샐러드</li>
       			<li><img src="/resources/img/sideMenu/20171120979582.jpg" value="라이스&치킨너겟" data-code="1800">라이스&치킨너겟</li>
       			<li><img src="/resources/img/sideMenu/20180704788027.jpg" value="어니언치즈감자" data-code="1500">어니언치즈감자</li>
       			<li><img src="/resources/img/sideMenu/20180903624821.jpg" value="치즈감자" data-code="1500">치즈감자</li>
       			<li><img src="/resources/img/sideMenu/20180903730621.jpg" value="치즈할라피뇨너겟" data-code="2000">치즈할라피뇨너겟</li>
       			<li><img src="/resources/img/sideMenu/20181026154178.jpg" value="할라피뇨너겟" data-code="2200">할라피뇨너겟</li>
       	</ul>
       		<ul class="drinkMenuList" id="drinkMenuList">
       			<li><img src="/resources/img/drink/20150223992319.jpg" value="음료1" data-code="1500">음료1</li>
       			<li><img src="/resources/img/drink/20161129735987.jpg" value="음료2" data-code="1800">음료2</li>
       			<li><img src="/resources/img/drink/20170825874361.jpg" value="음료3" data-code="2000">음료3</li>
       			<li><img src="/resources/img/drink/20180220231170.jpg" value="음료4" data-code="1600">음료4</li>
       			<li><img src="/resources/img/drink/20180220239529.jpg" value="음료5" data-code="1800">음료5</li>
       			<li><img src="/resources/img/drink/20180416547805.jpg" value="음료6" data-code="2200">음료6</li>
       			<li><img src="/resources/img/drink/20181113571936.jpg" value="음료7" data-code="1500">음료6</li>
       			<li><img src="/resources/img/drink/20181113609096.jpg" value="음료8" data-code="2500">음료6</li>
       		</ul>	
       </div>
    </div>
    <div id="reservedTimeList" >
	</div>
           <!--모달 PART-->
           
<!--            <a class="btn btn-primary" href="index.html">Back to home</a>-->
       
        <div class="tnb" style="height: 160px;">
            <div class="tnb-container">
                <div class="tnb-reset">
<!--                    <a href="#">뒤로가기</a>-->
                </div>
                <div class="tnb step1">
<!--                    <a class="btn-left">이전단계로 이동</a>-->
                    <div style="text-align: right; margin-left: 100px;">
                    <div class="info date">

							<!-- <span class="header">날짜 
                              <span id="dateInnerHTML"></span>
                             </span> -->
                             <ul class="date">
                             	<li class="header">날짜</li>
                             	<li id="dateInnerHTML" class="data"></li>
                             </ul>
                             
                             <ul class="date">
                             	<li class="header" style="position:absolute; top:30px; left:180px;">시간</li>
                             	<li id="time" class="data"></li>
                             </ul>
                           <!--   
                        	<span class="header">시간
                            <span  id="time"></span>
                          </span> -->
                     
                    </div>
                    <div class="info seat">
                  <!--   <span class="header">좌석번호
                        <span  id="seatNumber"></span>
                   </span> -->
                      <ul class="date">
                      	<li class="header" style="">좌석번호</li>
                      	<li id="seatNumber" class="data"></li>
                      </ul>

                    </div>
                      <div class="info price">
                      <!-- <span class="header">총금액
                        <span  id="priceSum"></span>
                        </span> -->
                   <ul class="date">
                      	<li class="header" style="">총금액</li>
                      	<li id="priceSum" class="data"></li>
                      </ul>

                    </div>
                        </div>
                    <div class="panel">
                        <a href="#login_form" class="btn-right" id="login_pop"  >예 매</a>
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
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery.prettyPhoto.js"></script>
    <script src="/resources/js/owl.carousel.min.js"></script>
    <script src="/resources/js/jquery.isotope.min.js"></script>
    <script src="/resources/js/main.js"></script>



	<!-- The Modal -->
<div id="myModal" class="modal">
  <!-- Modal content -->
  <div class="modal-content">
            <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">시간</span></b></span></p>
            <p style="text-align: center; line-height: 1.5;"><br /></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" data-code='11:00' value="">09:00~11:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><b><span style="color: rgb(255, 0, 0); font-size: 14pt;"><button id="time2" onClick="timeAdd();" data-code='13:00'>11:00~13:00</button></span></b></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" data-code='15:00'>13:00~15:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" data-code='17:00'>15:00~17:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" data-code='19:00'>17:00~19:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><button  id="" onClick="timeAdd();" data-code='21:00'>19:00~21:00</button></span></p>
            <p style="text-align: center; line-height: 1.5;"><br /></p>
            <p><br /></p>
        <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
            <span class="pop_bt" style="font-size: 13pt;" >
                 닫기
            </span>
        </div>
  </div>

</div>
    <!--End Modal-->



	<!-- 숨겨왔던 나의 수줍은 모달-->
	<a href="#x" class="overlay" id="login_form"></a>

	<div class="popup">
		<h2>예매 확인</h2>
		<form action="/seatReservation/ticketingSuccess" method="POST"
			id="formSubmit" name="formValue">
			<p id="pId">${sessionScope.user}님 이 내용으로 예매 하시겠습니까 ?</p>
			<ul style="list-style: none;">
				<li id="dateCheck" value=""></li>
				<li id="seatNumberModal" value=""></li>
				<li id="priceSumModal" value=""></li>
				<li id="timeModal" value=""></li>
			</ul>
				<input type="hidden" name="id" value="${sessionScope.user}">
				<input type="hidden" id="seatName2" name="seatName" value="" /> 
				<input type="hidden" id="ticketPrice2" name="ticketPrice" value="" /> 
				<input type="hidden" id="reservedDate2" name="reservedDate" value="" />
				<input type="hidden" id="finishTime" name="finishTime" value="" />
				<input type="hidden" id="reservedTime" name="reservedTime" value="" />  
			<div>
				<a href="#" id="go" value="예매" onclick="goTicketing()" />예매</a>
			</div>
			<a class="close" href="#close"></a>
		</form>
	</div>




</body>
</html>