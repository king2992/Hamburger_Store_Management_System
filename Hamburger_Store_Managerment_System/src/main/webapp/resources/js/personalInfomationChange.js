
$(document).ready(function(){
	$("#myModal").hide();
	
	$(".pwChange").on("click", function(){
		$("#myModal").show();
	})
	$(".close").on("click", function(){
		$("#myModal").hide();
	})
	
	$("#userInfoUpdate").on("click", function(){
		var userPw = $(".userPw").val();
		var userPhone1 = $("[name = userPhone1]").val();
		var userPhone2 = $("[name = userPhone2]").val();
		var userName = $(".userName").val();
		if($(".userPw").val() == ""){
			alert("비밃번호를 입력 해 주세요.");
			$(".userPw").focus();
		}else if($(".userPhone").val() == ""){
			alert("전화번호를 입력 해 주세요.");
			$(".userPhone").focus();
		}else if($(".userName").val() == ""){
			alert("이름을 입력 해 주세요.");
			$(".userName").focus();
		}else{
			$.ajax({
				data : {"nowPw" : userPw},
				url : "/user/nowPwCheck",
				success : function(data){
					if(data == 1){
						$.ajax({
							url : "/user/userInfoUpdate",
							data :{"userPhone1":userPhone1,"userPhone2":userPhone2, "userName":userName},
							success : function(){
								if(data == 1){
									alert("개인정보가 변경 되었습니다. 다시 로그인 하여 주시기 바랍니다.");
									window.location.href = "/";
								}
							}
						})
					}else{
						alert("비밀번호가 일치하지 않습니다.");
						$(".userPw").val("");
						$(".userPw").focus("");
					}
				}
			})
		}
	});
	$(".pwUpSubmit").on("click", function(){
		var nowPw = $(".nowPw").val(); 
		var newPw = $(".newPw").val();
		if($(".nowPw").val() == ""){
			alert("현재 비밀번호를 입력 해 주세요.");
			$(".nowPw").focus();
		}else if($(".newPw").val() == ""){
			alert("새 비밀번호를 입력 해 주세요.");
			$(".newPw").focus();
		}else if($(".newPwCheck").val() == ""){
			alert("새 비밀번호 확인을 입력 해 주세요.");
			$(".newPwCheck").focus();
		}else if($(".newPw").val() != $(".newPwCheck").val()){
			alert("비밀번호가 일치 하지 않습니다.");
			$(".newPw").val("");$(".newPwCheck").val("");$(".newPw").focus();
		}else{
			$.ajax({
				data : {"nowPw" : nowPw},
				url : "/user/nowPwCheck",
				success : function(data){
					console.log(data);
					if(data == 1){
						$.ajax({
							data : {"userPassword" : newPw},
							url : "/user/userPwUpdate",
							success : function(data){
								if(data == 1){
									alert("비밀번호가 변경 되었습니다.");
									$(".nowPw").val("");$(".newPw").val("");$(".newPwCheck").val("");$(".userPw").val("");
									$("#myModal").hide();
								}
							}
						})
						
					}else {
						alert("현재 비밀번호가 일치 하지 않습니다.");
					}
					
				}
			})
		}
		
		
		
	})
	$(document).on("click", "#userPayCardUpdate", function(){
		cardAddPopUpOpen();
	})
	function cardAddPopUpOpen(){
		var url = "/user/cardAdd";
		var winWidth = 508;
		var winHeight = 515;
		var popupOption = "width="+winWidth+", height="+winHeight;
		window.open(url,"",popupOption);
	}
	
	
	
});