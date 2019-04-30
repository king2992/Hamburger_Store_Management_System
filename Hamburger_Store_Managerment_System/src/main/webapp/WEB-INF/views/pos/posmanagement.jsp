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
$(window).load(function () {
    'use strict';
    var $portfolio_selectors = $('.portfolio-filter >th>a');
    var $portfolio = $('.portfolio-items');
    $portfolio.isotope({
        itemSelector: '.portfolio-item',
        layoutMode: 'fitRows'
    });

    $portfolio_selectors.on('click', function () {
        $portfolio_selectors.removeClass('active');
        $(this).addClass('active');
        var selector = $(this).attr('data-filter');
        $portfolio.isotope({
            filter: selector
        });
        return false;
    });
});
</script>
<style>
    
</style>
<script type="text/javascript">
/* var list = [
	{pno:1,
	pname:'bugger',	
	price:'12500'}
];

var cart = [
{pno:1,
	panme:,
	count:1,
	price:12500 * count},{}
] */

$(document).ready(function(){
// 	$(".pNameClick").each(function(index){
// 		console.log($(this).attr("value"));
// 	});	
	$(document).on("click", ".pNameClick", function(){
		var td1 = document.createElement("td");
		var td2 = document.createElement("td");
		var td3 = document.createElement("td");
		var td4 = document.createElement("td");
		var tr1 = document.createElement("tr");
		td1.innerHTML = $(this).attr("data-number");
		td2.innerHTML = $(this).attr("value");
		td3.innerHTML = $(this).attr("data-cnt");
		td4.innerHTML = $(this).attr("data-price");
		$("#orderList").append(tr1).append(td1).append(td2).append(td3).append(td4);
/* 		$("#orderList").append(cart);
		cart.count += 1;  */
	});
});
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
								<tr>
<!-- 									<td id="pPrice"></td> -->
<!-- 									<td></td> -->
<!-- 									<td></td> -->
<!-- 									<td></td> -->
								</tr>
							</tbody>
						</table>
					</div>
						<div class="total">
						<table>
							<thead>
								<tr>
									<th colspan="2">총 금액 :</th>
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
							<li>지정취소</li>
							<li>전체취소</li>
							<li>수정입력</li>
							<li>+</li>
							<li>-</li>
						</ul>
					</div>

				</section>
				<section class="right-section">
					<table class="right-table">
						<thead>
							<tr class="portfolio-filter">
								<th><a href="#">치킨 메뉴</a></th>
								<th><a href="#">버거 메뉴</a></th>
								<th><a href="#">사이드 메뉴</a></th>
								<th><a href="#">음료류</a></th>
							</tr>
						</thead>
						<tbody class="right-table-td">
							<c:choose>
								<c:when test="${list.size() > 0}">
									<c:forEach var="item" items="${list}">
										<tr>
											<td class="pNameClick" value="${item.pName}" data-price="${item.pPrice}" data-number="${item.pNumber}" data-cnt="1"><a href="#">
												<p class="pName">${item.pName}</p>	
												<p class="pPrice">${item.pPrice}</p>
											</a></td>
											<!-- 	<td>불고기세트</td>
								<td>불고기세트</td>
								<td>불고기세트</td>
								<td>불고기세트</td> -->
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</section>
				<footer>
					<div class="pay">
						<ul>
							<li>카드결제</li>
							<li>현금결제</li>
							<li><a href="#" class="trigger">메뉴등록</a></li>
							<li><a href="delete?pNumber=${item.pNumber}">메뉴삭제</a></li>
							<li><a href="update?pNumber=${item.pNumber}">메뉴수정</a></li>
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
                    	</select>
                      <label for="pName">MENU</label> 
                      <input type="text" name="pName" placeholder="상품명을 입력해주세요." required="required"> 
                      <label></label> 
                      <textarea name="pPrice" placeholder="상품가격을 입력해주세요." required="required"></textarea> 
                      
                      <input type="button" id="cancel" value="취소"> 
                      <input type="submit" id="submit" value="보내기"> 
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