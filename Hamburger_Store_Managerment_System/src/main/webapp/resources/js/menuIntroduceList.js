$(document).ready(function(){
	var adminEmail = $("#adminEmail").val();
	var adminId = $("#adminId").val();
	
	$(document).on("click", "#emailAuth", function(){ // 이메일 인증 페이지
		location.href="/admin/afterEmailAuth?adminEmail="+adminEmail;
	})
	$(document).on("click", "#myBtn", function(){
		$(".withdrawalModal").show(); //회원탈퇴 모달
	})
	$(document).on("click", ".withdrawal-close", function(){
		 $(".withdrawalModal").hide(); //회원탈퇴 모달 닫기
	})
	$(document).on("click","#businessAuth", function(){
		var firstBuNum = $("#firstBuNum").val();
		var centerBuNum = $("#centerBuNum").val();
		var lastBuNum = $("#lastBuNum").val();
		if($("#notAuth").text() == "미등록"){
			$.ajax({
				url :"/admin/businessAuth",
				data : {"firstBuNum" : firstBuNum, "centerBuNum" : centerBuNum, "lastBuNum":lastBuNum},
				success : function(data){
					if(data == 1){
						alert("인증되었습니다.");
						location.reload();
					}
					if(data == 0){
						alert("없는 등록번호 입니다. 다시 확인해주세요.");
					}
				}
			})
		}else if($("#checkAuth").text() == "등록"){
			alert("이미 인증 하셨습니다.");
		}
		
	})
});