/**
 * 커뮤니티 게시판 view 
 */

window.onload = function() {
	var likeArea = $('#likeArea');
	var a = "";
	var b = "";
	var c = "";
// 처음 출력 
	var likeCnt = $('#likeCnt').val();
	a += '<div class="view_like" id="likeBtn" data-number="${view.number}>'+
	'<img id="likeImg">'+
	'<span>'+'좋아요'+'</span>'+ 
	'<span>'+Number(likeCnt)+'</span>'+
	'</div>';
	likeArea.html(a);
// 	$('#like').attr('src','/resources/images/unlike.png');
	//$('#likeBtn').children('img').attr('src','/resources/images/unlike.png');
	
	
	b += '<div class="view_like" id="likeDel" data-number="${view.number}>'+
	'<img src="/resources/images/unlike.png">'+
	'<span>'+'좋아요 취소'+'</span>'+ 
	'<span>'+Number(likeCnt)+'</span>'+
	'</div>';
	
	c += '<div class="view_like" id="unLikeBtn" data-number="${view.number}>'+
	'<img id="like_">'+
	'<span>'+'좋아요 '+'</span>'+ 
	'<span>'+Number(likeCnt)+'</span>'+
	'</div>';
	var number = $('#view_no').val();
	$.ajax({
		url : '/review/likeFunc',
		data : {'number':Number(number)},
		success : function(data) {
			if (data.likeCheck == 1) {
				likeArea.html(b);
			} else if(data.likeCheck == 0){
				likeArea.html(c);
			}
		}
	});
	
};

$(document).ready(function(){
    $("#header").load("/include/header");
    var likeCnt = $('#likeCnt').val();
    $(document).on('click', "#likeBtn",function(){
    	
// 		var number = $('#likeBtn').data('number');
		var likeArea = $('#likeArea');
		var b ="";
		b += '<div class="view_like" id="likeDel" data-number="${view.number}>'+
		'<img src="/resources/images/unlike.png">'+
		'<span>'+'좋아요 취소'+'</span>'+ 
		'<span>'+Number(likeCnt)+'</span>'+
		'</div>';
	var number = $('#view_no').val();
    	$.ajax({
    		url : "/review/likeAdd",
    		data : {"number":Number(number)},
    		success : function(data){
    			if (data == 1) {
    				likeArea.html(b);
    			};
    		}
    	});
    	
    });
    
    $(document).on('click','#likeDel', function(){
    	var likeArea = $('#likeArea');
    	var c ="";
    	c += '<div class="view_like" id="unLikeBtn" data-number="${view.number}>'+
    	'<img id="like_">'+
    	'<span>'+'좋아요 '+'</span>'+ 
    	'<span>'+Number(likeCnt)+'</span>'+
    	'</div>';
    	
    	var number = $('#view_no').val();
    	$.ajax({
    		url : '/review/likeDel',
    		data : {'number':Number(number)},
    		success : function(data) {
    			if (data == 0) {
    				likeArea.html(c);
    			}
    		}
    	});
    });
    
    $(document).on('click','#unLikeBtn', function(){
    	var likeArea = $('#likeArea');
    	var b="";
    	b += '<div class="view_like" id="likeDel" data-number="${view.number}>'+
    	'<img src="/resources/images/unlike.png">'+
    	'<span>'+'좋아요 취소'+'</span>'+ 
    	'<span>'+Number(likeCnt)+'</span>'+
    	'</div>';
    	var number = $('#view_no').val();
    	$.ajax({
    		url : '/review/likeRun',
    		data : {'number':Number(number)},
    		success : function(data) {
    			if (data == 1) {
    				likeArea.html(b);
    			}
    		}
    	});
    });
 });