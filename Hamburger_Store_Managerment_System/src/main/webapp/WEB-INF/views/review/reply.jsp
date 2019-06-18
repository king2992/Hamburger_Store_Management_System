<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@7.32.2/dist/sweetalert2.min.css">
<link rel="stylesheet" href="/resources/css/mainR.css">
<link rel="stylesheet" href="/resources/css/sub.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
<script src="/resources/js/summernote.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="/resources/js/mainR.js"></script>
<c:if test="${sessionScope.user == null}">
<script type="text/javascript">
		alert("로그인 하신 후에 이용해 주세요.");
			location.href="${pageContext.request.contextPath}/";
</script>
<script type="text/javascript">
$(document).ready(function(){
    $("#header").load("/include/header")    
 });
</script>
</c:if>
<style>
.dropdown {cursor: pointer;}
.dropdown-menu > a{color:#16181b; font-size: 15px !important; height:32px; line-height: 32px; c}
.dropdown-menu > a:hover{background-color:#ffc107;}
.menu-icon {
    font-size: 1.5rem;
    color: #9a9da0;
}
.menu-dropmenu {
    position: absolute;
    left: -225%;
}
.popover {display:none;}
.note-editable{height:420px !important;}
.note-editable {
	resize: none !important;
}
</style>
   <script type="text/javascript">
        $(document).ready(function(){
        	$(".nav-admin").hide();
    		var adminId = "${sessionScope.admin}";
    		if(adminId != null){
    			$.ajax({
    				data : {"adminId":adminId},
    				url : "/admin/authConfirm",
    				success : function(data){
    					if(data.authstatus == "y_auth" && data.businessStatus == "y_auth"){
    						$(".nav-admin").show();
    					}
    				}
    			})	
    		}});
        </script>
</head>
<body>
    <div class="warp">
        <div class="layout-topheader"></div>
<header class="header">
                    <nav class="navi navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
                     <a href="/" class="navbar-brand js-scroll-trigger msa" style="color:rgba(255,255,255,0.5)"><img src="/resources/images/m-sa.png" style="padding-bottom: 18px;"></a>
                      <ul style="margin-left: 113px;">
                           <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/user/about">About Us</a></li>
                           <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/menuIntroduce/menuList">Menu</a></li>
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/review/reviewList">Community</a></li>
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/store/storeFind">Takeout</a></li>
                            
                             <li class="nav-item nav-admin"><a class="nav-link js-scroll-trigger" href="/user/about">About Us</a></li>
                            <li class="nav-item nav-admin"><a class="nav-link js-scroll-trigger" href="/kiosk/screen">Kiosk</a></li>
                            <li class="nav-item nav-admin"><a class="nav-link js-scroll-trigger" href="/pos/posmanagement">Pos</a></li>
                            <li class="nav-item nav-admin"><a class="nav-link js-scroll-trigger" href="/order/orderDisplay">Display</a></li>
                        </ul>
                       <ul class="nav navbar-nav menu-infobtn">
                         <li class="dropdown" style="margin-left: 136px;">
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
        <div class="layout-body">
            <div class="content">
<div class="content_subject">
    <div class="content_subjectleft">
        <img src="../resources/images/studying.png"> <span>커뮤니티 게시판</span>
    </div>
</div>
<div class="clear-fix"></div>
<form method="post" action="reply">
<div class="content_body">
    <div class="board_wrtiewarp">
        <div class="board_writesubject">
            <div class="board_writesubtop">
                <span>제목</span> <input type="text" name="title" id="board_subjecttext">
            </div>
            <div class="board_writesubbottom">
                <span>욕설, 도배, 비방 루머등 운영정책에 어긋나는 게시물 등록시에는 이용 제한 등 불이익을 받으실 수 있습니다.</span>
            </div>
        </div>
        <textarea id="summernote" name="contents"></textarea>
		<input type="hidden" class="board_contenttext">
        <input type="hidden"name="groupNum" value="${reply.groupNum}">
        <input type="hidden"  name="groupOrd" value="${reply.groupOrd}">
        <input type="hidden"  name="groupDepth" value="${reply.groupDepth}">
        <button class="btn btn-danger boardBtn" id="board_wrtiecancel" data="board_cancel">취소</button>
        <button class="btn btn-primary boardBtn" id="board_wrtiebtn" data="board_write">등록</button>
    </div>
</div>
 </form>
</div>
</div>
<div style="clear: both; position: relative;">
       
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
</div>
</body>
</html>
 
 