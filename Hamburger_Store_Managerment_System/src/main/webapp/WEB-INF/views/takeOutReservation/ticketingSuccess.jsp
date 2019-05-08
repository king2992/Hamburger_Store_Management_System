<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예매완료</title>
     <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
    	window.onload = function(){
    		var ticketingSuccessCheck = document.getElementById('ticketingSuccessCheck');
    		var ticketingSuccess = document.getElementById('ticketingSuccess');
    		
    		setTimeout(function(){
    			ticketingSuccess.innerHTML = "<h1>"+"결제완료."+"</h1>";
    			ticketingSuccessCheck.innerHTML = 
    			"<a href='/seatReservation/ticketingSuccessCheck?id=${sessionScope.user}'>"
    			+"예매 현황 보러 가기"+
    			"</a>" + 
    			"<div>" + "<a href='/'>" + "홈으로" + "</a>" + "</div>"
    			;
    		},3000);
    	}
    </script>
  
</head>
<body>

<div id="ticketingSuccess">
<h1>결제중입니다.</h1>
<img src="/resources/images/ordering.gif">
</div>

<div id="ticketingSuccessCheck">
</div>
</body>
</html>