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
// 접근 불가 alert
function swal3() {
	Swal.fire({
		  type: 'error',
		  title: 'Oops...',
		  text: 'Something went wrong!',
		  footer: '<a href>Why do I have this issue?</a>'
		});
};

function swal4() {
	Swal.fire({
		  type: 'error',
		  title: 'Oops...',
		  text: 'Something went wrong!',
		  footer: '<a href>Why do I have this issue?</a>'
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
	
// 동적으로 생성하는 주문 내역
// + = .p_btn
// - = .m_btn
// x = .menu_del
		$(function(){
			$('.tab_cont li img').on('click', function() {
				var menuname = $(this).data('menuname');
				var price = $(this).data('price');
				$('.table_tr2').append('<tr>'+'<td id="menuname'+menuname+'">'+menuname+'</td>'+'<td>'+'<button class="p_btn">+</button>'+'&nbsp;<span class="cnt'+menuname+'">1</span>&nbsp;'+'<button class="m_btn">-</button>'+'</td>'+'<td>'+price+'<button class="menu_del">X</button>'+'</td>'+'</tr>');
				console.log(menuname);
				console.log(price);
			});
		});
		
// 주문 내역 삭제
		
		$(document).on('click', ".menu_del", function(){
			$(this).parent().parent().remove();
			swal2();
		});
// 갯수 + / -
		
		$(document).on('click','.p_btn', function(){
			var item = $(this).siblings("span").text();
				item ++;
			var tot = item;
			$(this).siblings("span").text(tot);
		});
		$(document).on('click','.m_btn', function(){
			var item = $(this).siblings("span").text();
			if(item > 1 ){
				item --;
			}
			var tot = item;
			$(this).siblings("span").text(tot);
		});

	
});


