<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 내역</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/reservedList.js"></script>
 <script src='/resources/fullcalendar-4.0.2/packages/core/main.js'></script>
<script src='/resources/fullcalendar-4.0.2/packages/daygrid/main.js'></script>
<script src='/resources/fullcalendar-4.0.2/packages/timegrid/main.js'></script>
<script src='/resources/fullcalendar-4.0.2/packages/interaction/main.js'></script>
<link href='/resources/fullcalendar-4.0.2/packages/core/main.css' rel='stylesheet'/>
<link href='/resources/fullcalendar-4.0.2/packages/daygrid/main.css' rel='stylesheet'/>

   <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="/resources/css/mainR.css">
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="/resources/css/mainIndex.css" rel="stylesheet" type="text/css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/css/sub.css"> 
<script src="/resources/js/mainR.js"></script> 
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@7.32.2/dist/sweetalert2.min.css">  -->
<!-- <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script> -->
<!-- <script src="sweetalert2.all.min.js"></script> -->
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
 <link href="/resources/css/reservedListjung.css" type="text/css" rel="stylesheet">
  <link href="/resources/css/reservedList.css" type="text/css" rel="stylesheet">
<!--  <script src="http://localhost:84/socket.io/socket.io.js"></script> -->
<style type="text/css">
</style>
       <script>
            //달력 모달 띄워줌
            $(document).on("click","#myBtn",function(){
                $('.modalwrap').css('opacity','1');
                $('.modalwrap').css('visibility','visible');
                
            });
            
            //닫아줌
               $(document).on("click",".fc td",function(){
                   $('.modalwrap').css('opacity','0');
                   $('.modalwrap').css('visibility','hidden');
                   
                
            }); 
            
        //영수증 모달
   /*           $(document).on("click",".receiptBtn",function(){
                $('.modal2').css('display','block');
                
            }); */
            $(document).on("click",".documentClose",function(){
                $('.documentPopup').css('display','none');
                
            });
            //닫아줌
               $(document).on("click",".reservedCheck",function(){
            	   $('.documentPopup').css('display','block');
                
            });
            $(document).on("click",".takeoutReservedCheck",function(){
            	$('.documentPopup').css('display','block');
            });
        </script>
</head>
<body>
<div id="container">
		<header class="header">
                    <nav class="navi navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
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
                    <div class="dropdown-menu menu-dropmenu">
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
		
	<div id="wrap-center">
	<div class="reservation_text">
                <h1>예약 내역</h1>
                <h3>주문 진행 상태를 확인하거나 지난 구매내역을 확인할 수 있습니다.</h3>
            </div>
	<!-- <div class="button-center">
	<button type="button" class="buttonin" id="storeReserved"><span>매장 예약 내역</span></button>
	<button type="button" class="buttonin" id="takeoutReserved"><span>테이크아웃 예약 내역</span></button>
	</div> -->
		 <div style="display: inline-block;">
           <div style="padding: 30px 0px 20px 0px;">
           <button type="button" class="buttonin btn_1" id="myBtn" >
            <span style="font-size:20px; font-weight: 700; top: -5px;">날짜 별 예약 내역 확인</span></button>
            </div>
            <div><button type="button" class="buttonin btn_2" style="background-color: #d1830d; float:left; margin-right: 20px; "  id="storeReserved">
            <span style="font-size:16px; font-weight: 300;">매장 예약 내역</span></button></div>
            <div style=""><button type="button" class="buttonin btn_3" style="background-color: #d1830d;" id="takeoutReserved"><span style="font-size:16px; font-weight: 300;">테이크아웃 예약 내역</span></button></div>
            </div>
            <ul style=" margin-left: 10px; width:160px; display: inline-block;"> 
                <li class=" number_txt" style="margin-left: 30px;"><span class="storeSales number_txt"></span></li>
            </ul>
         <!--    <ul class="reservedCheckList">
		</ul> -->
            <ul> 
          <!--       <li class="table_list_txt" style="margin-top:30px;">매장 예약 내역</li> -->
          <li class="reservedList-title" style="margin-top:30px;">매장 예약 내역</li>
            </ul>
            
            <table class="takeoutReserved-table2 reserved-table">
              
                    <tr>
                        <th>구 분</th>
                        <th>주문번호</th>
                        <th>주문날짜</th>
                        <th>주문금액</th>
                        <th>예약상세</th>
                 <!--        <th>예약자 명</th>
                        <th>예약자 연락처</th> -->
                        <th>상태</th>
                    </tr>
                
                 <tbody class="reservedContainer">
               
                     <c:choose>
		<c:when test="${orders.size() > 0 }">
			<c:forEach items="${orders}" var="orders">
				<c:choose> 
			<c:when test="${orders.status eq 'Ready'}">
			<tr>
				<td>매장</td>
				<td class="reservedOrderId">${orders.orderId}</td>
				<td class="regTime">${orders.regDate} ${orders.regTime} </td>
				<td>${orders.payTotal}</td>
				<td data-tooltip-text="예약내역 확인하기"><button type='button' class="reservedCheck btn btn-concrete">예약 메뉴 확인</button></td>
				<td>상품 준비 중<button type="button" class="orderReady button" id="reservedCheck" data-orderid="${orders.orderId}">조리완료</button></td>
			</tr> 
			</c:when>
			<c:otherwise>
			<tr style="background-color:gray">
				<td>매장</td>
				<td class="reservedOrderId" id="${orders.orderId}" data-check="${orders.status}">${orders.orderId}</td>
				<td class="regTime">${orders.regDate} ${orders.regTime} </td>
				<td>${orders.payTotal}</td>
				<td data-tooltip-text="예약내역 확인하기"><button type='button' id="reservedCheck" data-orderid="${orders.orderId}" class="reservedCheck btn btn-concrete">예약 메뉴 확인</button></td>
				<td>Complete</td>
			</tr>
			</c:otherwise>
			</c:choose>
			</c:forEach>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
                </tbody>
            </table>
            	<table class="takeoutReserved-table">
			<tr>
				<th>구 분</th>
				<th>주문번호</th>
				<th>주문날짜</th>
				<th>주문금액</th>
				<th>예약상세</th>
				<th>예약자 명</th>
				<th>예약자 연락처</th>
				<th>상태</th>
			</tr>
			<tbody class="takeoutReservedContainer">
			<c:choose>
		<c:when test="${takeout.size() > 0 }">
			<c:forEach items="${takeout}" var="takeout">
				<c:choose>
			<c:when test="${takeout.status eq 'Ready'}">
			<tr>
				<td>테이크아웃</td>
				<td class="reservedTakeoutId">${takeout.takeoutId}</td>
				<td>${takeout.reservedDate} ${takeout.reservedTime} </td>
				<td>${takeout.totalPrice}</td>
				<td data-tooltip-text="예약내역 확인하기"><button type='button' class="takeoutReservedCheck btn btn-concrete" data-takeoutid="${takeout.takeoutId}">예약 메뉴 확인</button></td>
				<td>${takeout.reservedName}</td>
				<td><a href="tel:${takeout.reservedPhone}">${takeout.reservedPhone}</a></td>
				<td>상품 준비 중<button type="button" class="takeoutOrderReady button" data-takeoutid="${takeout.takeoutId}">조리완료</button></td>
			</tr>
			</c:when>
			<c:otherwise>
			<tr style="background-color:gray">
				<td>테이크아웃</td>
				<td class="reservedTakeoutId" id="${takeout.takeoutId}" data-check="${takeout.status}">${takeout.takeoutId}</td>
				<td>${takeout.reservedDate} ${takeout.reservedTime} </td>
				<td>${takeout.totalPrice}</td>
				<td data-tooltip-text="예약내역 확인하기" ><button type='button' class="takeoutReservedCheck btn btn-concrete" data-takeoutid="${takeout.takeoutId}" >예약 메뉴 확인</button></td>
				<td>${takeout.reservedName}</td>
				<td><a href="tel:${takeout.reservedPhone}">${takeout.reservedPhone}</a></td>
				<td>Complete</td>
			</tr>
			</c:otherwise>
			</c:choose>
			</c:forEach>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
			</tbody>
		</table>
        </div>
        <div class="modalwrap"><div id="calendar"></div></div>
        
        <!-- 영수증 -->
	<div class="documentPopup">
		<div class="documentCenter">
		<h2>[ 주문 내역 ]</h2>
			
			<table class="menuTable">
				<thead>
					<tr>
						<th>메뉴명</th>
						<th>수 량</th>
					</tr>
				</thead>
				<tbody class="documentTable">
				</tbody>
			</table>
	
			<div class="documentBtnCenter">
				<button id="" type="button"
					 class="documentClose">닫 기</button>
			</div>
		<!-- 	<a class="close" href="#close"></a> -->
		</div>
	</div>
        
</div>
</body>
<script type="text/javascript">
	$('.b04_3d_tick').click(function(){
		/* $('#calendar').show(); */
	});
</script>
</html>