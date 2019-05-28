document.addEventListener('DOMContentLoaded', function() {
	 var calendarEl = document.getElementById('calendar');
	  var calendar = new FullCalendar.Calendar(calendarEl, {
	    plugins: [ 'interaction', 'dayGrid', 'timeGrid' ], 
	    selectable: true,
	    header: {
	      right: 'prev,next today'  
	    },
		     dateClick: function(info) {
		    	 var regDate = info.dateStr;
		    	 var list = "";
		    	 var takeoutList = "";
		    	 var reservedContainer = $(".reservedContainer");
		    	 var takeoutReservedContainer = $(".takeoutReservedContainer");
		    	 var reservedCheckList = $(".reservedCheckList");
		    	 
		    	 	if($(".reservedList-title").text()== "매장 예약 내역"){
			    	 $.ajax({
			    		url : "/pos/dateSort",
			    		type : "GET",
			    		data : {"regDate":regDate},
			    		success : function(data){
			    			$.each(data, function(index, item){
			    				if(item.status == "Ready"){
				    				list += "<tr>";
				    				list += "<td>" + "매장" + "</td>";
				    				list += "<td class='reservedOrderId'>" +item.orderId+"</td>";
				    				list += "<td>" + item.regDate +" "+item.regTime + "</td>";
				    				list += "<td>" + item.payTotal + "</td>";
				    				list += "<td data-tooltip-text='예약내역 확인하기'>" +'<button type="button" class="reservedCheck btn btn-concrete">'+"예약 메뉴 확인"+"</button>" +"</td>";
				    				list += "<td>"+"상품 준비 중"+ "<button type='button' class='orderReady button'>"+"조리완료"+"</button>"+"</td>";
				    				list += "</tr>";
			    				}else {
			    					list += "<tr style='background-color:#eeeeee'>";
			    					list += "<td>" + "매장" + "</td>";
				    				list += "<td class='reservedOrderId'>" +item.orderId+"</td>";
				    				list += "<td>" + item.regDate +" "+item.regTime + "</td>";
				    				list += "<td>" + item.payTotal + "</td>";
				    				list += "<td data-tooltip-text='예약내역 확인하기'>" + '<button type="button" class="reservedCheck btn btn-concrete">'+"예약 메뉴 확인"+"</button>" +"</td>";
				    				list += "<td>" +"준비완료"+ "</td>";
				    				list += "</tr>";
			    				}
			    			})
			    			reservedContainer.html(list);
			    			reservedCheckList.html("");
			    		}
			    	 });
		    	 }
		    	 	else if($(".reservedList-title").text() == "테이크아웃 예약 내역"){
		    	 $.ajax({
		    	 		url : "/pos/takeoutDateSort",
		    	 		type : "GET",
		    	 		data : {"reservedDate":regDate},
		    	 		success : function(data){
		    	 			$.each(data, function(index, item){
		    	 				if(item.status == "Ready"){
		    	 					takeoutList += "<tr>";
		    	 					takeoutList += "<td>" + "테이크아웃" + "</td>";
		    	 					takeoutList += "<td class='reservedTakeoutId'>" +item.takeoutId+"</td>";
		    	 					takeoutList += "<td>" + item.reservedDate +" "+item.reservedTime + "</td>";
		    	 					takeoutList += "<td>" + item.totalPrice + "</td>";
		    	 					takeoutList += "<td data-tooltip-text='예약내역 확인하기'>" +'<button type="button" class="takeoutReservedCheck btn btn-concrete">'+"예약 메뉴 확인"+"</button>" +"</td>";
		    	 					takeoutList += "<td>" +item.reservedName + "</td>";
		    	 					takeoutList += "<td>" +"<a href='tel:"+item.reservedPhone+"'>"+item.reservedPhone+"</a>" + "</td>";
		    	 					takeoutList += "<td>"+"상품 준비 중"+ "<button type='button' class='orderReady button'>"+"조리완료"+"</button>"+"</td>";
		    	 					takeoutList += "</tr>";
		    	 				}else {
		    	 					takeoutList += "<tr style='background-color:#eeeeee'>";
		    	 					takeoutList += "<td>" + "테이크아웃" + "</td>";
		    	 					takeoutList += "<td class='reservedTakeoutId'>" +item.takeoutId+"</td>";
		    	 					takeoutList += "<td>" + item.reservedDate +" "+item.reservedTime + "</td>";
		    	 					takeoutList += "<td>" + item.totalPrice + "</td>";
		    	 					takeoutList += "<td data-tooltip-text='예약내역 확인하기'>" + '<button type="button" class="takeoutReservedCheck btn btn-concrete">'+"예약 메뉴 확인"+"</button>" +"</td>";
		    	 					takeoutList += "<td>" +item.reservedName + "</td>";
		    	 					takeoutList += "<td>" +"<a href='tel:"+item.reservedPhone+"'>"+item.reservedPhone+"</a>" + "</td>";
		    	 					takeoutList += "<td>" +"준비완료"+ "</td>";
		    	 					takeoutList += "</tr>";
		    	 				}
		    	 			})
		    	 			takeoutReservedContainer.html(takeoutList);
		    	 			reservedCheckList.html("");
		    	 		}
		    	 	 });
		    	 	}
		    } ,
			    
	    select: function(info) {
	    	
	    }
			    
	  });
	  calendar.render(); // 달력 출력
  });

$(document).ready(function(){
	
	$(".takeoutReserved-table").hide();
	var reservedCheckList = $(".reservedCheckList");
	
	$(document).on('click', '.reservedCheck', function(){
		
		var orderId = $(event.target).parents().siblings(".reservedOrderId").text();
		var list = "";
		
		$.ajax({
			url : "/pos/reservedListCheck",
			type : "GET",
			data : {"orderId" : orderId},
			success : function(data){
					$.each(data, function(index,item){
						list +="<li class='ajaxMenuName'>상품명 : "+item.menuName+"</li><li>수량 : "+item.menuCnt+"</li>";
					})
					reservedCheckList.html(list);
			}
		})
	});
	$(document).on('click', '.takeoutReservedCheck', function(){
		var takeoutId = $(event.target).data("takeoutid");
		var list = "";
		
		$.ajax({
			url : "/pos/takeoutReservedCheck",
			type : "GET", 
			data : {"takeoutId" : takeoutId},
			success : function(data){
				$.each(data, function(index, item){
					list +="<li class='ajaxMenuName'>상품명 : "+item.menuName+"</li><li>수량 : "+item.menuCnt+"</li>";
				})
				reservedCheckList.html(list);
			}
		})
	});
	var socket = io("http://localhost:84");
	$(document).on('click', '.orderReady', function(){
		var orderId = $(event.target).parent().siblings(".reservedOrderId").text();
		var item = $(event.target).parent().siblings().parent() ;
		var orderReadyHtml = "";
		orderReadyHtml += "Complete";
		$(event.target).parent().siblings().parent().css("background", "#eeeeee");
		$(event.target).parent().html(orderReadyHtml);
		$(".reservedContainer").append(item);
		
			//msg_process를 클릭할 때
		socket.emit("orderDisplay", orderId);
		
		$.ajax({
			url : "/pos/reservedListStatus",
			data : {"orderId":orderId},
			success : function(data){
				
			}
		})
	});
	function cloneNode(){
		
	}
	$(document).on('click', '.takeoutOrderReady', function(){
		var takeoutId = $(event.target).data("takeoutid");
		var takeoutReadyHtml = "";
		var item = $(event.target).parent().siblings().parent();
		takeoutReadyHtml += "Complete";
		$(event.target).parent().siblings().parent().css("background", "#eeeeee");
		$(event.target).parent().html(takeoutReadyHtml);
		$(".takeoutReservedContainer").append(item);
		$.ajax({
			url : "/pos/takeoutReservedListStatus",
			data : {"takeoutId":takeoutId},
			success : function(data){
			}
		})
	});
	$(document).on('click', '#storeReserved', function(){
		$(".reserved-table").show();
		$(".takeoutReserved-table").hide();
		$(".reservedList-title").text("매장 예약 내역");
	})
	$(document).on('click', '#takeoutReserved', function(){
		$(".reserved-table").hide();
		$(".takeoutReserved-table").show();
		$(".reservedList-title").text("테이크아웃 예약 내역");
	})
//	$(document).on('click', '.orderCancle', function(){
//		var orderCancleHtml = "";
//		orderCancleHtml += "상품 준비 중 <button type='button' class='orderReady'>조리완료</button>";
//		$(event.target).parent().siblings().parent().css("background", "white");
//		$(event.target).parent().html(orderCancleHtml);
//	})
	
	
});