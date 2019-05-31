
$(document).ready(function(){
	
		$(document).on("click", "#cardAdd", function(){
			
			var bankName = $("[name=bankName]").val();
			var cardNum = $("[name=cardNum]").val();
			var validityMonth = $("[name=validityMonth]").val();
			var validityYears = $("[name=validityYears]").val();
			var securityCode = $("[name=securityCode]").val();
			var cardPw = $("[name=cardPw]").val();
			
			if(localStorage.getItem("등록가능") == "등록가능"){
				$.ajax({
					url : "/user/payInfoAdd",
					data : {"bankName" : bankName, "cardNum":cardNum, "validityMonth": validityMonth,"validityYears":validityYears,
						"securityCode" : Number(securityCode), "cardPw":cardPw},
					success : function(data){
						if(data == 1){
							
							alert("카드가 등록되었습니다.");
							
							self.close();
							}
						}
					})
				localStorage.clear();
			} else {
				alert("카드를 조회해주세요.");
				return;
			}
			
			})
		})
		$(document).on("click", "#cardCheck", function(){
			var bankName = $("[name=bankName]").val();
			var cardNum = $("[name=cardNum]").val();
			var validityMonth = $("[name=validityMonth]").val();
			var validityYears = $("[name=validityYears]").val();
			var securityCode = $("[name=securityCode]").val();
			var cardPw = $("[name=cardPw]").val();
			$.ajax({
				url : "/user/cardCheck",
				data : {"bankName" : bankName, "cardNum":cardNum, "validityMonth": validityMonth,"validityYears":validityYears,
					"securityCode" : Number(securityCode), "cardPw":cardPw},
				success : function(data){
					console.log(data);
					if(data == 1){
						alert("사용 할 수 있는 카드입니다.");
						localStorage.setItem("등록가능", "등록가능");
					}else if(data == 0){
						alert("유효 하지 않은 카드 정보입니다.");
					} 
				}
			})
		})
