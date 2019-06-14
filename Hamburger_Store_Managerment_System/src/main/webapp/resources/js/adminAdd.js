$(document).ready(function(){
//	$(document).on("click", "#adminAdd", function(){
//		adminAddPopUpOpen();
//		})
//		function adminAddPopUpOpen(){// 관리자 회원가입 팝업
//			var url = "/admin/adminAdd";
//			var winWidth = 800;
//			var winHeight = 900;
//			var popupOption = "width="+winWidth+", height="+winHeight;
//			window.open(url,"",popupOption);
//		}
	$(document).on("click", "#idCk", function(){ //관리자 아이디 중복 체크
		var adminId = $("#adminId").val();
		$.ajax({
			url : "/admin/adminIdCk",
			data : {"adminId":adminId},
			success : function(data){
				if(data == 1){
					alert("사용중인 아이디 입니다.");
				}else if(data == 0){
					alert("사용 가능 한 아이디 입니다.");
				}
			}
		})
	})
	$(document).on("click", ".adminSignUp", function(){ // 관리자 회원가입 
		$("#frm").submit();
		 	alert("마이페이지 > 본인인증을 진행해주세요.");
	})
});