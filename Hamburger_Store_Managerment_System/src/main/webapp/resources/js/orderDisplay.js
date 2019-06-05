//$(document).ready(function() {
//
//		
//		setInterval(function(){
//			window.location.reload();
//		}, 200)
//		var orderListFinish = document.getElementById("orderListFinish");
//		if(orderListFinish.childElementCount == 11){
//			var orderId = $("#orderListFinish").children().first().text();
//			$.ajax({
//				data : {"orderId" : orderId},
//				url : "/order/orderDisplayOk",
//				success : function(data){
//				}
//			})
//		}
//	});