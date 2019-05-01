<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="/resources/css/pos2.css" rel="stylesheet" type="text/css" media="all" />
<link href="/resources/css/posFonts.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://localhost:84/socket.io/socket.io.js"></script>
<style>
	#handBell{
		width:150px;
		height:150px;
	}
</style>
<script>
			var userId = "${sessionScope.user}";
            $(document).ready(function(){
            	$("#chatBox").hide();
    			$("#handBell").hide();
                var socket = io("http://localhost:84");
                //msg에서 키를 누를떄
                $("#msg").keydown(function(key){
                    //해당하는 키가 엔터키(13) 일떄
                    if(key.keyCode == 13){
                        //msg_process를 클릭해준다.
                        msg_process.click();
                    }
                });
                //msg_process를 클릭할 때
                $("#msg_process").click(function(){
                    //소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
                     socket.emit("send_msg", $("#msg").text());
                    //#msg에 벨류값을 비워준다.
                    $("#msg").text("");
                });
              //소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
                socket.on('send_msg', function(msg) {
                	$("#chatBox").show();
                	$("#handBell").show();
                    //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
                    $('<div></div>').text("새로운 주문이 있습니다.").appendTo("#chat_box");
                });
            });
        </script>
       
<div id="page" class="container">
	<div id="header">
		<div id="logo">
			<img src="images/pic02.jpg" alt="" />
			<h1><a href="#">Store System</a></h1>
		</div>
		<div id="menu"> 
			<ul>
				<li class="current_page_item"><a href="/pos/Ordermanagement" accesskey="1" title="">Order Management</a></li>
				<li><a href="/pos/ReservationManagement" accesskey="2" title="">Reservation Management</a></li>
				<li><a href="#" accesskey="3" title="">Sales Management</a></li>
				<li><a href="#" accesskey="4" title="">Stock Management</a></li>
			</ul>
		</div>
	</div>
	<div id="main">
		<div id="banner">
		</div>
		<div id="welcome">
			<div class="title">
				<h2>Take Out Reservation List</h2>
			</div>
					<div id="handBell"><img src="/resources/img/pos/hand-bell.jpg" style="width:100px;height:100px;"></div>
			        <div id="chat_box"></div>
		</div>
		<div id="copyright">
			<span>&copy; Untitled. All rights reserved. |Made by <a href="http://fotogrph.com/">Team 2</a></span>
			<span>Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>.</span>
		</div>
	</div>
</div>
</body>
</html>