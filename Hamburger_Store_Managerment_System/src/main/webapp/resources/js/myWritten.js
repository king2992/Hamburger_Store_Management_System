$(document).ready(function(){
	$(document).on("click", "#boardDel", function(){
		var boardNum = $(this).data("number");
		
		deleteSuccess();
		setTimeout(function(){
			window.location.href="/user/myWrittenDelete?number=" + boardNum;	
		},1500)
		
	})
	function deleteSuccess(){
		Swal.fire({
		  position: 'center',
		  type: 'success',
		  title: '삭제가 완료되었습니다.',
		  showConfirmButton: false,
		  timer: 1500
		});
	}
	$(document).on("click", ".boardMove", function(){
		var boardNum = $(this).data("number");
		window.location.href="/review/view?number=" + boardNum ;
	})
	
	$(document).on("click", "#userDelete", function(){
		var userPassword = $("#nowPw").val();
		console.log(userPassword);
		
		$.ajax({
			data : {"userPassword" : userPassword},
			url : "/user/userWithdrawal",
			success : function(data){
				if(data == 1){
					alert("이용해 주셔서 감사합니다.");
					$.ajax({
						url:"/user/userDelete",
						success : function(data){
							if(data == 1){
								window.location.href ="/";
							}
						}
					})
				}else if(data == 0){
					alert("현재 비밀번호를 확인해주세요.");
				}
			}
		})
	})
	 $(document).on("click", "#myBtn", function(){
		 $(".withdrawalModal").show();
	 })
	 $(document).on("click", ".withdrawal-close", function(){
		 $(".withdrawalModal").hide();
	 })
	 $(document).on("click", ".cardmodal-close", function(){
		 $("#MYcardModal").hide();
	 })
});