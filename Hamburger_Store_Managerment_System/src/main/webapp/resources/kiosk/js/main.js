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
				var cnt = $('#menuname'+menuname+'').siblings('.td2').children('.cnt'+menuname+'').text();
// 이미지 클릭 시 수량 증가 중복방지
				if($('#menuname'+menuname+'').length == 1){
					var a = Number(cnt) + 1;
					var b = "";
					b = Number(a) * Number(price);
					$('#menuname'+menuname+'').siblings('.td2').children('.cnt'+menuname+'').text(a);
					$('#menuname'+menuname+'').siblings('.listPrice').children('.spanPrice').text(b);
					totalPrice();
					return;
				} else {
				$('.table_tr2').append(
						'<tr>'+
						'<td id="menuname'+menuname+'">'+menuname+'</td>'+
						'<td class="td2">'+'<button class="p_btn">+</button>'+'&nbsp;<span class="cnt'+menuname+'">1</span>&nbsp;'+'<button class="m_btn">-</button>'+'</td>'+
						'<td class="listPrice"><span class="spanPrice">'+price+'</span><button class="menu_del">X</button>'+'</td>'+
						'</tr>');
				totalPrice();
				}
			});
		});
// 주문 내역 삭제
		$(document).on('click', '.menu_del', function(){
			$(this).parent().parent().remove();
			swal2();
			totalPrice();
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
			priceItem.html("<span class='spanPrice'>"+sum +"</span>"+"<button class='menu_del'>X</button>");
			totalPrice();
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
			priceItem.html("<span class='spanPrice'>"+minus +"</span>"+"<button class='menu_del'>X</button>");
			
			var total = priceItem;
			totalPrice();
		});
// 주문 총 금액
		function totalPrice(){
			var total = "";
			$.each($('.spanPrice'),function(){
				var tot = $(this).text();
				total = Number(total) + Number(tot);
			});
			$('#total_price').text(total);
		};
});


