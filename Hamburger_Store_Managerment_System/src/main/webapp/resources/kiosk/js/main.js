/**
 Web Kiosk First Screen * 
 */

function chicken() {
	alert("치킨리스트");
}

function coffee() {
	alert("커피리스트");
}

function side() {
	alert("사이드리스트");
}

function payment() {
	alert("결제완료");
}

function cancel() {
	alert("결제취소");
}

$(document).ready(function(){
    $('#hamburger_list_btn').click(function(){
     if($('.hamburger_list').css("display") == 'none'){
         $('.hamburger_list').css("display", "block");
     } else {
         $('.hamburger_list').css("display", "none");
     }
    });
    
    $('#chicken_list_btn').click(function(){
   	 if($('.chicken_list').css("display") == 'none') {
   		 $('.chicken_list').css("display", "block");
   	 } else {
   		 $('.chicken_list').css("display","none");
   	 }
    });   
});