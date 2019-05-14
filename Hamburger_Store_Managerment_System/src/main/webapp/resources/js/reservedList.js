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
		    	 var reservedContainer = $(".reservedContainer");
		    	 var reservedCheckList = $(".reservedCheckList");
		    	 $.ajax({
		    		url : "/pos/dateSort",
		    		type : "GET",
		    		data : {"regDate":regDate},
		    		success : function(data){
		    			$.each(data, function(index, item){
		    				if(item.status == "Ready"){
			    				list += "<tr>";
			    				list += "<td class='reservedOrderId'>" +item.orderId+"</td>";
			    				list += "<td>" + item.regDate +" "+item.regTime + "</td>";
			    				list += "<td>" + item.payTotal + "</td>";
			    				list += "<td data-tooltip-text='예약내역 확인하기'>" +'<button type="button" class="reservedCheck btn btn-concrete">'+"예약 메뉴 확인"+"</button>" +"</td>";
			    				list += "<td>"+item.status+ "<button type='button' class='orderReady button'>"+"조리완료"+"</button>"+"</td>";
			    				list += "</tr>";
		    				}else {
		    					list += "<tr style='background-color:gray'>";
			    				list += "<td class='reservedOrderId'>" +item.orderId+"</td>";
			    				list += "<td>" + item.regDate +" "+item.regTime + "</td>";
			    				list += "<td>" + item.payTotal + "</td>";
			    				list += "<td data-tooltip-text='예약내역 확인하기'>" + '<button type="button" class="reservedCheck btn btn-concrete">'+"예약 메뉴 확인"+"</button>" +"</td>";
			    				list += "<td>" +item.status+ "</td>";
			    				list += "</tr>";
		    				}
		    			})
		    			reservedContainer.html(list);
		    			reservedCheckList.html("");
		    		}
		    	 });
		    } ,
			    
	    select: function(info) {
	    	
	    }
			    
	  });
	  calendar.render(); // 달력 출력
  });

$(document).ready(function(){
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
	
	$(document).on('click', '.orderReady', function(){
		var orderId = $(event.target).parent().siblings(".reservedOrderId").text();
		var orderReadyHtml = "";
		orderReadyHtml += "Complete";
		$(event.target).parent().siblings().parent().css("background", "gray");
		$(event.target).parent().html(orderReadyHtml);
		
		$.ajax({
			url : "/pos/reservedListStatus",
			data : {"orderId":orderId},
			success : function(data){
			}
		})
	});
	
//	$(document).on('click', '.orderCancle', function(){
//		var orderCancleHtml = "";
//		orderCancleHtml += "상품 준비 중 <button type='button' class='orderReady'>조리완료</button>";
//		$(event.target).parent().siblings().parent().css("background", "white");
//		$(event.target).parent().html(orderCancleHtml);
//	})
	
});