<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
 <title>M-SA 커뮤니티 게시판</title>
<head> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="${path}/review/reviewList">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>   
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@7.32.2/dist/sweetalert2.min.css">
<link rel="stylesheet" href="${path}/resources/css/sub.css"> 
<!-- <link rel="stylesheet" href="/resources/css/mainR.css">  -->
<link href="${path}/resources/css/animate.min.css" rel="stylesheet"> 
<link href="${path}/resources/review/js/reviewList.js">
<script type="text/javascript">
	var slideHeight = $(window).height();
		$('#home-slider .item').css('height',slideHeight);
		$(window).resize(function(){ 
    	'use strict';
		$('#home-slider .item').css('height',slideHeight);
		});
		$(document).ready(function(){
			$('#tohash , #startBtn').on('click', function(event){
			$('html, body').animate({scrollTop: $(this.hash).offset().top -5},1000);
			event.preventDefault();
		return false;
	});	
});
	if($(window).width() > 767){
   	//Initiat WOW JS
 	/*    new WOW().init(); */
	/* 마우스스크롤 */
	}
</script>
<script type="text/javascript">
//Scroll Menu
	$(window).on('scroll', function(){
		if( $(window).scrollTop()>slideHeight ){
			$('.main-nav').addClass('navbar-fixed-top');
		} else {
			$('.main-nav').removeClass('navbar-fixed-top');
		}
	});
//smoothScroll
/* smoothScroll.init(); */
</script>
<script>
	$(document).on("click",".dropdown",function(){
		if($(".dropdown-menu").css('display') == 'block'){
			$(".dropdown-menu").hide();
		}else{$(".dropdown-menu").show();}
	})
</script>
<style>
.dropdown {cursor: pointer;}
.dropdown-menu > a{color:#16181b; font-size: 15px !important; height:32px; line-height: 32px; c}
.dropdown-menu > a:hover{background-color:#ffc107 !important;}
.dropdown-toggle:hover, .dropdown-toggle:focus{background-color: transparent !important; color:black;}
.nav>li>a:hover, .nav>li>a:focus{background: transparent !important;}
.menu-icon {
    font-size: 1.5rem;
    color: #9a9da0;
}
.menu-dropmenu {
    position: absolute;
    left: -225%;
}

.paginationSub li {
  color: black;
  width:50px;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
  margin: 0 auto;
  color: #000;
}

.active {
  background-color: #4CAF50;
  color: white;
  border: 1px solid #4CAF50;
}

.paginationSub li:hover:not(.active) {background-color: #ddd;}

</style>
</head>
<body>
  <div id="home">
     <div id="home-slider" class="carousel slide carousel-fade" data-ride="carousel">
      <div class="carousel-inner">
        <div class="item active" style="background-image: url(/resources/images/1.jpg); height: 937px;">
          <div class="caption">
            <h1 class="animated fadeInLeftBig">Welcome to <span style="color:#028fcc;">M-SA</span></h1>
            <p class="animated fadeInRightBig">COMMUNITY - 자유롭게 글을 남겨주세요.</p>
            <a data-scroll class="btn btn-start animated fadeInUpBig" id="startBtn" href="#board">Start now</a>
          </div>
        </div>
      </div>
      <a id="tohash" href="#board"><i class="fa fa-angle-down"></i></a>
    </div>	
<!--     헤더 부분 -->
   <header class="header main-nav" id="board">
                    <nav class="navi navbar navbar-expand-lg navbar-light" id="mainNav">
                     <a href="/" class="navbar-brand js-scroll-trigger msa" style="color:rgba(255,255,255,0.5)"><img src="/resources/images/m-sa.png" style="padding-bottom: 18px;"></a>
                        <ul>
                            
                          <!--   <li class="nav-item"> <a class="nav-link js-scroll-trigger" id="triggerup" href="#">SignUp</a></li> -->
                            
                                
                             <!-- <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/include/header">header</a></li> -->
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/review/reviewList">Community</a></li>
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/store/storeFind">Takeout</a></li>
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/kiosk/screen">Kiosk</a></li>
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/pos/posmanagement">Pos</a></li>
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/order/orderDisplay">Display</a></li>
                       
                        </ul>
                          <ul class="nav navbar-nav menu-infobtn">
                <li class="dropdown">
                    <a class="dropdown-toggle menu-dropicon" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expaneded="false">
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
  </div>
  <div class="layout">
		<div class="content">
			<div class="content_subject">
				<div class="content_subjectleft">
					<img src="${path}/resources/images/m-sa.png"> <span>커뮤니티 게시판</span>
				</div>
				<div class="content_subjectright">
					<form id="searchfrm">
						<select name="search" class="form-control board_searchselect">
							<option value="title">제목</option>
							<option value="contents">내용</option>
							<option value="userId">작성자</option>
							<option value="title_contents">제목+내용</option>
						</select> <input class="board_searchtext board_searchtext" type="text"
							name="keyword" class="form-control" placeholder="검색 내용을 입력하세요">
						<a class="btn btn-primary board_searchbtn boardBtn" href="#board"
							onclick="javascript:frm_search();">검색</a>
					</form>
					<a href="reviewAdd"><button
							class="btn btn-warning board_writebtn boardBtn">글쓰기</button></a>
				</div>
			</div>
			<div class="clear-fix"></div>
			<div class="content_body">
				<div class="content_listwarp">
					<c:forEach items="${reviewList}" var="list">
						<c:choose>
							<c:when test="${reviewList.size() > 0 }">
								<div class="content_list">
									<div class="content_userimg">
										<div class="content_layoutimg">
											<img src="${path}/resources/images/m-sa.png">
										</div>
									</div>
									<div class="content_boardview">
										<div class="content_boardtext">
											<c:if test="${list.groupDepth > 0 }">
												<c:set var="wid" value="${list.groupDepth*10 }"></c:set>
												<img src='<c:url value="../resources/images/level.png"/>'
													width="${wid }">
												<img src='<c:url value="../resources/images/list-re.png"/>'>
											</c:if>
											<a href="view?number=${list.number}"><span
												data="${list.number}">${list.title}</span></a> <span>[
												${list.coNum } ]</span>
										</div>
										<div class="content_boardinfotext">
											<span>[${list.userId }]</span> <span> - <fmt:formatDate
													value="${list.date}" pattern="yyyy-MM-dd" /></span>
										</div>
									</div>
									<div class="content_boardinfo">
										<div class="content_searchicon">
											<img src="${path}/resources/images/board_search.png"> <span>${list.ref}</span>
										</div>
										<div class="content_totalicon">
											<img src="${path}/resources/images/board_like.png"> <span>${list.likeCnt}</span>
										</div>
									</div>
								</div>
							</c:when>
						</c:choose>
					</c:forEach>
				</div>
				<div class="clear-fix"></div>
				<div class="content_pagenation paginationDiv">
<!-- 				페이징 부분 -->
					<ul class="paginationSub">
						<li class="active">${paging.html}</li>
					</ul>
				</div>
			</div>
		</div>
		<div>
            <div class="mainFootArea">
                <div class="footerNoticeArea">
                    <h3>NOTICE&amp;NEWS</h3>
                    <div class="footNoticeWrap">
                        <ul class="footNoticeUl">
                            <li>
                                <p>
                                    <a href="">공휴일 및 넷째 주 일요일 휴업</a>
                                </p>
                            </li>
                        </ul>
                    </div>
                </div>
                
                <ul class="footQuickUl">
                    <li><a href=""><img src="/resources/images/24.gif"></a></li>
                     <li><a href=""><img src="/resources/images/home.gif"></a></li>
                     <li class="btn_ria_insta"><a href=""><img src="/resources/images/instargram.gif"></a></li>
                     <li class="btn_ria_movie"><a href=""><img src="/resources/images/grow.gif"></a></li>
                </ul>
            </div>          
        </div>
<!--         푸터 부분 -->
                   <footer class="footer">
                    <div class="inner">
                        <address>
                            <p>대전광역시 동구 우암로 352-21 대표문의 : 010-8950 - 1914</p>
                            <p>고객지원센터 010-5456-0801 (고객불편사항 등)대표자:주이원박조</p>
                            <p>COPYRIGHT &copy; 2019 M-SA ALL RIGHT RESERVED</p>
                        </address>
                        <div>
                            <img src="/resources/images/footer2.jpg">
                            <img src="/resources/images/footer.jpg">
                            <img src="/resources/images/footer4.gif">
                            <img src="/resources/images/footer5.gif">
                            <img src="/resources/images/footer6.gif">
                        </div>
                    </div>
                </footer>
		</div>
</body>
</html>