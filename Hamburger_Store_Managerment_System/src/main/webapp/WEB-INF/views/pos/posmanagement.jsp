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
<link rel="stylesheet" href="/resources/css/mainR.css">
<link rel="stylesheet" href="/resources/css/sub.css"> 
<script src="/resources/js/mainR.js"></script> 
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> -->
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@7.32.2/dist/sweetalert2.min.css"> 
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>   
<style>
/*     .active {
    background-color: #EC5538 ;
    color: #fff;
} */
.selected {
	background-color: black;
}
#pMenuClick{
	display:none;
}

</style>
<script type="text/javascript">
	$(document).ready( function() { 
		//var sum = 1;
		$(document).on( "click", ".pNameClick", function() {
			var td1 = document.createElement("td");
			var td2 = document.createElement("td");
			var td3 = document.createElement("td");
			var td4 = document.createElement("td");
			var tr1 = document.createElement("tr");
			var menuName = $(this).attr("value");
			tr1.setAttribute("class", "menuListTr");
			tr1.style = "cursor:pointer";
			td1.innerHTML = $(this).attr("data-number");
			td2.innerHTML = $(this).attr("value");
			td2.setAttribute("name",menuName);
			td2.setAttribute("data-menuName", $(this).attr("value"));
			td3.setAttribute("id", menuName);
			td3.innerHTML = $(this).attr("data-cnt");
			td3.setAttribute("class", "menuListCnt");
			td4.innerHTML = $(this).attr("data-price");
			td4.setAttribute("class", "item-price");
			td4.setAttribute("data-price",$(this).attr("data-price"));
			
				if($("[name='"+menuName+"']").length == 0 ){
					$("#orderList").append(tr1);
					tr1.append(td1);
					tr1.append(td2);
					tr1.append(td3);
					tr1.append(td4);
				}else{
					var sum = 1;
					sumCount(menuName);
					sumPrice(menuName);
				}
				
				
			var pNumber = $(this).attr('data-number');
						
			if ($(".menuDelete").length < 1) {
				$('.deleteUpdate').append('<li class="menuDelete" id="menuDelete" >메뉴삭제</li>');
			}
			$("#menuDelete").attr("onclick", "pDelete('"+pNumber+"')");
			 menuItemPriceTotal();
		});

	$('.pNameClick').each( function(index, value) {
			$(this).click( function() {
				$(this).attr("id", "selected");
				$(this).siblings().attr("id", "none");
					});
		});
	
	function sumCount(menuName){
		var sum = Number($("[name='"+menuName+"']").siblings(".menuListCnt").text());
		sum = sum + 1;
		$("[name='"+menuName+"']").siblings(".menuListCnt").text(sum);
	}	
	function sumPrice(menuName){
		var cnt = document.getElementById(menuName).innerHTML;
		var price = $("[name='"+menuName+"']").siblings(".item-price").data("price");
		var priceSum = Number(cnt) * Number(price);
		$("[name='"+menuName+"']").siblings(".item-price").text(priceSum);
	}
	function allRemove(){
		$('#orderList').remove();
		}
	
	});
	function menuCntUp(){
		var price = $("#menuListSelected").find(".item-price").text();
		var tot = $("#menuListSelected").find(".menuListCnt").text();
		var cnt = Number(tot) + 1;
		$("#menuListSelected").find(".menuListCnt").text(cnt);
		menuItemTotal(cnt);
		 menuItemPriceTotal()
	}
	function menuCntDown(){
		var price = $("#menuListSelected").find(".item-price").text();
		var tot = $("#menuListSelected").find(".menuListCnt").text();
		var cnt = Number(tot) - 1;
		if($("#menuListSelected").find(".menuListCnt").text() > 1){
			$("#menuListSelected").find(".menuListCnt").text(cnt);	
		}
		menuItemTotal(cnt);
		 menuItemPriceTotal()
	}
	function menuItemTotal(cnt){
		var itemPrice = $("#menuListSelected").find(".item-price").attr("data-price");
		var total = itemPrice * cnt;
		$("#menuListSelected").find(".item-price").text(total);
		if($("#menuListSelected").find(".item-price").text() == 0 ){
			$("#menuListSelected").find(".item-price").text(itemPrice);		
		}
	}
	
	
	
	function menuItemPriceTotal(){
		var total = 0;
		var tot = 0;
 		$(".item-price").each(function(index){
 			total += Number($(this).text());
			//total = Number(total) + Number($(this).text());
		});
 		pTotal(total);
	}
	function pTotal(total){
		$(".pTotal").text(total);
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
			event.target.parentNode.setAttribute("style", "background-color:");
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
		menuItemPriceTotal();
	}
	function menuRemove(){
		$("#menuListSelected").remove();
		menuItemPriceTotal();
	}
	
	
		$('.pNameClick').each(function(index,item){
			$('.chickenMenu').on("click",function(){
				
				var chicken = $(this).data("menu","chicken");
				var burger = $(this).data("menu","burger");
				var side = $(this).data("menu","side");
				var drink = $(this).data("menu","drink");	
				alert(chicken);
				
			})
				
				
			
		});
		

	
	/* function chicken(){
		$.ajax({
			url : '/pos/menu',
			type:'post',
			data : {
				"pMenu" : pMenu
			},
			succsss : function(data){
				console.log(data);
				alert('0');
			}
		});
		$(".chickenMenu").attr("onclick", "pDelete('"+pNumber+"')");
		 menuItemPriceTotal();
	});
	} */
</script>
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
		<%-- <header id="header">
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
		</header> --%>
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
									<th colspan="2">총 금액  <span class="pTotal"
										></span></th>
								</tr>
							</thead>
							<!-- <tbody>
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
							</tbody> -->
						</table>
					</div>
					<div class="crud-width">
						<ul class="crud">
							<li onclick="menuRemove()"><a href="#">지정취소</a></li>
							<li onclick="allRemove()"><a href="#">전체취소</a></li>
							<!-- <li>수정입력</li> -->
							<li onclick="menuCntUp()" style="cursor:pointer;">+</li>
							<li onclick="menuCntDown()" style="cursor:pointer;">-</li>
						</ul>
					</div>

				</section>
				<section class="right-section">
					<table class="right-table">
						<tr>
							<th class="chickenMenu">치킨 메뉴</th>
							<th class="burgerMenu">버거 메뉴</th>
							<th class="sideMenu" >사이드 메뉴</th>
							<th class="drinkMenu" >음료류</th>
						</tr>
					</table>
<ul class="ul">
	<c:choose>
		<c:when test="${list.size() > 0}">
			<c:forEach var="item" items="${list}">
				<input type="hidden" class="hiddenNumber" value="${item.pNumber}" style="display: none; cursor:pointer;">
		<%-- 		<input type="hidden" class="pMenu" value="${item.pMenu}"> --%>
				<li style="cursor:pointer;" class="pNameClick" value="${item.pName}" data-price="${item.pPrice}" data-number="${item.pNumber}"
					data-cnt="1" data-menu="${item.pMenu}"><p class="pName" name="${item.pMenu}">${item.pName}</p>
						<p class="pPrice">${item.pPrice}</p>
						<p id="pMenuClick">${item.pMenu}
						</li>
				
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
							<li class="triggercash" onclick="triggercash()">현금결제</li>
							<li><a href="#" id="trigger">메뉴등록</a></li>
							<!-- <li><a href="#">메뉴삭제</a></li>  -->
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
	<!-- 현금결제 레이어 -->
	<div class="modalcash"> 
    <div class="modal-contentcash"> 
        <span class="close-buttoncash">&times;</span> 
        <h1 class="titlecash">현금결제</h1> 
        <form action="/pos/orders" class="formcash" id="frm"method="POST">
        	
          <label for="total" class="labelcash" >총 금액</label> 
          <input type="text" name="payTotal2"  value=""  class="inputcash" readonly="readonly"> 
          <label class="labelcash">받은 금액 입력란</label> 
          <input type="text" name="payTotal" placeholder="받은 금액" class="inputcash" required="required"> 
          <input type="button" id="cancelcash" value="취소"> 
          <input type="button" id="submitcash" onclick ="send()" value="보내기"> 
        </form> 
    </div> 
</div>
	
	

	<script type="text/javascript">
		var modal = document.querySelector(".modal");
		var trigger = document.querySelector("#trigger");
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
	
	
	
	<script type="text/javascript"> 
    var modalcash = document.querySelector(".modalcash"); 
    var triggercash = document.querySelector(".triggercash"); 
    var closeButtoncash = document.querySelector(".close-buttoncash"); 
    var cancelButtoncash = document.querySelector("#cancelcash");

   //console.log(modal);

   function toggleModalcash() { 
        modalcash.classList.toggle("show-modalcash"); 
        $('input[name=payTotal2]').val($('.pTotal').text());
    }

   function windowOnClickcash(event) { 
        if (event.target === modalcash) { 
            toggleModalcash(); 
        } 
    }
	 function send(){
	   var payTotal = $('input[name=payTotal2]').val();
	   var input = $('input[name=payTotal]').val();
	  
	   
	   
	   if( payTotal == input ){
	  /*   	document.getElementById('submitcash').onclick=function(){ */
	    		   alert('결제완료');
	    		   $('#fpNumber').val('3');
	   	    	document.getElementById('frm').submit();
	   	    	return false;
	   	   /*  location.reload(); */
	   	 /*    return true; */
	   	   /*  	$('.modalcash').hide(); */
	   	    
	  /*   	} */
		   
	   }
	   if(payTotal != input){
		   alert('일치하지 않습니다. 다시 확인해주십시오.');
		   return true;
		   
	   }
   }

   triggercash.addEventListener("click", toggleModalcash); 
    closeButtoncash.addEventListener("click", toggleModalcash); 
    cancelButtoncash.addEventListener("click", toggleModalcash); 
    window.addEventListener("click", windowOnClickcash); 
    
   
    
</script>
</body>
</html>