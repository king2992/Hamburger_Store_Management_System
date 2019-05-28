$(document).ready(function() {
		var socket = io("http://localhost:84");
		
		socket.on('orderDisplay', function(orderId) {
			
			$('<li></li>').text(orderId).appendTo("#orderListFinish");
			
			
		});
		
		setInterval(function(){
			window.location.reload();
		}, 500)
		var orderListFinish = document.getElementById("orderListFinish");
		if(orderListFinish.childElementCount == 11){
			var orderId = $("#orderListFinish").children().first().text();
			$.ajax({
				data : {"orderId" : orderId},
				url : "/order/orderDisplayOk",
				success : function(data){
				}
			})
		}
	});