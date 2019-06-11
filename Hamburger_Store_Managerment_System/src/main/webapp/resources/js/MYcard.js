$(document).ready(function(){
	
	$("#MyCard").on("click", function(){
	$("#MYcardModal").css('opacity','1');
	$("#MYcardModal").css('visibility','visible');
	$("#MYcardModal").css('display','block');
	
	})
//	$(".cardDelete").on("click", function(){
//		$("#MYcardModal").css('display','none');
//		$("#personalInfomationChange").css('display','block');
//	})
	$(document).on("click", "#cardDelete", function(){
			var userId = $(".MYcardName").text();
			$.ajax({
				data : {"userId" : userId},
				url : "/user/cardDelete",
				success : function(data){
					if(data == 1){
						alert("삭제 되었습니다.");
						window.location.reload();
					}
				}
			})
		})
});