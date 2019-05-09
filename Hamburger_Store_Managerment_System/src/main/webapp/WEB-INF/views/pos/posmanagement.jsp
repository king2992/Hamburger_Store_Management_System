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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<script src="sweetalert2.all.min.js"></script>
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
.nmg,#nmg{display:none;}
.document{
    width: 127px;
    height: 48px;
    text-align: center;
    border: none;
    margin-top: 20px;
    cursor: pointer;
    }
#submitcash{
	display:none;
 
}
[data-tooltip-text]:hover {
	position: relative;
}

[data-tooltip-text]:hover:after {
	background-color: #000000;
	background-color: rgba(0, 0, 0, 0.8);

	-webkit-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	-moz-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);

	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;

	color: #FFFFFF;
	font-size: 12px;
	content: attr(data-tooltip-text);

    margin-bottom: 10px;
	top: 100px;
	left: 0;    
	padding: 7px 12px;
	position: absolute;
	width: auto;
	min-width: 50px;
	max-width: 600px;
	word-wrap: break-word;

	z-index: 9999;
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
			td2.setAttribute("class","menuListName");
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
				
				
			var menuId = $(this).attr('data-number');
						
			if ($(".menuDelete").length < 1) {
				$('.deleteUpdate').append('<li class="menuDelete" id="menuDelete" >메뉴삭제</li>');
			}
			$("#menuDelete").attr("onclick", "pDelete('"+menuId+"')");
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
				$(this).css("background-color", "red");
				$(this).attr("id", "menuListSelected");
				$(this).siblings().attr("id", "none");
				
			})
		})
	});
	$(document).on( "mouseenter", ".menuListTr", function() {
		
			
			console.log($(event.target).parent().css("background-color"));
		if($(event.target).parent().css("background-color") == "rgb(255, 0, 0)"){
			event.target.parentNode.setAttribute("style", "background-color:red");
		}else if($(event.target).parent().css("background-color") != "rgb(255, 0, 0)"){
			event.target.parentNode.setAttribute("style", "background-color:blue");
		}
		
	});
	$(document).on( "mouseleave", ".menuListTr", function() {
		
		if(event.target.parentNode.getAttribute("id") != "menuListSelected" ){
			event.target.parentNode.setAttribute("style", "background-color: #FBF2EF");
		}
		
	});
	function pDelete(menuId) {
		$.ajax({
			url : '/pos/delete',
			type : "post",
			data : {
				"menuId" : menuId
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
												</table>
					</div>
					<div class="crud-width">
						<ul class="crud">
							<li onclick="menuRemove()"  ><a href="#" data-tooltip-text="상품을 선택 후 눌러주세요.">지정취소</a></li>
							<li onclick="allRemove()"  ><a href="#" data-tooltip-text="전체 상품을 취소합니다.">전체취소</a></li>
							<!-- <li>수정입력</li> -->
							<li onclick="menuCntUp()"  style="cursor:pointer;" data-tooltip-text="상품을 선택 후 눌러주세요. ">+</li>
							<li onclick="menuCntDown()"   style="cursor:pointer;" data-tooltip-text="상품을 선택 후 눌러주세요.">-</li>
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
				<input type="hidden" class="hiddenNumber" value="${item.menuId}" style="display: none; cursor:pointer;">
		
				<li style="cursor:pointer;" class="pNameClick" value="${item.menuName}" data-price="${item.menuPrice}" data-number="${item.menuId}"
					data-cnt="1" data-menu="${item.menuCategory}"><p class="pName" name="${item.menuCategory}">${item.menuName}</p>
						<p class="pPrice">${item.menuPrice}</p>
						<p id="pMenuClick">${item.menuCategory}
						</li>
				
			
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
							<li onclick="card()">카드결제</li>
							<li class="triggercash" onclick="triggercash()">현금결제</li>
							<li><a href="#" id="trigger">메뉴등록</a></li>
							
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
			<form action="/pos/add" method="POST" enctype="multipart/form-data">
				<select name="menuCategory">
					<option value="chicken">chicken</option>
					<option value="burger">burger</option>
					<option value="side">side</option>
					<option value="drink">drink</option>
				</select> <label for="menuName">MENU</label> <input type="text" name="menuName"
					placeholder="상품명을 입력해주세요." required="required"> <label></label>
				<textarea name="menuPrice" placeholder="상품가격을 입력해주세요."
					required="required"></textarea>
					<input type="file" name="file">
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
          <input type="text" name="payTotal"  value="" id="payTotal2"  class="inputcash" readonly="readonly"> 
          <label class="labelcash">받은 금액 입력란</label> 
          <input type="text" name="payTotal2" placeholder="받은 금액" id="payTotal" class="inputcash" required="required">
          <input type="button" class="document" onclick="nmg()" value="거스름돈 출력">
          <label class="labelcash nmg">거스름돈</label>
          <input type="text" id="nmg" name="nmg" readonly="readonly"> 
          <input type="button" id="cancelcash" value="취소"> 
          <input type="button" id="submitcash" onclick ="send()" value="보내기"> 
        </form> 
    </div> 
</div>
	
	<script type="text/javascript">
	$(document).on("click",".document",function nmg(){
		var payTotal = document.getElementById('payTotal').value;
		var payTotal2 = document.getElementById('payTotal2').value;
		
		document.getElementById('nmg').value = payTotal - payTotal2;
		
		if(payTotal < payTotal2){
			alert('받은 금액을 다시 확인해주십시오.');
		}
		
		if(payTotal >= payTotal2){
		
		$('#nmg').css('display','block');
		$('.nmg').css('display','block');
		$('.modal-contentcash').css('height','430px');
		$('.document').css('display','none');
		$('#submitcash').css('display','inline-block');
		}
		
		
	});
		
		
	</script>

	<script type="text/javascript">
		var modal = document.querySelector(".modal");
		var trigger = document.querySelector("#trigger");
		var closeButton = document.querySelector(".close-button");
		var cancelButton = document.querySelector("#cancel");
		var menuNameArray = new Array();
		var menuCntArray = new Array();

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
        $('input[name=payTotal]').val($('.pTotal').text());
        
        //추가 돼 있는 상품에 이름을 배열에 담는다
        $(".menuListName").each(function(index, item){
        	menuNameArray.push($(this).text());
        })
        //추가 돼 있는 상품에 갯수를 배열에 담는다
        $(".menuListCnt").each(function(index, item){
        	menuCntArray.push($(this).text());
        })
        
    }

   function windowOnClickcash(event) { 
        if (event.target === modalcash) { 
            toggleModalcash(); 
        } 
    }
	 function send(){
		
		 
	   var payTotal = $('input[name=payTotal]').val();
	   var input = $('input[name=payTotal2]').val();
	   var nmg = $('input[name=nmg]').val();
	   var sum = input - nmg;
	   
	    if( payTotal == sum){
	    	alert('결제완료'); 
	    	$.ajax({
	     		url : "/pos/orders",
	     		data : {"payTotal" : payTotal},
	     		dataType : "JSON",
	     		type : "POST",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
				success : function(data) {
					if(data == 1){
						console.log("재미없었어");
						선규();
					}
				}
	     	});
	    	 
	   	    	//document.getElementById('frm').submit();
	   	    	
				
	   	    	return false;
	   }
	     if(payTotal != sum){
		   alert('일치하지 않습니다. 다시 확인해주십시오.');
		   return true;  
	   }
	  
   }
	 function 선규(){
			$.ajax({
	     		url : "/pos/menuAdd",
	     		data : {"menuNameArray" : menuNameArray, "menuCntArray" : menuCntArray},
	     		dataType : "JSON",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
				success : function(data) {
					if(data == 1){
						window.location.reload();
					}
				}
	     	});
	 }

   triggercash.addEventListener("click", toggleModalcash); 
    closeButtoncash.addEventListener("click", toggleModalcash); 
    cancelButtoncash.addEventListener("click", toggleModalcash); 
    window.addEventListener("click", windowOnClickcash); 
    
   
    
</script>
<script>
	function card(){
		let timerInterval
		Swal.fire({
		  title: '결제중입니다.',
		  html: 'I will close in <strong></strong> seconds.',
		  timer: 2000,
		  onBeforeOpen: ()=> {
		    Swal.showLoading()
		    timerInterval = setInterval(() => {
		      Swal.getContent().querySelector('strong')
		        .textContent = Swal.getTimerLeft() 
		    }, 100)
		  },
		  onClose: ()=> {
		    clearInterval(timerInterval)
		  }
		}).then((result)=> {
		  if (
		    // Read more about handling dismissals
		    result.dismiss === Swal.DismissReason.timer
		    
		  ) {
		    console.log('I was closed by the timer')
		    card2();
		  }
		})
		function card2(){
			Swal.fire({
			  position: 'top-end',
			  type: 'success',
			  title: '결제가 완료되었습니다.',
			  showConfirmButton: false,
			  timer: 1500
			  
			});
			
					}
	}

</script>
</body>
</html>