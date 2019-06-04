window.onload = function(){
	//var todayDate = new Date();
	Date.prototype.format = function(f) {
	    if (!this.valueOf()) return " ";
	 
	    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	    var d = this;
	     
	    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
	        switch ($1) {
	            case "yyyy": return d.getFullYear();
	            case "yy": return (d.getFullYear() % 1000).zf(2);
	            case "MM": return (d.getMonth() + 1).zf(2);
	            case "dd": return d.getDate().zf(2);
	            case "E": return weekName[d.getDay()];
	            case "HH": return d.getHours().zf(2);
	            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
	            case "mm": return d.getMinutes().zf(2);
	            case "ss": return d.getSeconds().zf(2);
	            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
	            default: return $1;
	        }
	    });
	};
	 
	String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
	String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
	Number.prototype.zf = function(len){return this.toString().zf(len);};


	 var todayDate = new Date().format('yyyy-MM-dd');
	 $.ajax({
		 data : {"regDate" : todayDate},
		 url : "/pos/todaySales",
		 success : function(data){
			 $(".storeSales").text("매출액 : " + data);
		 }
	 })
}

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
		    	 $.ajax({
		    		 data : {"regDate" : regDate},
		    		 url : "/pos/todaySales",
		    		 success : function(data){
		    			 $(".storeSales").text("매출액 : " + data);
		    		 }
		    	 })
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
		var documentTable = $(".documentTable");
		$.ajax({
			url : "/pos/reservedListCheck",
			type : "GET",
			data : {"orderId" : orderId},
			success : function(data){
					$.each(data, function(index,item){
						list +="<td class='ajaxMenuName'>"+item.menuName+"</td><td>"+item.menuCnt+"</td>";
					})
					documentTable.html(list);
			}
		})
	});
	$(document).on('click', '.takeoutReservedCheck', function(){
		var takeoutId = $(event.target).data("takeoutid");
		var list = "";
		var documentTable = $(".documentTable");
		$.ajax({
			url : "/pos/takeoutReservedCheck",
			type : "GET", 
			data : {"takeoutId" : takeoutId},
			success : function(data){
				$.each(data, function(index, item){
					console.log(item.menuName);
					console.log(item.menuCnt);
					list += "<td class='ajaxMenuName'>" + item.menuName + "</td><td>" + item.menuCnt + "</td>";
				})
				documentTable.html(list);
			}
		})
	});
	
	$(document).on('click', '.orderReady', function(){
		var orderId = $(event.target).parent().siblings(".reservedOrderId").text();
		var item = $(event.target).parent().siblings().parent() ;
		var orderReadyHtml = "";
		orderReadyHtml += "Complete";
		$(event.target).parent().siblings().parent().css("background", "#eeeeee");
		$(event.target).parent().html(orderReadyHtml);
		$(".reservedContainer").append(item);
		
			//msg_process를 클릭할 때
		
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
	
});