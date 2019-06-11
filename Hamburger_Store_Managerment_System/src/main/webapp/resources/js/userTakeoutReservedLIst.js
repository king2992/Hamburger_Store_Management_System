$(document).ready(function(){
	$(".reservedCheck").on("click", function(){
		var takeoutId = $(this).data("takeoutid");
		var reservedCheckList = $("#reservedCheckList");
		$.ajax({
			url : "/user/reservedCheck",
			data : {"takeoutId":takeoutId},
			success : function(data){
				var list = "";
				
					$.each(data, function(index, item){
						list += "<tr>" + "<th>" + item.menuName+ "</th>" +"<th>" + item.menuCnt+ "</th>" + "</tr>";
					})
					
					reservedCheckList.html(list);
				
			}
		})
	})
});