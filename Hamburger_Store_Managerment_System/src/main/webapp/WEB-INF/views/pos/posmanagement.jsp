<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포스기(관리자)</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="/resources/css/pos.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
	$(window).load(function() {

		$('.portfolio-filter>th>a').on('click', function() {
			$('.portfolio-filter>th>a').removeClass('active');
			$(this).addClass('active');
			/*     var selector = $(this).attr('data-filter'); */
			/*   $portfolio.isotope({
			      filter: selector
			  }); */
			return false;
		});
	});
</script>
<style>
/*     .active {
    background-color: #EC5538 ;
    color: #fff;
} */
.selected {
	background-color: black;
}
</style>
<script type="text/javascript">
	$(document).ready( function() { 
		
		$(document).on( "click", ".pNameClick", function() {
			var td1 = document.createElement("td");
			var td2 = document.createElement("td");
			var td3 = document.createElement("td");
			var td4 = document.createElement("td");
			var tr1 = document.createElement("tr");
			tr1.setAttribute("class", "menuListTr");
			tr1.style = "cursor:pointer";
			td1.innerHTML = $(this).attr("data-number");
			td2.innerHTML = $(this).attr("value");
			td3.innerHTML = $(this).attr("data-cnt");
			td3.setAttribute("class", "menuListCnt");
			td4.innerHTML = $(this).attr("data-price");
			td4.setAttribute("class", "item-price");
			td4.setAttribute("data-price",$(this).attr("data-price"));
			$("#orderList").append(tr1);
			tr1.append(td1);
			tr1.append(td2);
			tr1.append(td3);
			tr1.append(td4);
			
			var pNumber = $(this).attr('data-number');
			console.log(pNumber);
			
			if ($(".menuDelete").length < 1) {
				$('.deleteUpdate').append('<li class="menuDelete" id="menuDelete" >메뉴삭제</li>');
			}
			$("#menuDelete").attr("onclick", "pDelete('"+pNumber+"')");
			menuItemPriceTotal($(this).attr("data-price"));
		});

	$('.pNameClick').each( function(index, value) {
			$(this).click( function() {
				$(this).attr("id", "selected");
				$(this).siblings().attr("id", "none");
					});
		});
				
	function allRemove(){
		$('#orderList').remove();
		}
	
	});
	function menuCntUp(){
		var pric = $("#menuListSelected").find(".item-price").text();
		var tot = $("#menuListSelected").find(".menuListCnt").text();
		var cnt = Number(tot) + 1;
		$("#menuListSelected").find(".menuListCnt").text(cnt);
		menuItemTotal(cnt);
		menuItemPriceTotal(pric);
	}
	function menuCntDown(){
		var pric = $("#menuListSelected").find(".item-price").text();
		var tot = $("#menuListSelected").find(".menuListCnt").text();
		var cnt = Number(tot) - 1;
		if($("#menuListSelected").find(".menuListCnt").text() > 1){
			$("#menuListSelected").find(".menuListCnt").text(cnt);	
		}
		menuItemTotal(cnt);
		menuItemPriceTotal(pric);
	}
	function menuItemTotal(cnt){
		var itemPrice = $("#menuListSelected").find(".item-price").attr("data-price");
		var total = itemPrice * cnt;
		$("#menuListSelected").find(".item-price").text(total);
		if($("#menuListSelected").find(".item-price").text() == 0 ){
			$("#menuListSelected").find(".item-price").text(itemPrice);		
		}
	}
	var total = 0;
	function menuItemPriceTotal(price){
		
// 		$(".item-price").each(function(index){
			total = Number(total) + Number(price);
// 		});
		console.log(total);
	}
	$(document).on( "click", ".menuListTr", function() {
		
		$('.menuListTr').each( function(index) { 
			$(this).click( function() {
				$(this).css("background-color", "#FBF2EF");
				$(this).attr("id", "menuListSelected");
				
				$(this).siblings().attr("id", "none");
			})
		})
	});
	$(document).on( "mouseenter", ".menuListTr", function() {
		event.target.parentNode.setAttribute("style", "background-color:#FBF5EF");
	});
	$(document).on( "mouseleave", ".menuListTr", function() {
		if(event.target.parentNode.getAttribute("id") != "menuListSelected" ){
			event.target.parentNode.setAttribute("style", "background-color:white");
		}
	});
	function pDelete(pNumber) {
		$.ajax({
			url : '/pos/delete',
			type : "post",
			data : {
				"pNumber" : pNumber
			},
			success : function(data) {
				location.reload();
		}
		});
	}
	function allRemove(){
		$(".orderList").empty();
	}
	function menuRemove(){
		$("#menuListSelected").remove();
	}
	
	
</script>
</head>
<body>
	<div id="container">
		<header id="header">
			<div id="wrap-center">
				<nav class="navi">
					<ul>
						<li>POPS</li>
						<li>작업일시 :<jsp:useBean id="toDay" class="java.util.Date" />
							<fmt:formatDate value='${toDay}' pattern='yyyyMMdd' var="nowDate" /></li>
						<li>사용자 : 관리자</li>
						<li>닫기</li>
					</ul>
				</nav>
			</div>
		</header>
		<div class="margin">
			<div style="width: 100%; height: 100%;">
				<section class="left-section">
					<div class="take">
						<p>Take Out</p>
					</div>
					<div class="top-table">
						<table>
							<thead>
								<tr>
									<th>상품번호</th>
									<th>상품명</th>
									<th>상품수량</th>
									<th>가격</th>
								</tr>
							</thead>
							<tbody class="orderList" id="orderList">
								<%-- 		<c:choose>
									<c:when test="${list.size() > 0}">
										<c:forEach var="item" items="${list}">
											<tr>
												<td>${item.pNumber}</td>
												<td>${item.pName}</td>
												<td>${item.pAccount}</td> 
												<td>${item.pPrice}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<td></td>
									</c:otherwise>
								</c:choose> --%>
								<!-- <tr class="tr-none"> -->
								<!-- 									<td id="pPrice"></td> -->
								<!-- 									<td></td> -->
								<!-- 									<td></td> -->
								<!-- 									<td></td> -->
								<!-- </tr> -->
							</tbody>
						</table>
					</div>
					<div class="total">
						<table>
							<thead>
								<tr>
									<th colspan="2">총 금액 :<span claas="pTotal"
										data-total="${item.pTotal}">${item.pTotal}</span></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>주문금액</td>
									<td>0</td>
								</tr>
								<tr>
									<td>서비스</td>
									<td>0</td>
								</tr>
								<tr>
									<td>할인금액</td>
									<td>0</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="crud-width">
						<ul class="crud">
							<li onclick="menuRemove()"><a href="#">지정취소</a></li>
							<li onclick="allRemove()"><a href="#">전체취소</a></li>
							<li>수정입력</li>
							<li onclick="menuCntUp()" style="cursor:pointer;">+</li>
							<li onclick="menuCntDown()" style="cursor:pointer;">-</li>
						</ul>
					</div>

				</section>
				<section class="right-section">
					<table class="right-table">
						<tr>
							<th class="chickenMenu"><a href="#" >치킨 메뉴</a></th>
							<th class="burgerMenu"><a href="#">버거 메뉴</a></th>
							<th class="sideMenu"><a href="#" >사이드 메뉴</a></th>
							<th class="drinkMenu"><a href="#" >음료류</a></th>
						</tr>
					</table>
<ul class="ul">
	<c:choose>
		<c:when test="${list.size() > 0}">
			<c:forEach var="item" items="${list}">
				<input type="hidden" class="hiddenNumber" value="${item.pNumber}" style="display: none; cursor:pointer;">
				<li style="cursor:pointer;" class="pNameClick" value="${item.pName}" data-price="${item.pPrice}" data-number="${item.pNumber}"
					data-cnt="1" ><p class="pName" name="${item.pMenu}">${item.pName}</p>
						<p class="pPrice">${item.pPrice}</p></li>
				
				<!-- <tr> -->
				<%-- 	<td class="pNameClick" value="${item.pName}"
				data-price="${item.pPrice}" data-number="${item.pNumber}"
				data-cnt="1"><a href="#">
					<p class="pName">${item.pName}</p>
					<p class="pPrice">${item.pPrice}</p>
			</a></td> --%>
				<!-- 	<td>불고기세트</td>
			<td>불고기세트</td>
			<td>불고기세트</td>
			<td>불고기세트</td> -->
				<!-- </tr> -->
			</c:forEach>
		</c:when>
		<c:otherwise>

		</c:otherwise>
	</c:choose>
</ul>

				</section>
				<footer>
					<div class="pay">
						<ul class="deleteUpdate">
							<li>카드결제</li>
							<li>현금결제</li>
							<li><a href="#" class="trigger">메뉴등록</a></li>
							<!-- <li><a href="#">메뉴삭제</a></li> -->
							<%-- <li><a href="update?pNumber=${item.pNumber}">메뉴수정</a></li> --%>
						</ul>
					</div>
				</footer>
			</div>
		</div>

	</div>
	<!-- 팝업 될 레이어 -->
	<div class="modal">
		<div class="modal-content">
			<span class="close-button">&times;</span>
			<h1 class="title">메뉴등록</h1>
			<form action="/pos/add" method="POST">
				<select name="pMenu">
					<option value="chicken">chicken</option>
					<option value="burger">burger</option>
					<option value="side">side</option>
					<option value="drink">drink</option>
				</select> <label for="pName">MENU</label> <input type="text" name="pName"
					placeholder="상품명을 입력해주세요." required="required"> <label></label>
				<textarea name="pPrice" placeholder="상품가격을 입력해주세요."
					required="required"></textarea>

				<input type="button" id="cancel" value="취소"> <input
					type="submit" id="submit" value="보내기">
			</form>
		</div>
	</div>

	<script type="text/javascript">
		var modal = document.querySelector(".modal");
		var trigger = document.querySelector(".trigger");
		var closeButton = document.querySelector(".close-button");
		var cancelButton = document.querySelector("#cancel");

		//console.log(modal);

		function toggleModal() {
			modal.classList.toggle("show-modal");
		}

		function windowOnClick(event) {
			if (event.target === modal) {
				toggleModal();
			}
		}

		trigger.addEventListener("click", toggleModal);
		closeButton.addEventListener("click", toggleModal);
		cancel.addEventListener("click", toggleModal);
		window.addEventListener("click", windowOnClick);
	</script>
</body>
</html>