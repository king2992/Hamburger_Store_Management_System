<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
 <header class="header">
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
                              <a class="dropdown-item modal_open modal_menu" data="modifyModal" id="triggerup" href="#">SignUp</a>
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
                      
            <div id="center-wrap">
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
                    <p>관리자가 POS 페이지로 이동하여 상품을 관리할 수 있습니다.</p>
                    <img src="/resources/images/possystem.png">
                </section>
                   <section class="kiosksection slideinleft">
                    <h2>TAKEOUT<br>포장</h2>
                    <p>자신이 원하는 지점과 시간대를<br>선택하여 예약할 수 있습니다.</p>
                       <img src="/resources/images/takeout.png">
                </section>
                </div>
        </div>
</body>
</html>