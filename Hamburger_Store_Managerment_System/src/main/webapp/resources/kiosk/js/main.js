/**
 Web Kiosk First Screen * 
 */
function payment() {
	Swal.fire({
		  position: 'top-end',
		  type: 'success',
		  title: '결제 완료!',
		  showConfirmButton: false,
		  timer: 1500
		});
}

function cancel() {
	Swal.fire({
		  position: 'top-end',
		  type: 'success',
		  title: '결제 취소!',
		  showConfirmButton: false,
		  timer: 1500
		});
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
	
// 동적으로 생성하는 주문 내역			
		$(function() {
			$('.tab_cont li img').on('click', function(){
				
				$('.table_tr2').append('<th>우아우아아아ㅏ아아아</th>')
				$('.table_tr2').append('<th>1</th>');
				$('.table_tr2').append('<th>10000</th>');
				$('.table_tr2').append('<tr>');
				
	
			})
		})
});


