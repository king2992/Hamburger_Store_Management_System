<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us</title>
<script>
 $(document).on("click","#button",function(){
	$('.memberContainer').fadeOut(); 
 });
</script>
</head>
<body>

        <div class="memberContainer">
               <div class="title">
            <h1><span style="color: #ff9f43">M-SA</span><span style="color: #0abde3; margin-left: 10px;">MEMBER</span> <span style="color: #ee5253">INTRO</span><span style="color: #00d2d3">DUCE<span><span style="color: #5f27cd"><span></h1>
          </div>
          <div class="card1">
            <img src="/resources/images/jjw.jpg" alt="">
            <h3>조 재 원</h3>
            <p></p>
          </div>
          
          <div class="card2">
            <img src="/resources/images/sj.jpg" alt="Eiffel Tower">
            <h3>박 수 진</h3>
            <p></p>
          </div>
          
          <div class="card3">
            <img src="/resources/images/jw.jpg" alt="">
            <h3>이 진 우</h3>
            <p>조선에 이순신이 있다면  우리는 <BR> 이진우가 있다. </p>
          </div>
          <div class="card4">
            <img src="/resources/images/jh.jpg" alt="">
            <h3>원 정 희</h3>
            <p>막판에 열심히 하는 척 한 <br>원정희</p>
          </div>
          <div class="card5">
            <img src="/resources/images/wh.jpg" alt="">
            <h3>주 우 형</h3>
            <p></p>
          </div>
          <button id="button">버튼 눌러주세요</button>
          </div>
</body>
</html>