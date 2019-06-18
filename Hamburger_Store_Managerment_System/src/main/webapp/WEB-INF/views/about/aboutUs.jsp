<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us</title>
<link href="/resources/css/header.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>   
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@7.32.2/dist/sweetalert2.min.css">
<link rel="stylesheet" href="${path}/resources/css/sub.css"> 

<link href="/resources/css/mainIndex.css" rel="stylesheet" type="text/css">
<link href="/resources/css/about.css" rel="stylesheet" type="text/css">
<link href="/resources/css/member.css" rel="stylesheet" type="text/css">
<script>


 $(document).on("click","#button",function(){
	 var item = $('.mainContent');
	 
	$('.memberContainer').fadeOut(); 
	
	item.addClass('is-visible');
  }

 );
</script>
<script type="text/javascript">
        	$(document).on("click",".dropdown",function(){
        		if($(".dropdown-menu").css('display') == 'block')
        			$(".dropdown-menu").css('display','none');
        		else
        			$(".dropdown-menu").css('display', 'block');
        	});
        	window.onload = function(){
        		console.log("${sessionScope.card}");
        	}
        
        </script>
<style type="text/css">
.mainContent{
  transition: all .3s linear;
display: none;
  opacity: 0;

}
.is-visible {
  display: block;
  opacity: 1;
}
.dropdown-menu{left: -109px;}
#triggerup,.modal_menu,#trigger {color: #141414 !important;}
#triggerup:hover,#trigger:hover{color:white !important;}
</style>
</head>
<body style="transform-style: preserve-3d;  transform: perspective(900px) ">

  <header class="header mainContent">
                 <nav class="navi navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
                     <a href="/" class="navbar-brand js-scroll-trigger msa" style="color:rgba(255,255,255,0.5)"><img src="/resources/images/m-sa.png" style="padding-bottom: 18px;"></a>
                      <ul>
                           <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/user/about">About Us</a></li>
                           <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/menuIntroduce/menuList">Menu</a></li>
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/review/reviewList">Community</a></li>
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/store/storeFind">Takeout</a></li>
                            
                            <!-- <li class="nav-item nav-admin"><a class="nav-link js-scroll-trigger" href="/user/about">About Us</a></li>
                            <li class="nav-item nav-admin"><a class="nav-link js-scroll-trigger" href="/kiosk/screen">Kiosk</a></li>
                            <li class="nav-item nav-admin"><a class="nav-link js-scroll-trigger" href="/pos/posmanagement">Pos</a></li>
                            <li class="nav-item nav-admin"><a class="nav-link js-scroll-trigger" href="/order/orderDisplay">Display</a></li> -->
                        </ul>
                       <ul class="nav navbar-nav menu-infobtn">
                         <li class="dropdown">
                          <a href="#" class="dropdown-toggle menu-dropicon" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expaneded="false">
                              <i class="fa fa-cog fa-spin fa-fw menu-icon"></i>
                          </a>
                          <div class="dropdown-menu menu-dropmenu">
                              <a class="dropdown-item modal_open modal_menu" data="modifyModal" id="triggerup" href="/user/">SignUp</a>
                                  <c:choose>
                        <c:when test="${sessionScope.user eq null }">
                <a class="dropdown-item modal_open modal_menu" href="#"  id="trigger">Login</a> 
                </c:when>
                <c:otherwise>
                    <a class="dropdown-item modal_open modal_menu" href="/user/userLogout">LogOut</a>
                  </c:otherwise>
                </c:choose>
                   <c:choose>
                      <c:when test="${sessionScope.user ne null }">
                        <a class="dropdown-item modal_open modal_menu" href="/user/myPage">My Page</a>
                      </c:when>
                   </c:choose>
                          </div>
                         </li>
                    </ul>
               </nav>
        </header>
            <div id="container">
                      
            <div id="center-wrap" class="mainContent">
         <!--        <div class="border border1"></div>
                <div class="border border2"></div>
                <div class="border border3"></div> -->
              
                <section class="backgroundwrap">
                    <div class="middlewrap"><img src="/resources/images/main10.jpg" class="backimg">
                        </div>
                </section>
               
                <div class="typingwrap">
                <p class="typing-txt">M-SA?</p>
                    <p class="typing-txt2">ABOUT US</p>
                <p class="typing" style="display: block"></p>
                    <p class="typing2"></p>
                  
                     <script src="/resources/js/about.js"></script>
                </div>
                <section class="kiosksection slideinleft">
                    <h2>KIOSK<br>무인주문시스템</h2>
                    <p>더욱 간편하게 프로그램이 아닌 <br> 웹상에서 주문 가능합니다.</p>
                    <img src="/resources/images/kiosk.png">
                </section>
                <section class="kiosksection slideinright">
                    <h2>POS<br>관리자 영역</h2>
                    <p>관리자가 POS 페이지로 이동하여 <br>상품을 관리할 수 있습니다.</p>
                    <img src="/resources/images/possystem.png">
                </section>
                   <section class="kiosksection slideinleft">
                    <h2>TAKEOUT<br>포장</h2>
                    <p>자신이 원하는 지점과 시간대를<br>선택하여 예약할 수 있습니다.</p>
                       <img src="/resources/images/takeout.png">
                </section>
                </div> 
                
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
          <div class="btnWrap">
          <button id="button">start</button>
          </div>
          
          </div>
                
         </div> 
        
  
</body>
</html>