$(document).ready(function() {
		var socket = io("http://localhost:84");
		
		socket.on('orderDisplay', function(orderId) {
			console.log(orderId)
			/*$('<li></li>').text(orderId).appendTo("#orderList");*/
			$('<li></li>').text(orderId).appendTo("#orderListFinish");
		});
	});