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

//function menu_del() {
//	Swal.fire({
//		  position: 'top-end',
//		  type: 'success',
//		  title: '결제 취소!',
//		  showConfirmButton: false,
//		  timer: 1500
//		});
//}	
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
				
				var menuname = $(event.target).data("menuname");
				var price = $(event.target).data("price");
				$('.table_tr2').append('<tr>');
				$('.table_tr2').append('<td>'+menuname+'</td>');
				$('.table_tr2').append('<td>1</td>');
				$('.table_tr2').append('<td>'+price+'<button class="menu_del">취소</button>'+'</td>');
				$('.table_tr2').append('</tr>');
			});
		});

//$(function(){	
//$('.menu_del').on('click', function(){
//			console.log($(event.target));
//			$(event.target).parents('tr').remove();
//			
//		});		
//	});
		$(document).on('click', ".menu_del", function(){
			//$(event.target).parents('tr').remove();
			$(event.target).parent().parent().remove();
		})
});


