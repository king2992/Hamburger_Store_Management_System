<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 내역</title>
<script src="http://localhost:84/socket.io/socket.io.js"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/reservedList.js"></script>
 <script src='/resources/fullcalendar-4.0.2/packages/core/main.js'></script>
<script src='/resources/fullcalendar-4.0.2/packages/daygrid/main.js'></script>
<script src='/resources/fullcalendar-4.0.2/packages/timegrid/main.js'></script>
<script src='/resources/fullcalendar-4.0.2/packages/interaction/main.js'></script>
<link href='/resources/fullcalendar-4.0.2/packages/core/main.css' rel='stylesheet'/>
<link href='/resources/fullcalendar-4.0.2/packages/daygrid/main.css' rel='stylesheet'/>
<link rel="stylesheet" href="/resources/css/mainR.css">
<link rel="stylesheet" href="/resources/css/sub.css"> 
<script src="/resources/js/mainR.js"></script> 
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@7.32.2/dist/sweetalert2.min.css"> 
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<script src="sweetalert2.all.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
 <link href="/resources/css/reservedList.css" type="text/css" rel="stylesheet">
 
</head>
<body>
<div id="container">
			<nav class="navbar navbar-expand-sm navbar-dark fixed-top1 layout-menu">
			<!-- Brand -->
			<a class="navbar-brand menu-title" href='<c:url value="/"/>'> <span
				class="menu-pre">store</span><span class="menu-last">management</span>
			</a>
			<!-- Links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href='<c:url value="/pos/posmanagement"/>'> <i class="fa fa-home menu-icon"></i>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href='<c:url value="/pos/reservedList"/>'> <i
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
		
	<div id="wrap-center">
	<div class="button-center">
	<button type="button" class="buttonin" id="storeReserved"><span>매장 예약 내역</span></button>
	<button type="button" class="buttonin" id="takeoutReserved"><span>테이크아웃 예약 내역</span></button>
	</div>
		<ul class="reservedCheckList">
		</ul>
	<div class="button_base b04_3d_tick dal">
	<div></div>
	<div>달력출력(날짜)</div>
    <div>달력출력(날짜)</div>
	</div>	
	<div class="right-box">
	<h1 class="reservedList-title">매장 예약 내역</h1>
	
	<table class="reserved-table">
			<tr>
				<th>구 분</th>
				<th>주문번호</th>
				<th>주문날짜</th>
				<th>주문금액</th>
				<th>예약상세</th>
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
			<p>예약 내역이 없습니다.</p>
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
			<p>예약 내역이 없습니다.</p>
		</c:otherwise>
	</c:choose>
			</tbody>
		</table>
	</div>
	
		
	
		
</div>
</div>

	
		<div id="calendar"></div>
		
	
</body>
<script type="text/javascript">
	$('.b04_3d_tick').click(function(){
		/* $('#calendar').show(); */
	});
</script>
</html>