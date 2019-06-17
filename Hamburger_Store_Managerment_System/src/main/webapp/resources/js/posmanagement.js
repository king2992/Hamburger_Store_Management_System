	var userId = "${sessionScope.user}";

	
	var menuNameArray = new Array();
	var menuCntArray = new Array();
$(document).ready(function() {
	localStorage.clear();
	$(".chicken").show();
	$(".burger").hide();
	$(".side").hide();
	$(".drink").hide();
	$(".setModal").hide();
	$(".modal").hide();
	$(".burgerOrSet").hide();$(".burgerOrSet-content").hide();
	$(".setSideList").hide();$(".setDrinkList").hide();$(".sideFlavorSelect").hide();$(".setSelect").hide();
	$(document).on("click", ".moneyImg",function(){
		var thisMoney = $(this).data("money");
		var ReceiveMoney = $("#payTotal").val();
		var total = "";
		
		total = Number(ReceiveMoney) + Number(thisMoney) ;
		
		$("#payTotal").val(total);
		
	});
	$(document).on("click", "#moneyReset", function(){
		$("#payTotal").val("");
	})
	$(document).on("click",".document",function(){
		
		var payTotal = $("#payTotal").val();
		var payTotal2 = $("#payTotal2").val();
		var nmg = $("#nmg").val(Number(payTotal) - Number(payTotal2));
		
		console.log(payTotal);
		console.log(payTotal2);
		
		if(Number(payTotal) < Number(payTotal2)){
			alert('받은 금액을 다시 확인해주십시오.');
		}
		
		if(Number(payTotal) >= Number(payTotal2)){
		
		$('#nmg').css('display','block');
		$('.nmg').css('display','block');
//		$('.document').css('display','none');
		$('#submitcash').css('display','inline-block');
		}
		
	});
	
	$(document).on('click', '.set-cancel', function(){
		$(".setModal").hide();
	})
	var localCnt = "";
	//포스기에 우측에 상품을 클릭 했을 때
	$(document).on( "click", ".pNameClick", function() {
		
		var menuId = $(".order-group").length + 1;
		var pName = $(this).attr('value');
		var pPrice = $(this).data('price');
		var pNumber = $(this).data('number');
		var pCnt = Number($(this).data('cnt'));
		var pMenu = $(this).data('menu');

		var $thisItem = $('#item-'+menuId);
		
		var tmplt ='';
			if($(this).data("category") == "burger"){//누른놈이 햄버거 일 때
				
				$(".burgerOrSet").show().attr('data-number',menuId).attr("data-menuname", pName);
				$(".burgerOrSet-content").show();// 세트인지 버거인지 선택 하는 모달
				$(".setSideList").hide();
				$(".setSelect").show();$(".sizeSelect").hide();
				
				
					tmplt = '<template>' +
					'	<div id="item-' + menuId + '" class="order-group">' +
					'		<div class="order-num">' + menuId + '</div>' +
					'		<ul class="order-item">'	+
					'			<li class="item-name" id="'+pName+''+menuId+'">' + pName +'</li>' +
					'			<li class="item-cnt">' + pCnt + '</li>' +
					'			<li class="item-price" data-price="'+pPrice+'">' + pPrice + '</li>' +
					'		</ul>' +
					'	</div>' +
					'</template>';
			
					localStorage.setItem("버거", pName);
					
					var $tmplt = $(tmplt);
					$("#orderList").append($tmplt.html());
				
				}else if($(this).data("category") != "burger") { // 누른놈이 햄버거가 아닐 때
						var uniqId = document.getElementById(""+pName+"");
						
						if(uniqId == null){
							var tmplt ='';
							tmplt = '<template>' +
							'	<div id="item-' + menuId + '" class="order-group">' +
							'		<div class="order-num">' + menuId + '</div>' +
							'		<ul class="order-item">'	+
							'			<li class="item-name"  id="'+pName+'">' + pName +'</li>' +
							'			<li class="item-cnt">' + pCnt + '</li>' +
							'			<li class="item-price" data-price="'+pPrice+'">' + pPrice + '</li>' +
							'		</ul>' +
							'	</div>' +
							'</template>';
							var $tmplt = $(tmplt);
							$("#orderList").append($tmplt.html());
						}else if(uniqId != null){
							var cnt = $("#"+pName+"").siblings(".item-cnt").text();
							cnt = Number(cnt) + 1;
							var a = '';
							a = Number(cnt) * Number(pPrice);
							$("#"+pName+"").siblings(".item-price").text(a);
							$("#"+pName+"").siblings(".item-cnt").text(cnt);
						}
						
							}
							
		menuItemPriceTotal();
					
		if ($(".menuDelete").length < 1) {
			$('.deleteUpdate').append('<li class="menuDelete" id="menuDelete">메뉴삭제</li>');
		}
	});
	// 세트를 선택 했을 때
	$(document).on('click', '#setSideSelect', function() { 
		$(".sizeSelect").show(); // 세트 사이드 리스트를 보여준다
		$(".setSelect").hide(); // 세트인지 버거인지 선택하는 영역은 숨긴다
		var menuName = $(".burgerOrSet").attr("data-menuname"); //진행중인 메뉴 이름 가져오기
		var menuId = $(".order-group").length;
		$("#"+menuName+""+menuId+"").text(menuName + "-SET").attr("id", menuName +"SET" + menuId);// 진행중인 메뉴에서 세트 클릭시 아이디에 세트 추가
		
		$(".burgerOrSet").data("setitem", "-SET");
	});
	//라지 사이즈 선택 했을 때
	$(document).on("click",".largeSizeSelect", function(){
		$(".sizeSelect").hide();$(".setSideList").show();//라지 선택 시 사이즈 선택 창 닫고 세트 선택 창 오픈
		$(".burgerOrSet").data("menusize", "-L");//라지사이즈 라는 상태
		var menuName = $(".burgerOrSet").data("menuname");//세트 진행 중인 놈에 메뉴 이름
		var menuPrice = $("#"+menuName+""+menuId+"").siblings(".item-price").text();//세트 진행 중인 놈에 메뉴 가격
		var largePrice = 800; // 라지 사이즈는 800원 추가
		largePrice = largePrice + Number(menuPrice);// 라지 사이즈는 800원 추가
		$("#"+menuName+""+menuId+"").siblings(".item-price").text(largePrice);//추가 한 금액 표시
		var setItem = $(".burgerOrSet").data("setitem");
		var menuId = $(".order-group").length;
		$("#"+menuName+"SET"+menuId+"").text(menuName + "-L" + setItem);
	});
	//노말 사이즈 선택 했을 때
	$(document).on("click",".normalSizeSelect", function(){
		$(".sizeSelect").hide();$(".setSideList").show();
	});
		//사이드 메뉴 골랐을 때
	$(document).on("click", ".setSideUl", function(){		
		var menuName = $(this).children(".setSideItem").text();//사이드 메뉴 누른 놈에 메뉴 이름
		var menuPrice = $(this).children("li").children(".setSidePrice").text();//사이드 메뉴 누른 놈에 메뉴 가격
		var menuId = $(".burgerOrSet").attr("data-number");
		localStorage.setItem("사이드", "set"+menuName);
		var tmplt = "";
		tmplt = '<div>' +
				'	<div class="null-item">'+"-"+'</div>' +
				'		<ul class="order-item">'	+
				'			<li class="item-name">' + menuName +'</li>' +
				'			<li class="item-cnt">' + "SET" + '</li>' +
				'			<li class="item-price" data-price="'+menuPrice+'">' + menuPrice + '</li>' +
				'		</ul>' +
				'</div>';
		
		var $tmplt = $(tmplt);
		$("#item-"+menuId+"").append($tmplt.html());
		
		menuItemPriceTotal();
		//선택 한 사이드가 양념감자이면 
		if(menuName == "양념감자"){
			$(".sideFlavorSelect").show();
			$(".setSideList").hide();
		}else{
			$(".setSideList").hide();$(".setDrinkList").show();
		}
	});
	$(document).on("click", ".flavor-item", function(){
		var flavorItem = $(this).text(); //양념감자 맛 선택 한 놈
		var menuId = $(".burgerOrSet").attr("data-number");
		
		var tmplt = "";
		tmplt = '<template>' +
				'	<div class="null-item">'+"-"+'</div>' +
				'		<ul class="order-item">'	+
				'			<li class="item-name">' + flavorItem +'</li>' +
				'			<li class="item-cnt">' + "" + '</li>' +
				'			<li class="item-price" >' + "0"+ '</li>' +
				'		</ul>' +
				'</template>';
		
		var $tmplt = $(tmplt);
		$("#item-"+menuId+"").append($tmplt.html());
		
		$(".sideFlavorSelect").hide();$(".setDrinkList").show();//맛 선택 창 숨기고 음료 선택 창 show
	})
	$(document).on("click", ".burgerPrev", function(){
		var localMenuName = localStorage.getItem("버거");
		var menuListTd = $("#"+localMenuName+"");
		
		menuListTd.parent().remove();
		$(".burgerOrSet").hide();$(".burgerOrSet-content").hide();
	})
	$(document).on("click", ".sidePrev", function(){
		var localMenuName = localStorage.getItem("사이드");
		var menuListTd = $("#"+localMenuName+"");
		localStorage.removeItem("사이드");
		menuListTd.parent().remove();
		$(".setDrinkList").hide();$(".setSideList").show();
	})
		$(document).on("click", ".sideFlavorPrev", function(){
		var localMenuName = localStorage.getItem("양념감자");
		var menuListTd = $("#"+localMenuName+"");
		localStorage.removeItem("양념감자");
		menuListTd.parent().remove();
		$(".sideFlavorSelect").hide();$(".setSideList").show();
	})
		//사이드 음료 골랐을 때
	$(document).on("click",".setDrinkUl", function(){
		var menuName = $(this).children(".setDrinkItem").text();//사이드 메뉴 누른 놈에 메뉴 이름
		var menuPrice = $(this).children("li").children(".setDrinkPrice").text();//사이드 메뉴 누른 놈에 메뉴 가격
		var menuId = $(".burgerOrSet").attr("data-number");
		var tmplt = "";
		
		tmplt = '<template>' +
				'	<div class="null-item">'+"-"+'</div>' +
				'		<ul class="order-item">'	+
				'			<li class="item-name">' + menuName +'</li>' +
				'			<li class="item-cnt">' + "SET" + '</li>' +
				'			<li class="item-price" data-price="'+menuPrice+'">' + menuPrice + '</li>' +
				'		</ul>' +
				'</template>';
		
		var $tmplt = $(tmplt);
		$("#item-" + menuId).append($tmplt.html());
		
		menuItemPriceTotal();
		
		$(".burgerOrSet").hide();$(".burgerOrSet-content").hide();
		$(".setSideList").show();$(".setDrinkList").hide();
	});
		//버거만을 선택했을 때 에는 모달 창 닫아버린다
	$(document).on("click","#setBurgerSelect", function(){
		$(".burgerOrSet").hide();$(".burgerOrSet-content").hide();$(".sizeSelect").hide();
		
	})
		//세트 or 버거 선택 창 닫기
	$(document).on("click",".burgerOrSetCancle", function(){
		$(".burgerOrSet").hide();$(".burgerOrSet-content").hide();
	})
	
//	$('.pNameClick').each( function(index, value) {
//		$(this).click( function() {
//		$(this).attr("id", "selected");
//		$(this).siblings().attr("id", "none");
//			});
//		});
	$(document).on( "click", ".order-group", function() {
		
		$(this).css("background-color", "red");
		$(this).attr("id", "menuListSelected");
		$(this).siblings().attr("id", "none");

		$(".order-group").each(function(){
			if($(this).attr("id") != "menuListSelected"){
				$(this).css("background-color", "#FBF2EF");
			}
		})
	});
	$(document).on( "mouseover", ".order-group", function() {
		if($(this).attr("id") != "menuListSelected"){
			$(this).css("background" , "#aaa");
		}
		
	});
	$(document).on( "mouseout", ".order-group", function() {
		if($(this).attr("id") != "menuListSelected"){
			$(this).css("background" , "#e9e9e9");
		}
	});
	$(document).on("click", ".chickenMenu", function(){
		$(".chicken").show();
		$(".burger").hide();
		$(".side").hide();
		$(".drink").hide();
	})
	$(document).on("click", ".burgerMenu", function(){
		$(".chicken").hide();
		$(".burger").show();
		$(".side").hide();
		$(".drink").hide();
	})
	$(document).on("click", ".sideMenu", function(){
		$(".chicken").hide();
		$(".burger").hide();
		$(".side").show();
		$(".drink").hide();
	})
	$(document).on("click", ".drinkMenu", function(){
		$(".chicken").hide();
		$(".burger").hide();
		$(".side").hide();
		$(".drink").show();
	})
	var modal = document.querySelector(".modal");
	var modalcash = document.querySelector(".modalcash"); 
	var triggercash = document.querySelector(".triggercash"); 
	var cancelButtoncash = document.querySelector("#cancelcash");
	
    cancelButtoncash.addEventListener("click", toggleModalcash); 
    
    $(document).on('click', ".menuAddModalCancle", function(){
		$(".modal").hide();$(".modal-content").hide();
	})
	$(document).on('click', ".setMenuModalCancel", function(){
		$(".setModal").hide();$(".set-modal-content").hide();
	})
	$(document).on('click', "#cancelcash", function(){
		$(".modalcash").hide();$(".modal-contentcash").hide();
	})
	
	$(document).on('click', "#setAdd", function(){
		$(".setModal").show(); $(".set-modal-content").show();
	});
    
    $(document).on('click', ".triggercash", function(){
		$(".modalcash").show(); $(".modal-contentcash").show();
		toggleModalcash();
	});
    function toggleModalcash() { 
 	   var orderListChild = document.getElementById("orderList");
 	   
 	   if(orderListChild.childElementCount == 0){
 			card2();
 			return;
 		}
 	   function card2(){
 			Swal.fire({
 			  position: 'center',
 			  type: 'error',
 			  title: '상품을 선택 해 주세요.',
 			  showConfirmButton: false,
 			  timer: 1000
 			});
 			
 		}
         modalcash.classList.toggle("show-modalcash"); 
         $('input[name=payTotal]').val($('.pTotal').text());
         
     }
//    $(document).on("click", "#menuDelete", function(){
//    	var menuId = $("#selected").data("number");
//    	$.ajax({
//		url : '/pos/delete',
//		type : "post",
//		data : {
//			"menuId" : menuId
//		},
//		success : function(data) {
//			location.reload();
//	}
//	});
//    })
});
function card(){
	 
    var payTotal = $('#pTotal').text();
    
    var rTime = new Date();
	    var regTime = rTime.getHours()+":";
	    regTime += rTime.getMinutes()+":";
	    regTime += rTime.getSeconds();
	    
    //추가 돼 있는 상품에 이름을 배열에 담는다
    $(".item-name").each(function(index, item){
    	menuNameArray.push($(this).text());
    })
    //추가 돼 있는 상품에 갯수를 배열에 담는다
    $(".item-cnt").each(function(index, item){
    	menuCntArray.push($(this).text());
    })
    
   var orderListChild = document.getElementById("orderList");
   
   if(orderListChild.childElementCount == 0){ // 리스트에 상품이 없으면 alert("상품을 선택해주세요")
	   effectiveness();
		return;
	}
   $.ajax({
		url : "/pos/orders",
		data : {"payTotal" : payTotal, "regTime":regTime},
		dataType : "JSON",
		type : "POST",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
		success : function(data) {
			if(data == 1){
				
				let timerInterval
				Swal.fire({
				  title: '결제중입니다.',
				  html: 'I will close in <strong></strong> seconds.',
				  timer: 1000, 
				  onBeforeOpen: ()=> { 
				    Swal.showLoading()
				    timerInterval = setInterval(() => {
				      Swal.getContent().querySelector('strong')
				        .textContent = Swal.getTimerLeft() 
				    }, 100)
				  }, 
				  onClose: ()=> { 
				    clearInterval(timerInterval)
				  }
				}).then((result)=> {
				  if (
				    result.dismiss === Swal.DismissReason.timer
				  ) {
				    선규();
				  }
				  card2();
				})
				
			}
		}
	});
  
function card2(){
	Swal.fire({
	  position: 'center',
	  type: 'success',
	  title: '결제가 완료되었습니다.',
	  showConfirmButton: false,
	  timer: 1500
	});
	
}
function effectiveness(){
	Swal.fire({
	  position: 'center',
	  type: 'error',
	  title: '상품을 선택 해 주세요.',
	  showConfirmButton: false,
	  timer: 1500
	});
	
}
}
 
function pDelete(menuId) {
	
	$.ajax({
		url : '/pos/delete',
		type : "post",
		data : {
			"menuId" : menuId
		},
		success : function(data) {
			location.reload();
	}
	});
}
function allRemove(){
	$(".order-group").each(function(){
		$(this).remove();
	})
	menuNameArray =[];
	menuCntArray = [];
	
	menuItemPriceTotal();
	localStorage.clear();
}
function menuRemove(){
	$("#menuListSelected").remove();
	menuItemPriceTotal();
}
function sumCount(menuName){
	var sum = Number($("[name='"+menuName+"']").siblings(".menuListCnt").text());
	sum = sum + 1;
	$("[name='"+menuName+"']").siblings(".menuListCnt").text(sum);
}	
function sumPrice(menuName){
	var cnt = document.getElementById(menuName).innerHTML;
	var price = $("[name='"+menuName+"']").siblings(".item-price").data("price");
	var priceSum = Number(cnt) * Number(price);
	$("[name='"+menuName+"']").siblings(".item-price").text(priceSum);
}
function menuCntUp(){
	var price = $("#menuListSelected").find(".item-price").text();
	var tot = $("#menuListSelected").find(".item-cnt").text();
	var cnt = Number(tot) + 1;
	$("#menuListSelected").find(".item-cnt").text(cnt);
	menuItemTotal(cnt);
	 menuItemPriceTotal();
}
function menuCntDown(){
	var price = $("#menuListSelected").find(".item-price").text();
	var tot = $("#menuListSelected").find(".item-cnt").text();
	var cnt = Number(tot) - 1;
	if($("#menuListSelected").find(".item-cnt").text() > 1){
		$("#menuListSelected").find(".item-cnt").text(cnt);	
	}
	menuItemTotal(cnt);
	 menuItemPriceTotal();
}
function menuItemTotal(cnt){
	var itemPrice = $("#menuListSelected").find(".item-price").attr("data-price");
	var total = itemPrice * cnt;
	$("#menuListSelected").find(".item-price").text(total);
	if($("#menuListSelected").find(".item-price").text() == 0 ){
		$("#menuListSelected").find(".item-price").text(itemPrice);		
	}
}

function menuItemPriceTotal(){
	var total = 0;
	var tot = 0;
		$(".item-price").each(function(index){
			total += Number($(this).text());
	});
		pTotal(total);
}
function pTotal(total){
	$(".pTotal").text(total);
}
function send(){
	
   var payTotal = $('input[name=payTotal]').val();
   var input = $('input[name=payTotal2]').val();
   var nmg = $('input[name=nmg]').val();
   var sum = input - nmg;
   
   var rTime = new Date();
   var regTime = rTime.getHours()+":";
   regTime += rTime.getMinutes()+":";
   regTime += rTime.getSeconds();
   
   //추가 돼 있는 상품에 이름을 배열에 담는다
   $(".item-name").each(function(index, item){
   	menuNameArray.push($(this).text());
   })
   //추가 돼 있는 상품에 갯수를 배열에 담는다
   $(".item-cnt").each(function(index, item){
   	menuCntArray.push($(this).text());
   })
    if( payTotal == sum){
    	$.ajax({
     		url : "/pos/orders",
     		data : {"payTotal" : payTotal, "regTime":regTime},
     		dataType : "JSON",
     		type : "POST",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
			success : function(data) {
				alert("결제가 완료되었습니다.");
				
				if(data == 1){
					선규();
				}
			}
     	});
   	    	return false;
   }
   
     if(payTotal != sum){
	   alert('일치하지 않습니다. 다시 확인해주십시오.');
	   return true;  
   }  
}

	
	 
	 function 선규(){
		 //추가 돼 있는 상품에 이름을 배열에 담는다
			$.ajax({
	     		url : "/pos/menuAdd",
	     		data : {"menuNameArray" : menuNameArray, "menuCntArray" : menuCntArray},
	     		dataType : "JSON",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
				success : function(data) {
					 
					if(data == 1){
						
						setTimeout(window.location.reload(), 2000);
					}
				}
	     	});
	 }  	
	
