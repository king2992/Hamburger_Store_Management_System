/**
 * Web Kiosk First Screen *
 */

// 주문 결제 완료 alert
function payment() {
	let timerInterval
	Swal.fire({
	  title: '주문 결제 중 입니다~',
	  html: '잠시만  기다려주세요~ <strong></strong>',
	  timer: 2000,
	  onBeforeOpen: () => {
	    Swal.showLoading()
	    timerInterval = setInterval(() => {
	      Swal.getContent().querySelector('strong')
	        .textContent = Swal.getTimerLeft()
	    }, 100)
	  },
	  onClose: () => {
	    clearInterval(timerInterval)
	    swal();
	  }
	}).then((result) => {
	  if (
	    result.dismiss === Swal.DismissReason.timer
	  ) {
	    console.log('주문 결제가 완료 되었습니다.')
	  }
	});
// swal() 생성
	function swal() {
	Swal.fire({
		
		  position: 'center',
		  type: 'success',
		  title: '주문 결제가 완료 되었습니다!<br>감사합니다!',
		  showConfirmButton: false,
		  timer: 1500
		});
	}
}
// 주문 결제 취소 alert
function cancel(){
	Swal.fire({
		title: '결제가 취소 되었습니다.',
	  	width: 600,
	  	padding: '3em',
	  	background: '#fff url(/images/trees.png)',
	  	backdrop: `
	  		rgba(0,0,123,0.4)
	  		url("/resources/kiosk/images/test.gif")
	  		center left
	  		no-repeat
	  		`
	});
};
// 메뉴 X 버튼 클릭 시 alert
function swal2() {
	Swal.fire(
		  '메뉴 내역이 삭제되었습니다!',
		  'OK 를 클릭해주세요!',
		  'success'
		  
		)
};
// 50개 이상 되면 alert
function swal3() {
	Swal.fire({
		  type: 'error',
		  title: 'Oops...',
		  text: '더이상 수량을 증가 시킬 수 없습니다!',
		  footer: '<a href>메뉴로  돌아가기</a>'
		});
};
function swal4() {
	Swal.fire({
		  type: 'error',
		  title: '잠깐만...........',
		  text: '1개 이상은 시켜야지 시키야',
		  footer: '<a href>메뉴로 돌아가기</a>'
		});
};
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
// 주문 내역 
// + = .p_btn
// - = .m_btn
// x = .menu_del
		$(function(){
			$('.tab_cont li img').on('click', function() {
				var menuname = $(this).data('menuname');
				var price = $(this).data('price');
				$('.table_tr2').append('<tr>'+'<td id="menuname'+menuname+'">'+menuname+'</td>'+'<td>'+'<button class="p_btn">+</button>'+'&nbsp;<span class="cnt'+menuname+'">1</span>&nbsp;'+'<button class="m_btn">-</button>'+'</td>'+'<td class="listPrice">'+price+'<button class="menu_del">X</button>'+'</td>'+'</tr>');
			});
		});
// 주문 내역 삭제
		$(document).on('click', '.menu_del', function(){
			$(this).parent().parent().remove();
			swal2();
		});
// 수량 + 
		$(document).on('click','.p_btn', function(){	
			var item = $(this).siblings("span").text();
			if (item < 50){
				item ++;
			} else {(item > 10)
			swal3();
			}
			var tot = item;
			$(this).siblings("span").text(tot);
// 수량 증가 시 금액 
			var price = $('.tab_cont li img').data('price');
			var sum = item * price;
			var priceItem = $(this).parent().siblings(".listPrice");
			priceItem.html(sum + "<button class='menu_del'>X</button>");
		});
// 수량 -
		$(document).on('click','.m_btn', function(){
			var item = $(this).siblings("span").text();
			if(item > 1 ){
				item --;
			}
			var tot = item;
			$(this).siblings("span").text(tot);
// 수량 감소 시 금액
			var price = $('.tab_cont li img').data('price');
			var minus = item * price;
			var priceItem = $(this).parent().siblings('.listPrice');
			priceItem.html(minus + "<button class='menu_del'>X</button>");
			
			var total = priceItem
		});
// 주문 총 금액	
		
//		$(document).on('click','.tab_cont li img', function(){
//			var price = $(this).data('price');
//			console.log('>>>>>>>>>>>>>>>>'+price);
//			var priceItem = $('.listPrice').html();
//			console.log(priceItem+'<<<<<<<<<<<<<<<<<<<<<<<<<');
//		});
//		$(function(){
//			$('.tab_cont li img').on('click', function(){
//				var price = $(this).data('price');
//				console.log('>>>>>>>>>>>>>>>>>>'+price);
//				var total = $('.listPrice').data('price');
//				console.log('>>>>>>>>>>>>>>>>>>'+total);
//				var priceTotal = $(event.target).children().data();
//				console.log('>>>>>>>>>>>>>>>>>>'+priceTotal);
//				$('label').empty(); 
//				var total = (price*$('.listPrice')).data('price');
//				console.log(total);
//				
//			});
//		});
//		$(function(){
//			var total = $('.')
//			$('.total_pay').html(total);
//			
//			$(function(){
//				var total = $('.cnt').find().parents().append()
//			});
//			$('.total_pay').on('click', function(){
//				var price = $('.table_tr2').children('td').data('price');
//				
//			console.log(price);
//			});
//		});
//		$('.total_pay').text();		
//	$(function() {
//		var sum;
//		console.log(sum);
//	$('.table_tr2').find('.listPrice').each(function(){
//		sum += Number($(this).parents('tr').find('.listPrice').text());
//		});
//	});
//		var sum = $('.listPrice').text();
//			$('.total_pay').append('');
//		$(function(){
//			$('.tab_cont li img').on('click', function(){
//				var price = $(event.target).data('price');
//				console.log(price);
//				var total = $(event.target).data();
//				var totalPrice = $('.listPrice').text();
//				console.log(totalPrice);
//		$(function(){
//			$('label').empty();
//			var price = $('.tab_cont li img').data('price');
//			console.log(price);
//		});
//				$(document).on('click', 'p_btn', function(){
//					console.log(totalPrice);
//				});
//				
//				$(document).on('click','m_btn', function(){
//					console.log(totalPrice);
//				});
//			});
//		});
		
});


