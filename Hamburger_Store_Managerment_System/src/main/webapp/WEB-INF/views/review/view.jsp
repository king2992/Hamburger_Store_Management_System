<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${view.title}</title>
<link rel="shortcut icon" href="${path}/review/view?number=${view.number}">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="${path}/resources/review/view.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@7.32.2/dist/sweetalert2.min.css">
<link rel="stylesheet" href="/resources/css/mainR.css">
<link rel="stylesheet" href="/resources/css/sub.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script id="fileTemplate" type="text/x-handlebars-template">
	<li data-src="{{fileName}}">
		<span class="mailbox-attachment-icon has-img">
			<img src="{{imgSrc}}" alt="Attachment">
		</span>
		<div class="mailbox-attachment-info">
			<a href="{{originalFileUrl}}" class="mailbox-attachment-name">
				<i class="fa fa-paperclip"></i> {{originalFileName}}
			</a>
		</div>
	</li>
</script>
<c:if test="${sessionScope.user == null}">
<script type="text/javascript">
		alert("로그인 하신 후에 이용해 주세요.");
			location.href="${pageContext.request.contextPath}/";
</script>
</c:if>
<script type="text/javascript">
window.onload = function() {
	var likeArea = $('#likeArea');
	var a = "";
	var b = "";
	var c = "";
// 처음 출력 
	
	a += '<div class="view_like" id="likeBtn" data-number="${view.number}>'+
	'<img id="likeImg">'+
	'<span>'+'좋아요'+'</span>'+ 
	'<span>'+'${view.reLike}'+'</span>'+
	'</div>';
	likeArea.html(a);
// 	$('#like').attr('src','/resources/images/unlike.png');
	//$('#likeBtn').children('img').attr('src','/resources/images/unlike.png');
	
	
	b += '<div class="view_like" id="likeDel" data-number="${view.number}>'+
	'<img src="/resources/images/unlike.png">'+
	'<span>'+'좋아요 취소'+'</span>'+ 
	'<span>'+'${view.reLike}'+'</span>'+
	'</div>';
	
	c += '<div class="view_like" id="unLikeBtn" data-number="${view.number}>'+
	'<img id="like_">'+
	'<span>'+'좋아요 '+'</span>'+ 
	'<span>'+'${view.reLike}'+'</span>'+
	'</div>';
	
	var number = $('#view_no').val();
	$.ajax({
		url : '/review/likeFunc',
		data : {'number':Number(number)},
		success : function(data) {
			if (data.likeCheck == 1) {
				likeArea.html(b);
			} else if(data.likeCheck == 0){
				likeArea.html(c);
			}
		}
	});
	var likeImg = document.getElementById("likeImg");
	likeImg.setAttribute("src", "/resources/images/unlike.png"); 
	
};

$(document).ready(function(){
    $("#header").load("/include/header");
   
    $(document).on('click', "#likeBtn",function(){
// 		var number = $('#likeBtn').data('number');
		var likeArea = $('#likeArea');
		var b ="";
		b += '<div class="view_like" id="likeDel" data-number="${view.number}>'+
		'<img src="/resources/images/unlike.png">'+
		'<span>'+'좋아요 취소'+'</span>'+ 
		'<span>'+'${view.reLike}'+'</span>'+
		'</div>';
	var number = $('#view_no').val();
    	$.ajax({
    		url : "/review/likeAdd",
    		data : {"number":Number(number)},
    		success : function(data){
    			if (data == 1) {
    				likeArea.html(b);
    			};
    		}
    	});
    	
    });
    
    
    $(document).on('click','#likeDel', function(){
    	var likeArea = $('#likeArea');
    	var c ="";
    	c += '<div class="view_like" id="unLikeBtn" data-number="${view.number}>'+
    	'<img id="like_">'+
    	'<span>'+'좋아요 '+'</span>'+ 
    	'<span>'+'${view.reLike}'+'</span>'+
    	'</div>';
    	
    	var number = $('#view_no').val();
    	$.ajax({
    		url : '/review/likeDel',
    		data : {'number':Number(number)},
    		success : function(data) {
    			if (data == 0) {
    				likeArea.html(c);
    			}
    		}
    	});
    });
    
    $(document).on('click','#unLikeBtn', function(){
    	var likeArea = $('#likeArea');
    	var b="";
    	b += '<div class="view_like" id="likeDel" data-number="${view.number}>'+
    	'<img src="/resources/images/unlike.png">'+
    	'<span>'+'좋아요 취소'+'</span>'+ 
    	'<span>'+'${view.reLike}'+'</span>'+
    	'</div>';
    	var number = $('#view_no').val();
    	$.ajax({
    		url : '/review/likeRun',
    		data : {'number':Number(number)},
    		success : function(data) {
    			if (data == 1) {
    				likeArea.html(b);
    			}
    		}
    	});
    });
 });
</script>

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
</style>
</head>
<body>
    <div class="warp">
        <div class="layout-topheader"></div>

<header class="header">
                    <nav class="navi navbar navbar-expand-lg navbar-light" id="mainNav">
                     <a href="/" class="navbar-brand js-scroll-trigger" style="color:rgba(255,255,255,0.5)"><img src="/resources/images/m-sa.png" class="msa"></a>
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

        <div class="layout-body">
            <div class="content">
<div class="content_subject">
    <div class="content_subjectleft">
        <img src="/resources/images/studying.png">
        <span>커뮤니티 게시판</span>
    </div>
</div>
<div class="clear-fix"></div>
<div class="content_body">
    <div class="content_warp">
        <div class="content_view">
            <div class="view_header">
                <div class="view_subject">
                    <span>${view.title }</span>
                </div>
                <div class="view_contentinfo">
                    <div class="view_inforight">
                    <span><fmt:formatDate value="${view.date}" pattern="yyyy-MM-dd hh:mm:ss"/></span>
                        <span>｜</span> 
                        <span>조회 ${view.ref}</span>
                    </div>
                </div>
            </div>
            <div class="view_body">
                <input type="hidden" id="view_no" value="${view.number }" name="number">
                <div class="view_content">
                    ${view.contents }
                </div>
                <div id="likeArea"></div>
<%--                 		<div class="view_like"  id="likeBtn" data-number="${view.number}"> --%>
                		
<%--                 			<img src="${path}/resources/images/unlike.png"> --%>
<!--                 			<span>좋아요</span> -->
<%--                 			<span>${view.reLike}</span> --%>
<!--                 		</div> -->
                <div>
      				<c:forEach var="file" items="${fileList }">
      					<img src="${path}/resources/upload/images/${file }"/>
      				</c:forEach>
      			</div>
            </div>
            <div class="view_footer">
                <div class="view_info">
                    <img src="../resources/images/studying.png">
                    <span>[ ${view.userId } ]</span>
                </div>
            </div>
            <div class="view_button">
               <a href="reviewUp?number=${view.number}"><button class="btn btn-primary boardBtn" data="content_modify">수정</button></a>
               <a href="delete?number=${view.number}"><button class="btn btn-primary boardBtn" data="content_delete">삭제</button></a>
               <a href="reply?groupNum=${view.groupNum}&groupOrd=${view.groupOrd}&groupDepth=${view.groupDepth}"> 
               <button class="btn btn-primary boardBtn" data="content_rewrite">답글쓰기</button></a>
               <a href="reviewList"> <button class="btn btn-primary boardBtn" data="board_list">목록</button></a>
            </div>
<div class="box-footer uploadFiles">
		<ul class="mailbox-attachments clearfix uploadedFileList"></ul>
	</div>
            <div class="view_comment">
                <div class="comment_inputwarp">
					<div class="container">
							<form name="insertForm">
								<div class="input-group">
								<input type="hidden" class="board_no" name="number" value="${view.number}" />
									<input type="text" class="comment_text" id="content" name="content"  placeholder="덧글을 입력하세요" autofocus>
								<button class="btn btn-danger boardBtn" type="button" name="commentBtn">등록</button>
							</div>
					</form>
				</div>
				<script type="text/javascript" src="${path}/resources/js/comment.js"></script>
			<div class="commentList"></div>
                </div>
            </div>
        </div>
    </div>
  
</div>
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