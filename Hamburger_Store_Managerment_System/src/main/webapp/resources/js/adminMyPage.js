$(document).ready(function(){
	var adminEmail = $("#adminEmail").val();
	var adminId = $("#adminId").val();
	
	$(document).on("click", "#emailAuth", function(){
		location.href="/admin/afterEmailAuth?adminEmail="+adminEmail;
	})
	
});