	var userId = "${sessionScope.user}";
	var socket = io("http://localhost:84");
	
	var menuNameArray = new Array();
	var menuCntArray = new Array();
	$(document).ready(function() {
		$(".chicken").show();
		$(".burger").hide();
		$(".side").hide();
		$(".drink").hide();
		$(".setModal").hide();
		//msg_process를 클릭할 때
		$("#submitcash").click(function() {
			//소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
			socket.emit("send_msg", $("#msg").text());
			//#msg에 벨류값을 비워준다.
			$("#msg").text("");
		});
		//소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
		socket.on('send_msg', function(msg) {
			//div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
			$('<div></div>').text('새로운 주문이 있습니다.').appendTo("#chat_box");
		});
		$(document).on('click', ".menuAddModalCancle", function(){
			$(".modal").hide();$(".modal-content").hide();
		})
		$(document).on('click', ".setMenuModalCancel", function(){
			$(".setModal").hide();$(".set-modal-content").hide();
		})
		$(document).on("click",".document",function(){
			var payTotal = document.getElementById('payTotal').value;
			var payTotal2 = document.getElementById('payTotal2').value;
			
			document.getElementById('nmg').value = payTotal - payTotal2;
			
			if(payTotal < payTotal2){
				alert('받은 금액을 다시 확인해주십시오.');
			}
			
			if(payTotal >= payTotal2){
			
			$('#nmg').css('display','block');
			$('.nmg').css('display','block');
			$('.modal-contentcash').css('height','430px');
			$('.document').css('display','none');
			$('#submitcash').css('display','inline-block');
			}
			
		});
		
		$(document).on('click', "#setAdd", function(){
			$(".setModal").show();
		});
		$(document).on('click', '.set-cancel', function(){
			$(".setModal").hide();
		})
		$(document).on( "click", ".pNameClick", function() {
			var td1 = document.createElement("td");
			var td2 = document.createElement("td");
			var td3 = document.createElement("td");
			var td4 = document.createElement("td");
			var tr1 = document.createElement("tr");
			var menuName = $(this).attr("value");
			tr1.setAttribute("class", "menuListTr");
			tr1.style = "cursor:pointer";
			td1.innerHTML = $(this).attr("data-number");
			td2.innerHTML = $(this).attr("value");
			td2.setAttribute("name",menuName);
			td2.setAttribute("data-menuName", $(this).attr("value"));
			td2.setAttribute("class","menuListName");
			td3.setAttribute("id", menuName);
			td3.innerHTML = $(this).attr("data-cnt");
			td3.setAttribute("class", "menuListCnt");
			td4.innerHTML = $(this).attr("data-price");
			td4.setAttribute("class", "item-price");
			td4.setAttribute("data-price",$(this).attr("data-price"));
			
				if($("[name='"+menuName+"']").length == 0 ){
					$("#orderList").append(tr1);
					tr1.append(td1);
					tr1.append(td2);
					tr1.append(td3);
					tr1.append(td4);
				}else{
					var sum = 1;
					sumCount(menuName);
					sumPrice(menuName);
				}
				
				
			var menuId = $(this).attr('data-number');
						
			if ($(".menuDelete").length < 1) {
				$('.deleteUpdate').append('<li class="menuDelete" id="menuDelete" >메뉴삭제</li>');
			}
			$("#menuDelete").attr("onclick", "pDelete('"+menuId+"')");
			 menuItemPriceTotal();
		});

	$('.pNameClick').each( function(index, value) {
			$(this).click( function() {
				$(this).attr("id", "selected");
				$(this).siblings().attr("id", "none");
					});
		});
	$(document).on( "click", ".menuListTr", function() {
		
		$('.menuListTr').each( function(index) { 
			$(this).click( function() {
				$(this).css("background-color", "red");
				$(this).attr("id", "menuListSelected");
				$(this).siblings().attr("id", "none");
				
			})
		})
	});
	$(document).on( "mouseenter", ".menuListTr", function() {
		
			
			console.log($(event.target).parent().css("background-color"));
		if($(event.target).parent().css("background-color") == "rgb(255, 0, 0)"){
			event.target.parentNode.setAttribute("style", "background-color:red");
		}else if($(event.target).parent().css("background-color") != "rgb(255, 0, 0)"){
			event.target.parentNode.setAttribute("style", "background-color:blue");
		}
		
	});
	$(document).on( "mouseleave", ".menuListTr", function() {
		
		if(event.target.parentNode.getAttribute("id") != "menuListSelected" ){
			event.target.parentNode.setAttribute("style", "background-color: #FBF2EF");
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
	var trigger = document.querySelector("#trigger");
	var closeButton = document.querySelector(".close-button");
	var cancelButton = document.querySelector("#cancel");
	var cardCash = document.querySelector(".cardCash");
	var modalcash = document.querySelector(".modalcash"); 
	var triggercash = document.querySelector(".triggercash"); 
	var closeButtoncash = document.querySelector(".close-buttoncash"); 
	var cancelButtoncash = document.querySelector("#cancelcash");
	
	triggercash.addEventListener("click", toggleModalcash); 
    closeButtoncash.addEventListener("click", toggleModalcash); 
    cancelButtoncash.addEventListener("click", toggleModalcash); 
    //window.addEventListener("click", windowOnClickcash); 
    
    trigger.addEventListener("click", toggleModal);
	closeButton.addEventListener("click", toggleModal);
	cancel.addEventListener("click", toggleModal);
	//window.addEventListener("click", windowOnClick);
	
	function toggleModal() {
		modal.classList.toggle("show-modal");
	}

	function windowOnClick(event) {
		if (event.target === modal) {
			toggleModal();
		}
	}

	   //console.log(modal);
		
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
	        
	        //추가 돼 있는 상품에 이름을 배열에 담는다
	        $(".menuListName").each(function(index, item){
	        	menuNameArray.push($(this).text());
	        })
	        //추가 돼 있는 상품에 갯수를 배열에 담는다
	        $(".menuListCnt").each(function(index, item){
	        	menuCntArray.push($(this).text());
	        })
			
	    }
	   function windowOnClickcash(event) { 
		   
	        if (event.target === modalcash) { 
	            toggleModalcash(); 
	        } 
	    }
	   
	});
	function card(){
		 
	 	//modalcash.classList.toggle("show-modalcash"); 
        //$('input[name=payTotal]').val($('.pTotal').text());
		
        var payTotal = $('#pTotal').text();
        
        var rTime = new Date();
 	    var regTime = rTime.getHours()+":";
 	    regTime += rTime.getMinutes()+":";
 	    regTime += rTime.getSeconds();
 	    
        //추가 돼 있는 상품에 이름을 배열에 담는다
        $(".menuListName").each(function(index, item){
        	menuNameArray.push($(this).text());
        })
        //추가 돼 있는 상품에 갯수를 배열에 담는다
        $(".menuListCnt").each(function(index, item){
        	menuCntArray.push($(this).text());
        })
        
	   var orderListChild = document.getElementById("orderList");
	   
	   if(orderListChild.childElementCount == 0){
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
				msgAnimate();
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
		$(".menuListTr").each(function(){
			$(this).remove();
		})
		menuItemPriceTotal();
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
		var tot = $("#menuListSelected").find(".menuListCnt").text();
		var cnt = Number(tot) + 1;
		$("#menuListSelected").find(".menuListCnt").text(cnt);
		menuItemTotal(cnt);
		 menuItemPriceTotal()
	}
	function menuCntDown(){
		var price = $("#menuListSelected").find(".item-price").text();
		var tot = $("#menuListSelected").find(".menuListCnt").text();
		var cnt = Number(tot) - 1;
		if($("#menuListSelected").find(".menuListCnt").text() > 1){
			$("#menuListSelected").find(".menuListCnt").text(cnt);	
		}
		menuItemTotal(cnt);
		 menuItemPriceTotal()
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
			//total = Number(total) + Number($(this).text());
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
	   
	    if( payTotal == sum){
	    	$.ajax({
	     		url : "/pos/orders",
	     		data : {"payTotal" : payTotal, "regTime":regTime},
	     		dataType : "JSON",
	     		type : "POST",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
				success : function(data) {
					alert("결제가 완료되었습니다.");
					msgAnimate();
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
	
		 function msgAnimate(){
			  $("#chat_box").animate({
		 			"color" : "#e3e3e3", "font-size" : "18px"
		 		},1000) .animate({"color":"#333333", "font-size": "16px"},1000);
		 }
		 
		 function 선규(){
			
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
	