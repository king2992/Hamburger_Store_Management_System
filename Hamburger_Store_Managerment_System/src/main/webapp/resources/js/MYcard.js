
$(document).ready(function(){
	
	$("#MyCard").on("click", function(){
	$("#MYcardModal").css('opacity','1');
	$("#MYcardModal").css('visibility','visible');
	$("#MYcardModal").css('display','block');
	
	})
	$(".cardDelete").on("click", function(){
		$("#MYcardModal").css('display','none');
		$("#personalInfomationChange").css('display','block');
	})
	
});