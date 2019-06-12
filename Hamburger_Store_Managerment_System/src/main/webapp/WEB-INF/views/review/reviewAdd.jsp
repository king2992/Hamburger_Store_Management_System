<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>  
<meta charset="UTF-8">
<title></title>
<link rel="shortcut icon" href="${path}/review/reviewAdd">
 <style> 
button { border-style:none; width: 70px; height:35px; background-color:#2d70be; font-weight:bold; color:#fff; cursor: pointer;}
.fileDrop { width : 100%; height: 200px;  border : 2px dotted #0b58a2; }
.uploadedFileList li{ margin-right:20px !important; }
.note-editable{resize: none;}
.note-popover{display: none !important;}
html{font-size: 14px !important;}
#board_wrtiebtn{margin:0 0 20px 10px;}
#board_wrtiebtn{margin-top:0 !important;}
.nav .open > a, .nav .open > a:hover, .nav .open > a:focus{background-color: transparent !important;}
.nav > li > a:hover, .nav > li > a:focus{background-color: transparent !important;}
.mailbox-attachment-name{color:#337ab7;}
.mailbox-attachment-icon has-img > img{width:70px;}
.fa-cog:before{content: "\f013";}
 </style> 
<c:if test="${sessionScope.user == null}">
<script type="text/javascript">
		alert("로그인 하신 후에 이용해 주세요.");
			location.href="${pageContext.request.contextPath}/";
</script>
</c:if>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">  
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/12.1.0/classic/ckeditor.js"></script>
<link rel="stylesheet" href="${path}/resources/lightbox/css/lightbox.css">
<link href="/resources/css/footer.css" rel="stylesheet" type="text/css">
<!-- <link rel="stylesheet" href="/resources/css/mainR.css">   -->
<link rel="stylesheet" href="/resources/css/sub.css">
<script type="text/javascript" src="${path}/resources/js/summernote.js"></script>
<script id="fileTemplate" type="text/x-handlebars-template">
	<li style="list-style: none; margin: 0 0 0 0; padding: 0 0 0 0; border: 0; float:left;">
		<span class="mailbox-attachment-icon has-img">
			<img src="{{imgSrc}}" alt="Attachment">
		</span>
		<div class="mailbox-attachment-info">
			<a href="{{originalFileUrl}}" class="mailbox-attachment-name">
				<i class="fa fa-paperclip"></i> {{originalFileName}}
			</a>
			<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delBtn">
				<i class="fa fa-fw fa-remove">삭제</i>
			</a>
		</div>
	</li>
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/fileUpload.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<script type="text/javascript" src="/resources/lightbox/js/lightbox.js"></script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<link href="/resources/css/header.css" rel="stylesheet" type="text/css">
</head>

<body>
	   <div class="warp">
        <div class="layout-topheader"></div>
<header class="header">
                    <nav class="navi navbar navbar-expand-lg navbar-light" id="mainNav">
                     <a href="/" class="navbar-brand js-scroll-trigger" style="color:rgba(255,255,255,0.5)"><img src="/resources/images/m-sa.png" class="msa" style="position: relative; bottom: 10px; left: -50px;"></a>
                        <ul>
                            
                          <!--   <li class="nav-item"> <a class="nav-link js-scroll-trigger" id="triggerup" href="#">SignUp</a></li> -->
                            
            
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/review/reviewList">Community</a></li>
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/store/storeFind">Takeout</a></li>
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/kiosk/screen">Kiosk</a></li>
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/pos/posmanagement">Pos</a></li>
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/order/orderDisplay">Display</a></li>
                       
                        </ul>
                          <ul class="nav navbar-nav menu-infobtn" style="right:0;">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle menu-dropicon" data-toggle="dropdown" role="button" aria-haspopup="true" style="font-size: 25px;" aria-expaneded="false">
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
        <div class="layout-body">
            <div class="content">
<div class="content_subject">
    <div class="content_subjectleft">
        <img src="../resources/images/studying.png"> <span>커뮤니티 게시판</span>
    </div>
</div>
<div class="clear-fix"></div>
<form id="writeForm" method="post" action="reviewAdd" >
<div class="content_body">
    <div class="board_wrtiewarp">
        <div class="board_writesubject">
            <div class="board_writesubtop">
                <span>제목</span> <input type="text" name="title" id="board_subjecttext" placeholder="제목을 입력해주세요">
            </div>
            <div class="board_writesubbottom">
                <span>욕설, 도배, 비방 루머등 운영정책에 어긋나는 게시물 등록시에는 이용 제한 등 불이익을 받으실 수 있습니다.</span>
            </div>
        </div>
        <textarea id="summernote" name="contents"  placeholder="내용을 입력해주세요" style="resize: none;"></textarea>
		<div class="form-group">
			<div class="fileDrop">
				<p class="text-center" style="line-height:200px;"><i class="fa fa-paperclip"></i> 첨부파일을 드래그해주세요.</p>
			</div>
		</div>
<div class="box-footer">
			<ul class="uploadedFileList"></ul>
		</div>
    </div>
</div>
 <button class="btn btn-primary boardBtn" id="board_wrtiebtn">등록</button>
 </form>
 <a href="${path}/review/reviewList"><button class="btn btn-danger boardBtn"  id="board_wrtiebtn">취소</button></a>

</div>
</div>
<div style="clear: both; position: relative;">
       
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