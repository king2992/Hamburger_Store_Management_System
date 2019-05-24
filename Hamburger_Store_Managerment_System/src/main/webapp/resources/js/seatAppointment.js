
	localStorage.clear();
	$("#menuModal").hide();
	$(".chickenList").hide();
	$(".burgerList").hide();
	$(".sideMenuList").hide();
	$(".drinkMenuList").hide();
	$("#orderListUl").hide();
	$(".documentPopup").hide();
	$(".setSelect").hide();
	$(".setList").hide()
	$(".setSideList").hide();
	$(".setDrinkList").hide();
	var cntArray = new Array(); // 주문 할 때 메뉴 수량 넘길 배열
	var menuNameArray = new Array();// 주문 할 때 메뉴 이름 넘길 배열
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
			    	 
			     $("#dateInnerHTML").text(info.dateStr); // 날짜 선택 시 하단에 선택 한 날짜 출력
			     $("#dateCheck").text(info.dateStr); // 날짜 선택 시 주문 확인창에 선택 한 날짜 출력
			     $("#formReservedDate").val(info.dateStr);
			     function dateAnimate(){ // 날짜 선택 시 하단 날짜 출력 부분 애니메이션 효과
			 		$("#dateInnerHTML").animate({
			 			"color" : "#e3e3e3", "font-size" : "18px"
			 		},1000) .animate({"color":"#333333", "font-size": "16px"},1000);
			 		}
			     
			     $(".dateAlert").hide(); 
			     
				 $('#myModal').show();
				 $("#hours").text("1시");
				 $("#minutes").text("1분"); 
				 dateAnimate();
				   
			    } ,
			    
	    select: function(info) {
	    	
	    }
			    
	  });
	  calendar.render(); // 달력 출력
  });
	 
function timeAdd(){
	$("#time").text($(event.target).text()); // 선택 한 시간이 하단에 출력 
	$("#timeModal").text($(event.target).text());// 선택 한 시간이 주문 확인 모달창에 출력

	$("#formReservedTime").val($(event.target).text());
	
 	function timeAnimate(){ // 시간 출력 되면서 애니메이션 효과
 		$("#time").animate({
 			"color" : "#e3e3e3", "font-size" : "18px"
 		},1000) .animate({"color":"#333333","font-size": "16px"},1000);
 	}
 	timeAnimate();
 	$(".modal").hide(); // 시간 모달창 닫기
}
	function close_pop() {
	    $('#myModal').hide();
	};
	

$(document).ready(function() {
	$("#containerScroll3").hide();
	
	$("#containerScroll").scroll(function(){var height = $(this).scrollTop();if(height == 0 && height < 148){$("#hours").text("1시");}else if(height == 148){$("#hours").text("2시");}else if(height == 296){$("#hours").text("3시");}else if(height == 444){$("#hours").text("4시");}else if(height == 592){$("#hours").text("5시");}else if(height == 740){$("#hours").text("6시");}else if(height == 888){$("#hours").text("7시");}else if(height == 1036){$("#hours").text("8시");}else if(height == 1184){$("#hours").text("9시");}else if(height == 1332){$("#hours").text("10시");}else if(height == 1480){$("#hours").text("11시");}else if(height == 1628){$("#hours").text("12시");}})
	$("#containerScroll2").scroll(function(){var height = $(this).scrollTop();if(height == 0 && height < 148){$("#minutes").text("1분");}else if(height == 148){$("#minutes").text("2분");}else if(height == 296){$("#minutes").text("3분");}else if(height == 444){$("#minutes").text("4분");}else if(height == 592){$("#minutes").text("5분");}else if(height == 740){$("#minutes").text("6분");}else if(height == 888){$("#minutes").text("7분");}else if(height == 1036){$("#minutes").text("8분");}else if(height == 1184){$("#minutes").text("9분");}else if(height == 1332){$("#minutes").text("10분");}else if(height == 1480){$("#minutes").text("11분");}else if(height == 1628){$("#minutes").text("12분");}else if(height == 1776){$("#minutes").text("13분");}else if(height == 1924){$("#minutes").text("14분");}else if(height == 2072){$("#minutes").text("15분");}else if(height == 2220){$("#minutes").text("16분");}else if(height == 2368){$("#minutes").text("17분");}else if(height == 2516){$("#minutes").text("18분");}else if(height == 2664){$("#minutes").text("19분");}else if(height == 2812){$("#minutes").text("20분");}else if(height == 2960){$("#minutes").text("21분");}else if(height == 3108){$("#minutes").text("22분");}else if(height == 3256){$("#minutes").text("23분");}else if(height == 3404){$("#minutes").text("24분");}else if(height == 3552){$("#minutes").text("25분");}else if(height == 3700){$("#minutes").text("26분");}else if(height == 3848){$("#minutes").text("27분");}else if(height == 3996){$("#minutes").text("28분");}else if(height == 4144){$("#minutes").text("29분");}else if(height == 4292){$("#minutes").text("30분");}else if(height == 4440){$("#minutes").text("31분");}else if(height == 4588){$("#minutes").text("32분");}else if(height == 4736){$("#minutes").text("33분");}else if(height == 4884){$("#minutes").text("34분");}else if(height == 5032){$("#minutes").text("35분");}else if(height == 5180){$("#minutes").text("36분");}else if(height == 5328){$("#minutes").text("37분");}else if(height == 5476){$("#minutes").text("38분");}else if(height == 5624){$("#minutes").text("39분");}else if(height == 5772){$("#minutes").text("40분");}else if(height == 5920){$("#minutes").text("41분");}else if(height == 6068){$("#minutes").text("42분");}else if(height == 6216){$("#minutes").text("43분");}else if(height == 6364){$("#minutes").text("44분");}else if(height == 6512){$("#minutes").text("45분");}else if(height == 6660){$("#minutes").text("46분");}else if(height == 6808){$("#minutes").text("47분");}else if(height == 6956){$("#minutes").text("48분");}else if(height == 7104){$("#minutes").text("49분");}else if(height == 7252){$("#minutes").text("50분");}else if(height == 7400){$("#minutes").text("51분");}else if(height == 7548){$("#minutes").text("52분");}else if(height == 7696){$("#minutes").text("53분");}else if(height == 7844){$("#minutes").text("54분");}else if(height == 7992){$("#minutes").text("55분");}else if(height == 8140){$("#minutes").text("56분");}else if(height == 8288){$("#minutes").text("57분");}else if(height == 8436){$("#minutes").text("58분");}else if(height == 8584){$("#minutes").text("59분");}})
	$("#containerScroll3").scroll(function(){var height = $(this).scrollTop();if(height == 0 && height < 148){$("#hours").text("13시");}else if(height == 148){$("#hours").text("14시");}else if(height == 296){$("#hours").text("15시");}else if(height == 444){$("#hours").text("16시");}else if(height == 592){$("#hours").text("17시");}else if(height == 740){$("#hours").text("18시");}else if(height == 888){$("#hours").text("19시");}else if(height == 1036){$("#hours").text("20시");}else if(height == 1184){$("#hours").text("21시");}else if(height == 1332){$("#hours").text("22시");}else if(height == 1480){$("#hours").text("23시");}else if(height == 1628){$("#hours").text("24시");}})
	$(document).on('click', '#am-btn',function(){
		$("#containerScroll3").hide();
		$("#containerScroll").show();
	})
	$(document).on('click', '#pm-btn',function(){
		$("#containerScroll3").show();
		$("#containerScroll").hide();
	})
	$(document).on('click', "#timeSelect", function(){
		var hours = $("#hours").text();
		var minutes = $("#minutes").text();
		
		$("#timeModalHours").text(hours);
		$("#timeModalMinutes").text(minutes);
		
		timeAnimate();
		$("#myModal").hide();
	})
	$(".dateAlert").hide();
	//총 주문 금액
	function totalPrice() {
		var total = 0;
		$('.menu-price').each(function(index) {
			var price = Number($(this).text());
			var cnt = Number($(this).parents('.order-item, .set-order-item').find('.menuCnt').text());
			total = total + ( price * cnt );
		});
		priceSumAnimate();
		$('#priceSum').text(total);
		$("#formMenuPrice").val(total);
	}
	function sidetotalPrice() {
		var total = 0;
		$('.menu-price').each(function(index) {
			var price = Number($(this).text());
			total = total + price ;
		});
		priceSumAnimate();
		$('#priceSum').text(total);
		$("#formMenuPrice").val(total);
	}
	function setTotalPrice() {
		var total = 0;
		$('.menu-price').each(function(index) {
			var price = Number($(this).text());
			total = total + (price + 500) ;
		});
		priceSumAnimate();
		$('#priceSum').text(total);
		$("#formMenuPrice").val(total);
	}
	//날짜를 선택 안하고 메뉴를 선택했을 시 "날짜를 선택해 주세요." 라는 애니메이션
	function dateAlert(){
			$(".dateAlert").show();
			if($("#dateInnerHTML").text() == ""){
			$(".dateAlert").animate({
				top : 52, left : 10, "color" : "blue", "opacity":"0.7", 'font-size' : "18px", "font-family":"'Hind', sans-serif"
			},1000) .animate({top:"50px",left:"10","color" : "black","font-size" : "10px", "opacity":"1.0","font-size": "16px","font-family":"'Hind', sans-serif" },dateAlert);
			}else{
				$(".dateAlert").finish();
				$(".dateAlert").hide();
			}
	}
	//주문 금액이 바뀔 때 마다 호출하는 애니메이션
	function priceSumAnimate(){
		$("#priceSum").animate({
			"color" : "#e3e3e3",'font-size' : "18px"
		},500) .animate({"color":"#333333","font-size" : "16px"},500);
	}
	// right-box에 메뉴를 선택했을 시 
	$(document).on('click', '.menu-item', function() {
		if($("#dateInnerHTML").text() == ""){
			dateAlert();
		}else{
			$('#calendar').hide(); // 달력 안보이기
			$("#orderListUl").show();
			priceSumAnimate();
			var uniqId = $(this).data('id');
			var menuName = $(this).attr('value');
			var menuPrice = $(this).data('code');
			var menuCnt = $(this).data('cnt');
			var menuImgUrl = $(this).attr('src');
			var cnt = $('[data-id="'+uniqId+'"]').find('.menuCnt').text();
			
			if($('[data-id="'+uniqId+'"]').length == 1){
				addMenu(uniqId, menuName, menuPrice, menuCnt, menuImgUrl); // left-box에 동일반 메뉴가 없으면 메뉴를 추가	
			}else{
				setMenuCnt($('[data-id="'+uniqId+'"]'), 1, menuName); // left-box에 동일한 메뉴가 있으면 수량을 증가 
				
			}
		}
	});
	//right-box에서 SET 메뉴를 선택했을 시
	$(document).on('click','.set-item',function(){
		if($("#dateInnerHTML").text() == ""){
			dateAlert();
		}else{
			$('#calendar').hide(); // 달력 안보이기
			$("#orderListUl").show();
			var uniqId = $(this).data('id');
			var menuName = $(this).attr('value');
			var menuPrice = $(this).data('code') + 2000;
			var menuCnt = $(this).data('cnt');
			var menuImgUrl = $(this).attr('src');
			var cnt = $('[data-id="set'+uniqId+'"]').find('.menuCnt').text();
			
				setAdd(uniqId, menuName, menuPrice, menuCnt, menuImgUrl); // left-box에 동일반 메뉴가 없으면 메뉴를 추가
				$(".setList").hide();
				$(".setSideList").show();//지금은 기존에 사이드 메뉴를 띄우지만 setSide 테이블에 메뉴를 불러올것이다.
			
		}
	})
	$(document).on('click','.set-side-item',function(){
		if($("#dateInnerHTML").text() == ""){
			dateAlert();
		}else{
			var uniqId = $(this).data('id');
			var menuName = $(this).attr('value');
			var menuPrice = $(this).data('code');
			//var menuCnt = $(this).data('cnt');
			var menuImgUrl = $(this).attr('src');
			var cnt = $('[data-id="set'+uniqId+'"]').find('.menuCnt').text();
			
				setSideAdd(uniqId, menuName, menuPrice, menuImgUrl); // left-box에 동일반 메뉴가 없으면 메뉴를 추가
				$(".setSideList").hide();
				$(".setDrinkList").show();
			
		}
	})
	$(document).on('click','.set-drink-item',function(){
		if($("#dateInnerHTML").text() == ""){
			dateAlert();
		}else{
			var uniqId = $(this).data('id');
			var menuName = $(this).attr('value');
			var menuPrice = $(this).data('code');
			//var menuCnt = $(this).data('cnt');
			var menuImgUrl = $(this).attr('src');
			var cnt = $('[data-id="set'+uniqId+'"]').find('.menuCnt').text();
			
				setDrinkAdd(uniqId, menuName, menuPrice, menuImgUrl); // left-box에 동일반 메뉴가 없으면 메뉴를 추가
				$(".setSideList").hide();
				$(".setDrinkList").hide();
				$(".setSelect").show();
				
		}
	})
	// left-box로 누른 상품 추가
	function addMenu(uniqId, menuName, menuPrice, menuCnt, menuImgUrl) {
		
		var menuHtml =  '<tr class="order-item" data-id="' + uniqId + '">' +
						'<td><img src="' + menuImgUrl + '" class="order-img"/>' +
						'<span class="orderMenuName">' + menuName + '</span>' + 
						'</td>' +
						'<td style="line-height:130px;">' +
						'	<span class="menu-price">' + menuPrice + '</span>' +
						'</td>' +
						'<td style="padding-top:62px;">' +
						'<span style="display:block;">수량 : <i class="menuCnt">1</i></span>' +
						'<button type="button" class="btnAddMenuCnt btncnt">+</button>' +
						'<button type="button" class="btnDelMenuCnt btncnt">-</button>' +
						'</td>' +
						'<td style="padding-top:62px;"><button type="button" class="menuDel btn-3d red" data-menuname='+menuName+'>삭제</button></td>'+ 
						'</tr>';
						
		$('#orderListUl').append(menuHtml);// 좌측에 선택한 메뉴 추가 
		
		totalPrice(); // 상품이 추가 될 때 주문 총 금액 변경 하는 함수 호출
		
		var documentOrder =  '<tr id="order' + uniqId + '" class="receipt">' +
							 '<td>' +
							 '<span id="documentMenuName">' + menuName + '</span>' + 
							 '</td>' +
							 '<td>' +
							 '<span id="'+menuName+'">1</span>' +
							 '</td>' +
							 '<td>' +
							 '	<span id="documentPrice">' + menuPrice + '</span>' +
							 '</td>' +
							 '</tr>';	
	
		$('.documentTable').append(documentOrder);		
		
	}
function setAdd(uniqId, menuName, menuPrice, menuCnt, menuImgUrl) {
		
		var menuHtml =  '<tr class="set-order-item" data-id="' + uniqId + '">' +
						'<td class="tdMenuName"><img src="' + menuImgUrl + '" class="order-img"/>' +
						'<span class="orderMenuName">' + menuName + '</span>' + 
						'</td>' +
						'<td class="tdMenuPrice" style="line-height:130px;">' +
						'	<span class="menu-price">' + menuPrice + '</span>' +
						'</td>' +
						'<td style="padding-top:62px;">' +
						'<span style="display:block;">수량 : <i class="menuCnt">1</i></span>' +
						'</td>' +
						'<td style="padding-top:62px;"><button type="button" class="largeButton btn-3d red">라지</button></td>' +
						'</tr>';
						
		$('#orderListUl').append(menuHtml);// 좌측에 선택한 메뉴 추가 
		
		totalPrice(); // 상품이 추가 될 때 주문 총 금액 변경 하는 함수 호출
		
		var documentOrder =  '<tr id="order' + uniqId + '" class="receipt">' +
							 '<td>' +
							 '<span id="documentMenuName">' + menuName + '</span>' + 
							 '</td>' +
							 '<td>' +
							 '<span id="'+menuName+'">1</span>' +
							 '</td>' +
							 '<td>' +
							 '	<span id="documentPrice">' + menuPrice + '</span>' +
							 '</td>' +
							 '</tr>';	
	
		$('.documentTable').append(documentOrder);
		
		localStorage.setItem("셋트", "셋트");
	}	
function setSideAdd(uniqId, menuName, menuPrice, menuImgUrl) {
		
		var menuHtml =  '<tr class="set-order-item" data-id="' + uniqId + '">' +
						'<td><img src="' + menuImgUrl + '" class="order-img"/>' +
						'<span class="orderMenuName">' + menuName + '</span>' + 
						'</td>' +
						'<td style="line-height:130px;">' +
						'	<span class="menu-price">' + menuPrice + '</span>' +
						'</td>' +
						'<td style="padding-top:62px;">' +
						'<span style="display:none;">수량 : <i class="menuCnt">1</i></span>' +
						'</td>' +
						'</tr>';
		
		$('#orderListUl').append(menuHtml);// 좌측에 선택한 메뉴 추가 
		
		sidetotalPrice(); // 상품이 추가 될 때 주문 총 금액 변경 하는 함수 호출
		
		var documentOrder =  '<tr id="order' + uniqId + '" class="receipt">'+
							 '<td>' +
							 '<span id="documentMenuName">' + menuName + '</span>' + 
							 '</td>' +
							 '<td>' +
							 '<span id="'+menuName+'"></span>' +
							 '</td>' +
							 '<td>' +
							 '	<span id="documentPrice">' + menuPrice + '</span>' +
							 '</td>' +
							 '<td style="padding-top:62px;">' +
								'<span style="display:none;">수량 : <i class="menuCnt">1</i></span>' +
								'</td>' +
							 '</tr>';	
	
		$('.documentTable').append(documentOrder);	
	}
function setDrinkAdd(uniqId, menuName, menuPrice,  menuImgUrl) {
	
	var menuHtml =  '<tr class="set-order-item" data-id="' + uniqId + '">' +
					'<td><img src="' + menuImgUrl + '" class="order-img"/>' +
					'<span class="orderMenuName">' + menuName + '</span>' + 
					'</td>' +
					'<td style="line-height:130px;">' +
					'	<span class="menu-price">' + menuPrice + '</span>' +
					'</td>' +
					'<td style="padding-top:62px;">' +
					'<span style="display:none;">수량 : <i class="menuCnt">1</i></span>' +
					'</td>' +
					'</tr>';
					
	$('#orderListUl').append(menuHtml);// 좌측에 선택한 메뉴 추가 
	
	sidetotalPrice(); // 상품이 추가 될 때 주문 총 금액 변경 하는 함수 호출
	
	var documentOrder =  '<tr id="order' + uniqId + '" class="receipt">' +
						 '<td>' +
						 '<span id="documentMenuName">' + menuName + '</span>' + 
						 '</td>' +
						 '<td>' +
						 '<span id="'+menuName+'"></span>' +
						 '</td>' +
						 '<td>' +
						 '	<span id="documentPrice">' + menuPrice + '</span>' +
						 '</td>' +
						 '<td style="padding-top:62px;">' +
							'<span style="display:none;">수량 : <i class="menuCnt">1</i></span>' +
							'</td>' +
						 '</tr>';	

	$('.documentTable').append(documentOrder);
	localStorage.removeItem("셋트");
}
	function setMenuCnt($item, num, menuName) {
		var $itemCnt = $item.find('.menuCnt');
		var totCnt = Number($itemCnt.text());
				
		var cnt = totCnt + num;
		if(cnt > 0) {	
			$itemCnt.text(cnt);
		}
		var li = document.createElement("li");
		 li.setAttribute("id", menuName);
		 
		 $("#"+menuName+"").text("수량 :" + cnt);
		 $("#order"+menuName+"").text(cnt);
		 
		 totalPrice();
	}
	$(document).on('click', '#orderReset', function(){
		$(".order-item").each(function(){
			$(this).remove();
		})
		$(".set-order-item").each(function(){
			$(this).remove();
		})
		$(".receipt").each(function(){
			$(this).remove();
		})
		
		$("#priceSum").text("");
		
	});
	$(document).on('click', '.largeButton', function(){
		var item = $(this).parent().siblings(".tdMenuName");
		var itemPrice = $(this).parent().siblings(".tdMenuPrice").children(".menu-price").text();
		
		var span = document.createElement("span");
		span.innerHTML = "라지";
		span.setAttribute("class", "largeSpan");
		item.append(span);
		
		var largePrice = Number(itemPrice) + 500;
		$(this).parent().siblings(".tdMenuPrice").children(".menu-price").text(largePrice);
		$(event.target).attr("class", "normalButton btn-3d red");
		$(event.target).text("기본");
		totalPrice();
	})
	$(document).on('click', '.normalButton', function(){
		var item = $(this).parent().siblings(".tdMenuName");
		var itemPrice = $(this).parent().siblings(".tdMenuPrice").children(".menu-price").text();
		var largeSpan = $(this).parent().siblings(".tdMenuName").children(".largeSpan");
		
		largeSpan.remove();
		
		var largePrice = Number(itemPrice) - 500;
		$(this).parent().siblings(".tdMenuPrice").children(".menu-price").text(largePrice);
		$(event.target).attr("class", "largeButton btn-3d red");
		$(event.target).text("라지");
		totalPrice();
	})
	//수량 1 증가
	$(document).on('click', '.btnAddMenuCnt', function(e) {
		e.preventDefault();
		setMenuCnt($(this).parents('.order-item'), 1,$(this).parents('.order-item').data("id"));
	});
	//수량 1 감소
	$(document).on('click', '.btnDelMenuCnt', function(e) {
		e.preventDefault();
		setMenuCnt($(this).parents('.order-item'), -1,$(this).parents('.order-item').data("id"));
	});
	//추가 된 상품 삭제
	$(document).on('click', '.xButton', function(e){
		$(this).parents('.order-item').remove();
		var menuName = $(this).data("menuname");
		var orderMenuName = $("#orderset"+menuName+"");
		console.log(orderMenuName);
		orderMenuName.remove();
		priceSumAnimate();
		totalPrice();
		if($(".order-item").length == 0){
			$(".setSelect").show();$(".setDrinkList").hide();$(".setSideList").hide();$(".setList").hide();$(".chickenList").hide();$(".burgerList").hide();$(".sideMenuList").hide();$(".drinkMenuList").hide();
		}
	});
//	$(document).on('click', '.setMenuDel', function(e){
//		$(this).parents('.order-item').remove(); 
//		var menuName = $(this).data("menuname");
//		var orderMenuName = $("#orderset"+menuName+"");
//		
//		var side = localStorage.getItem("사이드");
//		var drink = localStorage.getItem("드링크");
//		var orderSideName = $("#order"+side+"");
//		var orderDrinkName = $("#order"+drink+"");
//		
//		$(".set-order-item").each(function(){
//			$(this).data("id", side).remove();
//			$(this).data("id", drink).remove();
//		})
//		
//		orderMenuName.remove();
//		orderSideName.remove();
//		orderDrinkName.remove();
//		priceSumAnimate();
//		totalPrice();
//		localStorage.clear();
//		if($(".order-item").length == 0){
//			$(".setSelect").show();$(".setDrinkList").hide();$(".setSideList").hide();$(".setList").hide();$(".chickenList").hide();$(".burgerList").hide();$(".sideMenuList").hide();$(".drinkMenuList").hide();
//		}
//	});
	$(document).on('click', '.menuDel', function(e){
		$(this).parents('.order-item').remove();
		var menuName = $(this).data("menuname");
		var orderMenuName = $("#order"+menuName+"");
		console.log(orderMenuName);
		orderMenuName.remove();
		priceSumAnimate();
		totalPrice();
		if($(".order-item").length == 0){
			$(".setSelect").show();$(".setDrinkList").hide();$(".setSideList").hide();$(".setList").hide();$(".chickenList").hide();$(".burgerList").hide();$(".sideMenuList").hide();$(".drinkMenuList").hide();
		}
	});
	$(document).on('click', '#orderModal', function(){
		
		$('.overlay').show();
		$('popup').css('display','block');
		var priceSum = $("#priceSum").text();
		$("#payment").text(priceSum);
		
		$(".orderMenuName").each(function(item,index){
			menuNameArray.push($(this).text());
		});
		$(".menuCnt").each(function(item,index){
			cntArray.push($(this).text());
		});
	});
		});

	$(document).on('click', '.chickenMenuLoad', function(){
		if(localStorage.getItem("셋트") == "셋트"){
			alert("세트 메뉴 선택을 진행해주세요.");
			return;
		}
		
		$(".setDrinkList").hide();$(".setSideList").hide();$(".setList").hide();$(".chickenList").show();$(".burgerList").hide();$(".sideMenuList").hide();$(".drinkMenuList").hide();$(".setSelect").hide();
	});
	$(document).on('click', '.burgerMenuLoad', function(){
		if(localStorage.getItem("셋트") == "셋트"){
			alert("세트 메뉴 선택을 진행해주세요.");
			return;
		}
$(".chickenList").hide();$(".sideMenuList").hide();$(".drinkMenuList").hide();$(".setList").hide();$(".setDrinkList").hide();$(".setSideList").hide();
		
		if($(".burgerList").css("display") == "none"){
			$(".setSelect").show();	
		}else{
			$(".burgerList").hide();
			$(".setSelect").show();	
		}
	});
	$(document).on("click", '.setButton', function(){
		$(".setList").show();$(".setSelect").hide();
	});
	$(document).on("click", '.singleButton', function(){
		$(".burgerList").show();$(".setSelect").hide();
	});
	
	$(document).on('click', '.sideMenuLoad', function(){
		if(localStorage.getItem("셋트") == "셋트"){
			alert("세트 메뉴 선택을 진행해주세요.");
			return;
		}
		$(".setDrinkList").hide();$(".setSideList").hide();$(".setList").hide();$(".chickenList").hide();$(".burgerList").hide();$(".sideMenuList").show();$(".drinkMenuList").hide();$(".setSelect").hide();
		
	});
	$(document).on('click', '.drinkMenuLoad', function(){
		if(localStorage.getItem("셋트") == "셋트"){
			alert("세트 메뉴 선택을 진행해주세요.");
			return;
		}
		$(".setDrinkList").hide();$(".setSideList").hide();$(".setList").hide();$(".chickenList").hide();$(".burgerList").hide();$(".sideMenuList").hide();$(".drinkMenuList").show();$(".setSelect").hide();
	});

	function timeAnimate(){ // 시간 출력 되면서 애니메이션 효과
 		$("#hours").animate({
 			"color" : "white", "font-size" : "18px"
 		},1000) .animate({"color":"black","font-size": "16px"},1000);
 		$("#minutes").animate({
 			"color" : "white", "font-size" : "18px"
 		},1000) .animate({"color":"black","font-size": "16px"},1000);
 	}
	$(document).on('click', '.timeModalClose', function(){
		$(".modal").hide();
	});
	
	function amView(){
		$("#am").show();
		$("#pm").hide();
	}
	function pmView(){
		$("#pm").show();
		$("#am").hide();
	}
	
	function takeOutReservedGo() { //예매 테이블로 값이 들어가는 부분
		var formValue = document.formValue;
		
		var userId = formValue.userId.value;
		var reservedName = formValue.reservedName.value;
		var reservedPhone = formValue.reservedPhone.value;
		var reservedDate = formValue.formReservedDate.value;
		//var reservedTime = formValue.formReservedTime.value;
		var reservedTime = $("#timeModalHours").text() + $("#timeModalMinutes").text();
		var totalPrice = Number(formValue.formMenuPrice.value);
		var frcName = formValue.frcName.value;
		$.ajax({
			url : "/takeOutReservation/takeOutReservedListInsert",
			type : "GET",
			data : {"userId":userId, "reservedName":reservedName,"reservedPhone":reservedPhone,
				"reservedDate":reservedDate,"reservedTime":reservedTime,"totalPrice":totalPrice, "frcName" : frcName},
			dataType : "JSON",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
			success : function(data) {
				if (data == 1) {
					takeOutReservedMenuInsert();
					let timerInterval
					Swal.fire({
					  title: '주문 결제 중 입니다~',
					  html: '잠시만  기다려주세요~ <strong></strong>',
					  timer: 2000,
					  onBeforeOpen: () => {
					    Swal.showLoading()
					    timerInterval = setInterval(() => {
					      Swal.getContent().querySelector('strong')
					        .textContent = Swal.getTimerLeft()
					    }, 100)
					  },
					  onClose: () => {
					    clearInterval(timerInterval)
					    swal();
					  }
					}).then((result) => {
					  if (
					    result.dismiss === Swal.DismissReason.timer
					  ) {
					    console.log('주문 결제가 완료 되었습니다.')
					  }
					});
				// swal() 생성	
					function swal() {
					Swal.fire({
						
						  position: 'center',
						  type: 'success',
						  title: '주문 결제가 완료 되었습니다!<br>감사합니다!',
						  showConfirmButton: false,
						  timer: 1000
						});
					reservedSuccess();
					}
				}
			}
		});
		
	}
	function takeOutReservedMenuInsert(){
		$.ajax({
			url : "/takeOutReservation/takeOutReservedMenuInsert",
			type : "GET",
			data : {"cntArray" : cntArray, "menuNameArray" : menuNameArray},
			dataType : "JSON",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data){
			}
			
		});
	}
	function menuModal(){
		$("#menuModal").show();
	}
	function menuModalClose(){
		$("#menuModal").hide();
	}
	
	
	