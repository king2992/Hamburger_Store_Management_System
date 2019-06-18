/**
 * Web Kiosk First Screen *
 */

// 주문 결제 완료 alert
  
function payment() {
   let timerInterval
   Swal.fire({
     title: '주문 결제 중 입니다~',
     html: '잠시만  기다려주세요~ <strong></strong>',
     timer: 1500,
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
//결제 취소
function paymentCancel() {
   let timerInterval
   Swal.fire({
     title: '주문 취소 중 입니다!',
     html: '잠시만  기다려주세요! <strong></strong>',
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
       swalCancel();
     }
   }).then((result) => {
     if (
       result.dismiss === Swal.DismissReason.timer
     ) {
       console.log('주문 취소가 완료 되었습니다.')
     }
   });
// swalCancel() 생성
   function swalCancel() {
   Swal.fire({
        position: 'center',
        type: 'success',
        title: '주문 취소가 완료 되었습니다!<br>이용해 주셔서<br>감사합니다!',
        showConfirmButton: false,
        timer: 1500
      });
   }
}
// 주문 결제 취소 alert
function cancel(){
   Swal.fire({
        title: '알림',
        text: "결제를 취소 하시겠습니까?",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes'
      }).then((result) => {
        if (result.value) {
          Swal.fire(
            '알림',
            '결제가 취소되었습니다!',
            'success'
          )
        }
      });
}
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

// 세트 메뉴 확인 취소 선택
function swal4() {
Swal.fire({
     title: '주문내역이 지워집니다.<br/>진행하겠습니까?',
     type: 'warning',
     showCancelButton: true,
     confirmButtonColor: '#3085d6',
     cancelButtonColor: '#d33',
     confirmButtonText: '지울겨 왜'
   }).then((result) => {
     if (result.value) {
       Swal.fire(
         '주문내역이 삭제 되었습니다!',
         'success'
       )
     }
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
  
         $('.tab_cont li img,.set_wrap li img').on('click', function() {
        
            var menuname = $(this).data('menuname');
            var price = $(this).data('price');
            var cnt = $('#menuname'+menuname+'').siblings('.td2').children('.cnt'+menuname+'').text();
            
                  
// 이미지 클릭 시 수량 증가 중복방지
            if($("#menuname"+menuname+"").length == 1){
               var a = Number(cnt) + 1;
               var b = "";
               b = Number(a) * Number(price);
               $('#menuname'+menuname+'').siblings('.td2').children('.cnt'+menuname+'').text(a);
               $('#menuname'+menuname+'').siblings('.listPrice').children('.spanPrice').text(b);
               $('#order'+menuname+'').siblings('.td2').children('.orderCnt'+menuname+'').text(a);
               $('#order'+menuname+'').siblings('.orderListPrice').children('.orderPrice'+menuname).text(b);
               totalPrice();
               return;
            } else {
            $('.table_tr2').append(
                  '<tr class="order_list">'+
                  '<td id="menuname'+menuname+'" class="menunames">'+menuname+'</td>'+
                  '<td class="td2">'+'<button class="p_btn">+</button>'+'&nbsp;<span class="cnt'+menuname+' menuCnt">1</span>&nbsp;'+'<button class="m_btn">-</button>'+'</td>'+
                  '<td class="listPrice"><span class="spanPrice prices">'+price+'</span><button class="menu_del">삭제</button>'+'</td>'+
                  '</tr>');
            $('.order_tbody').append(
                    '<tr class="order_list">'+
                    '<td id="order'+menuname+'" class="menunames2">'+menuname+'</td>'+
                    '<td class="td2">'+'&nbsp;<span class="orderCnt'+menuname+'">1</span>&nbsp;'+'</td>'+
                    '<td class="orderListPrice"><span class="orderPrice'+menuname+'">'+price+'</span>'+'</td>'+
                    '</tr>');
            totalPrice();
            }
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
         var menuName = $(this).parent().siblings(".menunames").text();
         console.log(menuName);
         if (item < 50){
            item ++;
         } else {(item > 10)
         swal3();
         }
         var tot = item;
         $(this).siblings("span").text(tot);
         $(".orderCnt"+menuName).text(tot);
         
// 수량 증가 시 금액
         var price = $('.tab_cont li img').data('price');
         var sum = item * price;
         $(".orderPrice"+menuName).text(sum);
         var priceItem = $(this).parent().siblings(".listPrice");
            priceItem.html("<span class='spanPrice'>"+sum +"</span>"+"<button class='menu_del'>삭제</button>");
            totalPrice();
      });
// 수량 -
      $(document).on('click','.m_btn', function(){
         var item = $(this).siblings("span").text();
         var menuName = $(this).parent().siblings(".menunames").text();
         console.log(menuName);
         if(item > 1 ){
            item --;
         }
         var tot = item;
         $(this).siblings("span").text(tot);
         $(".orderCnt"+menuName).text(tot);
         
// 수량 감소 시 금액
         var price = $('.tab_cont li img').data('price');
         var minus = item * price;
         $(".orderPrice"+menuName).text(minus);
         var priceItem = $(this).parent().siblings('.listPrice');
         priceItem.html("<span class='spanPrice'>"+minus +"</span>"+"<button class='menu_del'>삭제</button>");
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
         $("#orderPayMent").text(total);
      };
         $('#hide').hide();
            $('.modal_set li').click(function(){
               $('#hide').show();
               var list = $(this).index();
               $('.modal_set li').removeClass('set');
               $(this).addClass('set');
               $('.set_wrap > div > ul').hide();
               $('.set_wrap > div > ul').eq(list).show();
            });
// 세트메뉴 > 사이드 or 음료류 이미지 클릭 시 선택수량 1씩 증가
      var cnt = 0;
         $('.set_side_ul img').on('click', function(){
            $(this).each(function(){
               cnt++;
            });
            $('.set_total label').text(Number(cnt));
         });
// 이미지 클릭 시 선택 확인 토스트 알림      
         $('.set_side_ul img,.tab_cont img').click(function(){
            toastr.option = {
                  "progressBar" : true,
                  "timeOut" : 1000,
            }
               toastr.success('주문내역에 추가 되었습니다!');
         });
// Modal 취소하기 클릭 시 주문내역 삭제 및 금액,선택수량 초기화         
         $('.set_cancel').click(function(){
            $('.order_list').remove();
            var count = $('.set_total label').text('0');
            totalPrice();
            cnt = 0;
         });
// img Slide         
         var myIndex = 0;
         carousel();
         function carousel() {
             var i;
             var x = document.getElementsByClassName("mySlides");
             for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";  
             }
             myIndex++;
             if (myIndex > x.length) {myIndex = 1}    
             x[myIndex-1].style.display = "block";  
             setTimeout(carousel, 2000); // Change image every 2 seconds
         }
// 화면 Slide         
         new Swiper('#swiper', {
            navigation : {
               nextEl : '.swiper-button-next', 
               prevEl : '.swiper-button-prev', 
            },
         });
// Step 1      
         $('.slide_div2 td img:nth-child(2)').hide();
         $('.payment_table td,.choice_check2 td').css('background','transparent').css('color','black');
         $('.choice_check3 td').children('a').removeAttr('href');
         $('.choice_check td').on('click',function(event){
            var back = $('.takeout_table').css('opacity');
            console.log(back);
            if (back == 1){
            $(this).find('img:nth-child(2)').show(event);
            var img = $(this).index();
            console.log(img);
            $('.choice_check td img:nth-child(2)').removeClass('V');
            $(this).addClass('V');
            $('.choice_check td img:nth-child(2)').hide();
            $('.choice_check td img:nth-child(2)').eq(img).show();
            $('.takeout_table').css('opacity','0.5');
            $('.sale_point_table').css('opacity','1');
            $('.choice_check td').css('background','transparent').css('color','black');
            event.preventDefault();
            }
            $('.choice_check td').css('cursor','default');
         });
// Step 2   
         $('.choice_check2 td').mouseover(function(){
            var back = $('.sale_point_table').css('opacity');
            console.log(back);
            if (back == 1){
               $(this).css('background','#ff4500').css('color','#fff').css('cursor','pointer');
            }
         }).mouseout(function(){
            $(this).css('background','transparent').css('color','#000');
         });
         $('.choice_check2 td').on('click',function(event){
            var back = $('.sale_point_table').css('opacity');
            console.log(back);
            if (back == 1){
            $(this).find('img:nth-child(2)').show(event);
            var img = $(this).index();
            $('.choice_check2 td img:nth-child(2)').removeClass('V');
            $(this).addClass('V');
            $('.choice_check2 td img:nth-child(2)').hide();
            $('.choice_check2 td img:nth-child(2)').eq(img).show();
            $('.sale_point_table').css('opacity','0.5');
            $('.payment_table').css('opacity','1');
            $('.choice_check2 td').css('background','transparent').css('color','black');
            event.preventDefault();
            }
            $('.choice_check2 td').css('cursor','default');
            $('.choice_check3 td:nth-child(1)').children('a').attr('href','#pay');
            $('.choice_check3 td:nth-child(2)').children('a').attr('href','#mobile_div');
            $('.choice_check3 td:nth-child(3)').children('a').attr('href','#bus_card');
         });
// Step 3    
         $('.choice_check3 td').mouseover(function(){
            var back = $('.payment_table').css('opacity');
            console.log(back);
            if (back == 1){
               $(this).css('background','#ff4500').css('color','#fff');
            }
         }).mouseout(function(){
            $(this).css('background','transparent').css('color','#000');
         });
         $('.choice_check3 td').on('click',function(event){
            var back = $('.payment_table').css('opacity');
            console.log(back);
            var pText = $(this).find("p").text();
            $("#payMentKinds").text(pText);
            if (back == 1){
            $(this).find('img:nth-child(2)').show(event);
            var img = $(this).index();
            $('.choice_check3 td img:nth-child(2)').removeClass('V');
            $(this).addClass('V');
            $('.choice_check3 td img:nth-child(2)').hide();
            $('.choice_check3 td img:nth-child(2)').eq(img).show();
            $('.payment_table').css('opacity','0.5').css('color','black');
            event.preventDefault();
            }
         });
// 결제 Modal 취소 Btn
         $('.pay_btn').click(function(){
            paymentCancel();
         });
// 이미지 클릭 시 zoomOutDown animate         
         $(document).on('click','.tab_cont img,.set_side_ul img', function(){
        	var imgSrc = $(this).attr('src');
        	$(this).addClass('zoomOutDown');
        	var test2 = $(this).css('background-image');
        	setTimeout(function(){
               	$('.tab_cont img').removeClass('zoomOutDown');
        	}, 1000);
         });
//결제 완료
         var menuNameArray = [];
         var menuCntArray = [];
         var menuPriceArray = [];
         $('.check_btn').click(function(){
        	 $(".modalPay").hide();
        	var payTotal = $("#orderPayMent").text();
        	$(".menunames").each(function(){
        		var menuName = $(this).text();
        		menuNameArray.push(menuName);
        	});
        	$(".menuCnt").each(function(){
        		var menuCnt = $(this).text();
        		menuCntArray.push(menuCnt);
        	});
        	$(".spanPrice").each(function(){
        		var menuPrice = $(this).text();
        		menuPriceArray.push(menuPrice);
        	})
        	var today = new Date();
			var dd = today.getDate();
			var mm = today.getMonth()+1; //January is 0!
			var yyyy = today.getFullYear();
			var hours = today.getHours();
			var minute = today.getMinutes();
			var seconds = today.getSeconds();
			
			if(dd<10) {
			    dd='0'+dd
			} 
			if(mm<10) {
			    mm='0'+mm
			} 
			today = yyyy+'/'+mm+'/'+dd ;
			nowDate = hours + "시" + minute + "분" + seconds + "초";
			
        	$.ajax({
        		url : "/kiosk/orders",
        		data : {"payTotal":payTotal},
        		success : function(data){
        			$.ajax({
        				url : "/kiosk/menuAdd",
        				data : {"menuNameArray" : menuNameArray, "menuCntArray" : menuCntArray},
        				success : function(data){
        					payment();
        					var receipt = "";
        					for(var i = 0 ; i < menuNameArray.length; i ++){
				        		receipt = "<tr>" +
												"<td>" + menuNameArray[i] + "</td>" +
												"<td>" + menuCntArray[i] + "</td>" +
												"<td>" + menuPriceArray[i] + "</td>" +
										  "</tr>";
				        		$(".documentTable").append(receipt);
        					}
        					var totalPrice = $("#total_price").text();
        					$("#documentPayment").text(totalPrice);
        					$("#documentTimeCheck").text(today+" "+nowDate);
        					 setTimeout(function(){
        			        	 $(".documentPopup").show();$(".documentCenter").show();
        					 },2500);
        				}
        			})
        		}
        	})
         });
         $(document).on("click",".documentClose",function(){
        	 $(".documentPopup").hide();$(".documentCenter").hide();
        		 receiptPrint();	 
         });
// 스크롤 현재 위치         
         $(window).scroll(function(){
        	 var scrollValue = $(document).scrollTop();
        	 console.log(scrollValue);
         });
// 스크롤 위치 이동         
 		$('#order_add_btn').click(function(){
			var offset = $('.order_div').offset();
			$('html').animate({scrollTop : offset.top}, 0);
		});
// 결제 취소  
 		$('.order_cancel_btn').click(function(){
 			paymentCancel();
 			setTimeout(function(){
	        	 window.location.reload();
			 },3000);
 		})
});
function receiptPrint() {
	   let timerInterval
	   Swal.fire({
	     title: '영수증 출력중입니다~',
	     html: '잠시만  기다려주세요~ <strong></strong>',
	     timer: 1200,
	     onBeforeOpen: () => {
	       Swal.showLoading()
	       timerInterval = setInterval(() => {
	         Swal.getContent().querySelector('strong')
	           .textContent = Swal.getTimerLeft()
	       }, 100) 
	     },
	     onClose: () => {
	       clearInterval(timerInterval)
	       receiptPrintSwal();
	     }
	   }).then((result) => {
	     if (
	       result.dismiss === Swal.DismissReason.timer
	     ) {
	       console.log('주문 결제가 완료 되었습니다.')
	     }
	   });
	// swal() 생성
	   function receiptPrintSwal() {
	   Swal.fire({
	      
	        position: 'center',
	        type: 'success',
	        title: '출력이 완료 되었습니다.<br>감사합니다.',
	        showConfirmButton: false,
	        timer: 1500
	      });
	   setTimeout(function(){
		   window.location.reload();   
	   }, 1300);
	   
	   }
	}