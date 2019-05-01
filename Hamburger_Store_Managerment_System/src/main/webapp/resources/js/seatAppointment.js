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
	     function dateAnimate(){
	 		$("#dateInnerHTML").animate({
	 			"color" : "black", "font-size" : "18px"
	 		},1000) .animate({"color":"white", "font-size": "16px"},1000);
	 		}
	     $(".dateAlert").hide();
		   $('#myModal').show();
		   dateAnimate();
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
	reservedTime.setAttribute("value", event.target.innerHTML);
	timeModal.innerHTML = event.target.innerHTML;
	
 	function timeAnimate(){
 		$("#time").animate({
 			"color" : "black", "font-size" : "18px"
 		},1000) .animate({"color":"white","font-size": "16px"},1000);
 	}
 	timeAnimate();
 	$(".modal").hide();
}
function goTicketing() {//예매 테이블로 값이 들어가는 부분
	var formValue = document.formValue;
	var obj = new Object();
	
	obj.id = formValue.id.value;
	obj.seatName = formValue.seatName.value;
	obj.ticketPrice = formValue.ticketPrice.value;
	obj.reservedDate = formValue.reservedDate.value;
	obj.finishTime = formValue.finishTime.value;
	obj.reservedTime = formValue.reservedTime.value;
	console.log(obj);
	$.ajax({
		url : "/seatReservation/ticketingSuccess",
		type : "POST",
		data : obj,
		dataType : "json",
		success : function(data) {
			if (data == 1) {
				location.href = "/seatReservation/ticketingSuccess2";
			}
		}
	});
}
function close_pop() {
    $('#myModal').hide();
};
function burgerListBlock(){
	$(".burgerList").css("display", "flex");
	
		if($(".chickenList").css("display") == "flex"){
			$(".chickenList").css("display", "none");	
			
		}else if($(".sideMenuList").css("display") == "flex"){
			$(".sideMenuList").css("display", "none");	
			
		}else if($(".drinkMenuList").css("display") == "flex"){
			$(".drinkMenuList").css("display", "none");	
		}
}
function sideMenuListBlock(){
	$(".sideMenuList").css("display", "flex");
	
	if($(".chickenList").css("display") == "flex"){
		$(".chickenList").css("display", "none");
		
	}else if($(".burgerList").css("display") == "flex"){
		$(".burgerList").css("display", "none");	
		
	}else if($(".drinkMenuList").css("display") == "flex"){
		$(".drinkMenuList").css("display", "none");	
		
	}
}
function chickenBlock(){
	$(".chickenList").css("display", "flex");
	
	if($(".sideMenuList").css("display") == "flex"){
		$(".sideMenuList").css("display", "none");	
		
	}else if($(".burgerList").css("display") == "flex"){
		$(".burgerList").css("display", "none");	
		
	}else if($(".drinkMenuList").css("display") == "flex"){
		$(".drinkMenuList").css("display", "none");	
		
	}
}
function drinkMenuListBlock(){
	$(".drinkMenuList").css("display", "flex");
	
	if($(".sideMenuList").css("display") == "flex"){
		$(".sideMenuList").css("display", "none");
		
	}else if($(".burgerList").css("display") == "flex"){
		$(".burgerList").css("display", "none");	
		
	}else if($(".chickenList").css("display") == "flex"){
		$(".chickenList").css("display", "none");	
	}
}


$(document).ready(function() {
	$(".dateAlert").hide();
	//총 주문 금액
	function totalPrice() {
		var total = 0;
		$('.menu-price').each(function(index) {
			var price = Number($(this).text());
			var cnt = Number($(this).parents('.order-item').find('.menuCnt').text());
			total = total + ( price * cnt );
		});
		priceSumAnimate();
		$('#priceSum').text(total);
		var li = document.createElement("li");
		.0
		var span = document.createElement("span");
		span.innerHTML = total;
		li.innerHTML = "주문금액 : ";
		$(".reservedCheck").append(li);
		li.append(span);
	}
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
	function priceSumAnimate(){
		$("#priceSum").animate({
			"color" : "black",'font-size' : "18px"
		},500) .animate({"color":"white","font-size" : "16px"},500);
	}
	$(document).on('click', '.menu-item', function() {
		if($("#dateInnerHTML").text() == ""){
			dateAlert();
		}else{
			$('#calendar').hide(); // 달력 안보이기
			priceSumAnimate();
			var uniqId = $(this).data('id');
			var menuName = $(this).attr('value');
			var menuPrice = $(this).data('code');
			var menuCnt = $(this).data('cnt');
			var menuImgUrl = $(this).attr('src');
			var cnt = $('[data-id="'+uniqId+'"]').find('.menuCnt').text();
			
			if($('[data-id="'+uniqId+'"]').length == 1){
				addMenu(uniqId, menuName, menuPrice, menuCnt, menuImgUrl);	
			}else{
				setMenuCnt($('[data-id="'+uniqId+'"]'), 1);
			}
		}
	});
	// left-box로 누른 상품 추가
	function addMenu(uniqId, menuName, menuPrice, menuCnt, menuImgUrl) {
		
		var menuHtml = '<li class="order-item" data-id="' + uniqId + '">' +
						' <button type="button" class="xButton">X</button>' +
						'	<img src="' + menuImgUrl + '" class="order-img"/>' +
						'	<span>' + menuName + '</span>' +
						'	<span class="menu-price">' + menuPrice + '</span>' +
						'	<div>' +
						'		<span>수량 : <i class="menuCnt">1</i></span>' +
						'		<button type="button" class="btnAddMenuCnt">+</button>' +
						'		<button type="button" class="btnDelMenuCnt">-</button>' +
						'	</div>' +
						'</li>';
		$('#orderListUl').append(menuHtml);
		
		totalPrice();
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
		 console.log($("#"+menuName+"").length);
		 
		 $("#"+menuName+"").text("수량 :" + cnt);
		totalPrice();
	}
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
		priceSumAnimate();
		totalPrice();
	});
	
	$("#am").hide();
	$("#pm").hide();
});
function amView(){
	$("#am").show();
	$("#pm").hide();
}
function pmView(){
	$("#pm").show();
	$("#am").hide();
}
