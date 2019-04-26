
function goTicketing() {//예매 테이블로 값이 들어가는 부분
	var formValue = document.formValue;
	var obj = new Object();
	
	obj.id = formValue.id.value;
	obj.seatName = formValue.seatName.value;
	obj.ticketPrice = formValue.ticketPrice.value;
	obj.reservedDate = formValue.reservedDate.value;
	obj.finishTime = formValue.finishTime.value;
	obj.reservedTime = formValue.reservedTime.value;
	console.log(obj);
	$.ajax({
		url : "/seatReservation/ticketingSuccess",
		type : "POST",
		data : obj,
		dataType : "json",
		success : function(data) {
			if (data == 1) {
				location.href = "/seatReservation/ticketingSuccess2";

			}
		}

	});
	var reservationList = new Object();
	
	reservationList.seatName = formValue.seatName.value;
	reservationList.reservedDate = formValue.reservedDate.value;
	reservationList.finishTime = formValue.finishTime.value;
	reservationList.reservedTime = formValue.reservedTime.value;
	reservationList.ticketPrice = formValue.ticketPrice.value;
	reservationList.timeKey = formValue.reservedDate.value + formValue.reservedTime.value;
/** 삭제예정
   $.ajax({
		
		url : "/seatReservation/reservationTimeInsert",
		type : "POST",
		data : reservationList,
		dataType : "json",
		success : function(data){
		}
	});
	*/
}

var today = new Date();
var date = new Date();
var spanArray = new Array;
var seatPriceArray = new Array;
var priceSum = 0;
var priceArray = new Array;

function burgerListBlock(){
	$(".burgerList").css("display", "flex");
	
		if($(".chickenList").css("display") == "flex"){
			$(".chickenList").css("display", "none");	
			
		}else if($(".sideMenuList").css("display") == "flex"){
			$(".sideMenuList").css("display", "none");	
			
		}else if($(".drinkMenuList").css("display") == "flex"){
			$(".drinkMenuList").css("display", "none");	
		}
}
function sideMenuListBlock(){
	$(".sideMenuList").css("display", "flex");
	
	if($(".chickenList").css("display") == "flex"){
		$(".chickenList").css("display", "none");
		
	}else if($(".burgerList").css("display") == "flex"){
		$(".burgerList").css("display", "none");	
		
	}else if($(".drinkMenuList").css("display") == "flex"){
		$(".drinkMenuList").css("display", "none");	
		
	}
}
function chickenBlock(){
	$(".chickenList").css("display", "flex");
	
	if($(".sideMenuList").css("display") == "flex"){
		$(".sideMenuList").css("display", "none");	
		
	}else if($(".burgerList").css("display") == "flex"){
		$(".burgerList").css("display", "none");	
		
	}else if($(".drinkMenuList").css("display") == "flex"){
		$(".drinkMenuList").css("display", "none");	
		
	}
}
function drinkMenuListBlock(){
	$(".drinkMenuList").css("display", "flex");
	
	if($(".sideMenuList").css("display") == "flex"){
		$(".sideMenuList").css("display", "none");
		
	}else if($(".burgerList").css("display") == "flex"){
		$(".burgerList").css("display", "none");	
		
	}else if($(".chickenList").css("display") == "flex"){
		$(".chickenList").css("display", "none");	
	}
}

//function leftBoxDisplayNone(e){
//	$("#calendar").css("display", "none");
//	console.log("gd");
//	var orderListUl = document.getElementById("orderListUl");
//	var imgCloneNode = event.target.cloneNode(true); //선택한 놈을 복사
//	
//	var orderListLi = document.createElement("li");
//	orderListLi.setAttribute("class", "orderListLiClass");
//	
//	orderListLi.innerHTML = "<button type='button' onclick='menuDelete()'>" + "X" + "</button>";
//
//	orderListUl.appendChild(orderListLi).appendChild(imgCloneNode);
//}



function menuDelete(){
	event.target.parentNode.remove();

}
window.onload = function(){
	var chicken = document.getElementById("chickenList");
	var burger = document.getElementById("burgerList");
	var sideMenu = document.getElementById("sideMenuList");
	var drink = document.getElementById("drinkMenuList");
	var menuPriceArray = new Array();
	var menuNameArray = new Array();
	chicken.addEventListener('click', function(event){
		
		var menuName = event.target.getAttribute("value");
		var menuPrice = event.target.getAttribute("data-code");
		
		$(".menuName").each(function(){
			menuNameArray.push($(this).attr("value"));
		});
		
		var i = 0;
			
//		while(i <= menuNameArray.length){
//			if(menuNameArray[i] == menuName){
//				alert("이미 등록 된 상품입니다.");
//				break;
//			}else{
//				chickenAdd();
//			}
//			i++;
//		}
		
		for(var i = 0; i <= menuNameArray.length; i++ ){
			if(menuNameArray[i] == menuName){
				alert("이미 등록 된 상품입니다.");
			}
		}
		
		
		
		function chickenAdd(){
			
		
				if(event.target.tagName == "IMG"){
					
					$("#calendar").css("display", "none");
					
					var orderListUl = document.getElementById("orderListUl");
					
					var imgSrc = event.target.getAttribute("src"); 
					
					var imgTag = document.createElement("img");
					imgTag.setAttribute("src", imgSrc);
					
					var orderListLiParent = document.createElement("ul");
					orderListLiParent.innerHTML = "<button type='button' onclick='menuDelete()'>" + "X" + "</button>";
					var orderListLi = document.createElement("li");
					orderListLi.setAttribute("class", "orderListLiClass");
					
					var menuNameNode = document.createElement("li");
					menuNameNode.innerHTML = "상품명 : " + menuName;
					menuNameNode.setAttribute("class","menuName");
					menuNameNode.setAttribute("value", menuName);
					
					var menuPriceNode = document.createElement("li");
					menuPriceNode.innerHTML = "가격 : " + menuPrice;
					menuPriceNode.setAttribute("class", "menuPrice");
					menuPriceNode.setAttribute("value", menuPrice);
					
					menuPriceArray.push(menuPrice);
					
					var menuCount = document.createElement("li");
					menuCount.innerHTML = "수량 : " + "1" ;
					menuCount.setAttribute("class","menuCount");
					menuCount.setAttribute("value", "1");
					
					orderListUl.appendChild(orderListLiParent);
					orderListLiParent.appendChild(orderListLi).appendChild(imgTag);
					orderListLiParent.appendChild(menuNameNode);
					orderListLiParent.appendChild(menuPriceNode);
					orderListLiParent.appendChild(menuCount);
				}
		}
	},false);
	burger.addEventListener('click', function(event){
		if(event.target.tagName == "IMG"){
			var menuName = event.target.getAttribute("value");
			var menuPrice = event.target.getAttribute("data-code");
			
			$("#calendar").css("display", "none");
			
			var orderListUl = document.getElementById("orderListUl");
			
			var imgSrc = event.target.getAttribute("src"); 
			
			var imgTag = document.createElement("img");
			imgTag.setAttribute("src", imgSrc);
			
			var orderListLiParent = document.createElement("ul");
			orderListLiParent.innerHTML = "<button type='button' onclick='menuDelete()'>" + "X" + "</button>";
			var orderListLi = document.createElement("li");
			orderListLi.setAttribute("class", "orderListLiClass");
			
			var menuNameNode = document.createElement("li");
			menuNameNode.innerHTML = "상품명 : " + menuName;
			menuNameNode.setAttribute("class","menuName");
			menuNameNode.setAttribute("value", menuName);
			
			var menuPriceNode = document.createElement("li");
			menuPriceNode.innerHTML = "가격 : " + menuPrice;
			menuPriceNode.setAttribute("class", "menuPrice");
			menuPriceNode.setAttribute("value", menuPrice);
			
			menuPriceArray.push(menuPrice);
			
			var menuCount = document.createElement("li");
			menuCount.innerHTML = "수량 : " + "1" ;
			menuCount.setAttribute("class","menuCount");
			menuCount.setAttribute("value", "1");
			
			orderListUl.appendChild(orderListLiParent);
			orderListLiParent.appendChild(orderListLi).appendChild(imgTag);
			orderListLiParent.appendChild(menuNameNode);
			orderListLiParent.appendChild(menuPriceNode);
			orderListLiParent.appendChild(menuCount);
		}
	},false);	
	sideMenu.addEventListener('click', function(event){
		if(event.target.tagName == "IMG"){
			var menuName = event.target.getAttribute("value");
			var menuPrice = event.target.getAttribute("data-code");
			
			$("#calendar").css("display", "none");
			
			var orderListUl = document.getElementById("orderListUl");
			
			var imgSrc = event.target.getAttribute("src"); 
			
			var imgTag = document.createElement("img");
			imgTag.setAttribute("src", imgSrc);
			
			var orderListLiParent = document.createElement("ul");
			orderListLiParent.innerHTML = "<button type='button' onclick='menuDelete()'>" + "X" + "</button>";
			var orderListLi = document.createElement("li");
			orderListLi.setAttribute("class", "orderListLiClass");
			
			var menuNameNode = document.createElement("li");
			menuNameNode.innerHTML = "상품명 : " + menuName;
			menuNameNode.setAttribute("class","menuName");
			menuNameNode.setAttribute("value", menuName);
			
			var menuPriceNode = document.createElement("li");
			menuPriceNode.innerHTML = "가격 : " + menuPrice;
			menuPriceNode.setAttribute("class", "menuPrice");
			menuPriceNode.setAttribute("value", menuPrice);
			
			menuPriceArray.push(menuPrice);
			
			var menuCount = document.createElement("li");
			menuCount.innerHTML = "수량 : " + "1" ;
			menuCount.setAttribute("class","menuCount");
			menuCount.setAttribute("value", "1");
			
			orderListUl.appendChild(orderListLiParent);
			orderListLiParent.appendChild(orderListLi).appendChild(imgTag);
			orderListLiParent.appendChild(menuNameNode);
			orderListLiParent.appendChild(menuPriceNode);
			orderListLiParent.appendChild(menuCount);
		}
	},false);
	drink.addEventListener('click', function(event){
		if(event.target.tagName == "IMG"){
			var menuName = event.target.getAttribute("value");
			var menuPrice = event.target.getAttribute("data-code");
			
			$("#calendar").css("display", "none");
			
			var orderListUl = document.getElementById("orderListUl");
			
			var imgSrc = event.target.getAttribute("src"); 
			
			var imgTag = document.createElement("img");
			imgTag.setAttribute("src", imgSrc);
			
			var orderListLiParent = document.createElement("ul");
			orderListLiParent.innerHTML = "<button type='button' onclick='menuDelete()'>" + "X" + "</button>";
			var orderListLi = document.createElement("li");
			orderListLi.setAttribute("class", "orderListLiClass");
			
			var menuNameNode = document.createElement("li");
			menuNameNode.innerHTML = "상품명 : " + menuName;
			menuNameNode.setAttribute("class","menuName");
			menuNameNode.setAttribute("value", menuName);
			
			var menuPriceNode = document.createElement("li");
			menuPriceNode.innerHTML = "가격 : " + menuPrice;
			menuPriceNode.setAttribute("class", "menuPrice");
			menuPriceNode.setAttribute("value", menuPrice);
			
			menuPriceArray.push(menuPrice);
			
			var menuCount = document.createElement("li");
			menuCount.innerHTML = "수량 : " + "1" ;
			menuCount.setAttribute("class","menuCount");
			menuCount.setAttribute("value", "1");
			
			orderListUl.appendChild(orderListLiParent);
			orderListLiParent.appendChild(orderListLi).appendChild(imgTag);
			orderListLiParent.appendChild(menuNameNode);
			orderListLiParent.appendChild(menuPriceNode);
			orderListLiParent.appendChild(menuCount);
		}
	},false);	
}


