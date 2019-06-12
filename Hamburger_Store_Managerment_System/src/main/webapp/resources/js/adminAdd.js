$(document).ready(function(){
$(document).on("click", "#adminAdd", function(){
	adminAddPopUpOpen();
	})
	function adminAddPopUpOpen(){
		var url = "/user/adminAdd";
		var winWidth = 700;
		var winHeight = 800;
		var popupOption = "width="+winWidth+", height="+winHeight;
		window.open(url,"",popupOption);
	}
});