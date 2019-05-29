<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
 
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>커뮤니티 게시판</title>
 
<!-- <link rel="stylesheet" href="/resources/css/reset.css"> --> <!-- CSS reset -->
<!-- <link rel="stylesheet" href="/resources/css/style.css"> --> <!-- Resource style -->
<!-- <script src="/resources/js/modernizr.js"></script>  --><!-- Modernizr -->
 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"> 
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@7.32.2/dist/sweetalert2.min.css">
<!-- <link rel="stylesheet" href="/resources/css/messenger.css"> -->
<!--  <link rel="stylesheet" href="/resources/css/mainR.css"> --> 
 <link rel="stylesheet" href="/resources/css/sub.css"> 
  <link href="/resources/css/animate.min.css" rel="stylesheet"> 
 <script src="https://code.jquery.com/jquery-3.3.1.js"></script>   
 <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script> --> 
 <!-- <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.32.2/dist/sweetalert2.min.js"></script>  -->
<!--  <script src="/resources/js/mainR.js"></script> -->

<!-- 접속현황 -->
<c:if test="${sessionScope.user ne null }">
	<script>
		$(document).ready(function() {
			statusConnect();
		});
	</script>
</c:if> 

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
})


if($(window).width() > 767){
    //Initiat WOW JS
 /*    new WOW().init(); */
}
/* 마우스스크롤 */

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
                 <header class="header main-nav" id="board">
                    <nav class="navi navbar navbar-expand-lg navbar-light" id="mainNav">
                     <a href="/" class="navbar-brand js-scroll-trigger" style="color:rgba(255,255,255,.5)"><p>M-SA</p></a>
                        <ul>
                            
                            <li class="nav-item"> <a class="nav-link js-scroll-trigger" id="triggerup" href="#">SignUp</a></li>
                            
                                 <li class="nav-item">
              <c:choose>
                  <c:when test="${sessionScope.user eq null }">
          <a class="nav-link js-scroll-trigger" href="#"  id="trigger">Login</a> 
          </c:when>
          <c:otherwise>
              <a class="nav-link js-scroll-trigger" href="/user/userLogout">LogOut</a>
            </c:otherwise>
          </c:choose>
          </li>
                            
                            
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/review/reviewList">Community</a></li>
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/store/storeFind">Takeout</a></li>
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/kiosk/screen">Kiosk</a></li>
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/pos/posmanagement">Pos</a></li>
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/order/orderDisplay">Display</a></li>
                               <c:choose>
          <c:when test="${sessionScope.user ne null }">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/user/myPage">My Page</a>
          </li>
          </c:when>
          </c:choose>
                        </ul>
                    </nav>
                </header>
</div>
					<div class="layout">
		<!-- <div class="layout-body"></div> -->
		<div class="content">
			<div class="content_subject">
				<div class="content_subjectleft">
					<img src="../resources/images/m-sa.png"> <span>커뮤니티 게시판</span>
				</div>
				<div class="content_subjectright">
					<form id="searchfrm">
						<!-- method="GET" action="/board/search" -->
						<select name="search" class="form-control board_searchselect">
							<option value="title">제목</option>
							<option value="contents">내용</option>
							<option value="userId">작성자</option>
							<option value="title_contents">제목+내용</option>
						</select> <input class="board_searchtext board_searchtext" type="text"
							name="keyword" class="form-control" placeholder="검색 내용을 입력하세요">
						<button class="btn btn-primary board_searchbtn boardBtn"
							onclick="javascript:frm_search();">검색</button>
						<!-- data="board_search" -->
					</form>
					<a href="reviewAdd"><button
							class="btn btn-warning board_writebtn boardBtn">글쓰기</button></a>
					<!-- data="board_movewrite" -->
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
											<img src="../resources/images/m-sa.png">
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
											<img src="../resources/images/board_search.png"> <span>${list.ref}</span>
										</div>
										<div class="content_totalicon">
											<img src="../resources/images/board_like.png"> <span>${list.reLike }</span>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>

								<div class="content_list">
									<div class="content_userimg">
										<div class="content_layoutimg">
											<img src="../resources/images/siba-default.png">
										</div>
									</div>
									<div class="content_boardview">
										<div class="content_boardtext">
											<c:if test="${list.groupDepth eq 0 }">
												<c:set var="wid" value="${list.groupDepth*10 }"></c:set>
												<img src='<c:url value="../resources/images/level.png"/>'
													width="${wid }">
												<img src='<c:url value="../resources/images/list-re.png"/>'>
											</c:if>
											<span data="${list.number}">삭제 된 게시글 입니다.</span> <span></span>
										</div>
										<div class="content_boardinfotext">
											<span>확인불가</span> <span></span> <span></span>
										</div>
									</div>
									<div class="content_boardinfo">
										<div class="content_searchicon">
											<img src="../resources/images/board_search.png"> <span>-</span>
										</div>
										<div class="content_totalicon">
											<img src="../resources/images/board_like.png"> <span>-</span>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					    
				</div>
 
				<div class="clear-fix"></div>
				<div class="content_pagenation ">
					<ul class="pagination">
						<li>${paging.html}</li>
					</ul>

				</div>

			</div>

		</div>
<div>
            <div class="mainFootArea">
                <div class="footerNoticeArea">
                    <h3>NOTICE&NEWS</h3>
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
<!--                     <li><a href=""><img src="images/drive.jpg"></a></li>-->
                     <li><a href=""><img src="/resources/images/home.gif"></a></li>
                     <li class="btn_ria_insta"><a href=""><img src="/resources/images/instargram.gif"></a></li>
                     <li class="btn_ria_movie"><a href=""><img src="/resources/images/grow.gif"></a></li>
                </ul>
            </div>          
        </div>
                  
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

