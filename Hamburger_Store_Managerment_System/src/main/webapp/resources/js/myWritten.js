$(document).ready(function(){
	$(document).on("click", "#boardDel", function(){
		var boardNum = $(this).data("number");
		console.log(boardNum);
	})
});