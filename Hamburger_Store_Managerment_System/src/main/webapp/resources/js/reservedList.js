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
			    			console.log(data);
			    			$.each(data, function(index, item){
			    				list += "<tr>";
			    				list += "<td class='reservedOrderId'>" +item.orderId+"</td>";
			    				list += "<td>" + item.regDate +" "+item.regTime + "</td>";
			    				list += "<td>" + item.payTotal + "</td>";
			    				list += "<td data-tooltip-text='예약내역 확인하기'>" +'<button type="button" class="reservedCheck">'+"예약 메뉴 확인"+"</button>" +"</td>";
			    				list += "<td>"+"상품 준비 중"+"<button type='button' class='orderReady'>"+"조리완료"+"</button>"+"</td>";
			    				list += "</tr>";
			    			})
			    			reservedContainer.html(list);
			    			reservedCheckList.html("");
			    		}
			    	 });
			    	 console.log(info.dateStr);
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
						console.log(data.length);

						list +="<li class='ajaxMenuName'>상품명 : "+item.menuName+"</li><li>수량 : "+item.menuCnt+"</li>";
					})
					reservedCheckList.html(list);
			}
		})
	});
	
	$(document).on('click', '.orderReady', function(){
		var orderReadyHtml = "";
		orderReadyHtml += "조리완료<button type='button' class='orderCancle'>취소</button>";
		$(event.target).parent().html(orderReadyHtml);
		
	});
	$(document).on('click', '.orderCancle', function(){
		var orderCancleHtml = "";
		orderCancleHtml += "상품 준비 중 <button type='button' class='orderReady'>조리완료</button>";
		$(event.target).parent().html(orderCancleHtml);
	})
	
});