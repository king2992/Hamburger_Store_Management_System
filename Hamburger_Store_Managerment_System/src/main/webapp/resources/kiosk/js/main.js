/**
 Web Kiosk First Screen * 
 */
function payment() {
	alert("결제완료");
}

function cancel() {
	alert("결제취소");
}
// Tab 메뉴
$(document).ready(function(){
	
	$('.hide').hide();
	$('.tab_btn li').click(function(){
		$('.hide').show();
		var list = $(this).index();
		$('.tab_btn li').removeClass("on");
		$(this).addClass("on");
		$(".center-wrap > div > ul").hide();
		$(".center-wrap > div > ul").eq(list).show();
	});
	
	$('.tab_cont li img').click(function(){
		
		var array = [
			{name : 'chipao', price : '20000'},
			{name : 'baba', price : '19000'}
		];
		
		$.each(array, function(index,value){
			var a = '';
			
			a += '<p style="white">'+value.name+'</p>';
			a += '<p style="white">'+value.price+'</p>';
		});
		
		
	});
	$('.order_list_view').html(a);
});


