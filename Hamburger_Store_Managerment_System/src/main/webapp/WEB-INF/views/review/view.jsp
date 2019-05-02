<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
 
<head>
    <meta charset="UTF-8">
    <title>header</title>

    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@7.32.2/dist/sweetalert2.min.css">
    <link rel="stylesheet" href="/resources/css/messenger.css">
    <link rel="stylesheet" href="/resources/css/mainR.css">
    <link rel="stylesheet" href="/resources/css/sub.css">

    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <!-- <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.32.2/dist/sweetalert2.min.js"></script> -->
    <script src="/resources/js/mainR.js"></script>
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
<script type="text/javascript">
	$(".delBtn").on("click", function (){
		// 첨부파일명들을 배열에 저장
		var arr = [];
		$(".uploadedFileList").each(function)() {
			arr.push($(this).attr("data-src"));
		});
		
		// 첨부파일 삭제요청
		if (arr.length > 0) {
			$.post("/review/file/deleteAll", {files: arr}, function() {
				
			});
		};
	};
	
</script>
<c:if test="${sessionScope.user == null}">
<script type="text/javascript">
		alert("로그인 하신 후에 이용해 주세요.");
			location.href="${pageContext.request.contextPath}/";
</script>
</c:if>
    <!--	메세지 세션	-->
 <%--    <c:if test="${sessionScope.message ne null}">
        <script>
            $(document).ready(function() {
                sessionMessage();

                function sessionMessage() {
                    var message = "${sessionScope.message}";
                    if (message != '') {
                        Swal({
                            position: 'top-end',
                            type: 'success',
                            title: message,
                            showConfirmButton: false,
                            timer: 1500
                        })
                    }
                }
            });

        </script>
        <c:remove var="message" scope="session" />
    </c:if> --%>

    <!--	에러 세션	-->
   <%--  <c:if test="${sessionScope.error ne null}">
        <script>
            $(document).ready(function() {
                sessionError();

                function sessionError() {
                    var error = "${sessionScope.error}";
                    if (error != '') {
                        Swal({
                            position: 'top-end',
                            type: 'error',
                            title: error,
                            showConfirmButton: false,
                            timer: 1500
                        })
                    }
                }
            });

        </script>
        <c:remove var="error" scope="session" />
    </c:if> --%>
    
    <!-- 접속현황 -->
    <c:if test="${sessionScope.user ne null }">
    	<script>
    		$(document).ready(function(){
    			statusConnect();
    		});
    	</script>
    </c:if>


</head>

<body>

    <div class="warp">

        <div class="layout-topheader">
        </div>

        <nav class="navbar navbar-expand-sm navbar-dark fixed-top layout-menu">
            <!-- Brand -->
            <a class="navbar-brand menu-title" href='<c:url value="/"/>'>
                <span class="menu-pre">store</span><span class="menu-last">management</span>
            </a>
            <!-- Links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href='<c:url value="/"/>'>
                        <i class="fa fa-home menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href='<c:url value="/board/list"/>'>
                        <i class="fa fa-edit menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href='<c:url value="/study/list"/>'>
                        <i class="fas fa-book menu-icon"></i>
                    </a>
                </li>
                <c:if test="${user ne null }">
                    <li class="nav-item">
                        <a class="nav-link" href='<c:url value="/group/list"/>'>
                            <i class="fa fa-user-plus menu-icon"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="fa fa-envelope menu-icon modal_open" data=messageModal></i>
                        </a>
                    </li>
                </c:if>
            </ul>

            <ul class="nav navbar-nav menu-infobtn">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle menu-dropicon" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expaneded="false">
                        <i class="fa fa-cog fa-spin fa-fw menu-icon"></i>
                    </a>
                    <div class="dropdown-menu menu-dropmenu">
                        <a class="dropdown-item modal_open modal_menu" data="modifyModal" href="#">정보수정</a>
                        <a class="dropdown-item modal_open modal_menu" data="passModal" href="#">비밀번호변경</a>
                        <a class="dropdown-item modal_open modal_menu" data="logoutModal" href="<c:url value='/member/logout'/>">로그아웃</a>
                        <a class="dropdown-item modal_open modal_menu" data="secessionModal" href="#">회원탈퇴</a>
                    </div>
                </li>
            </ul>
        </nav>

        <div class="layout-body">


            <div class="content" style="float:left;">

<div class="content_subject">
    <div class="content_subjectleft">
        <img src="/resources/images/studying.png">
        <span>자유게시판</span>
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
                    <%-- <div class="view_infoleft">
                        <span>[${view.nick }]</span>
                    </div> --%>
                    <div class="view_inforight">
                    <span><fmt:formatDate value="${view.date}" pattern="yyyy-MM-dd hh:mm:ss"/></span>
                        <span>｜</span> 
                        <span>조회 ${view.ref}</span>
                    </div>
                </div>
            </div>
            <div class="view_body">
                <input type="hidden" id="view_no" value="${view.number }" name="number">
                <%-- <input type="hidden" id="view_gNo" value="${view.gNo }">
                <input type="hidden" id="view_step" value="${view.step }">
                <input type="hidden" id="view_indent" value="${view.indent }"> --%>
                <div class="view_content">
                    ${view.contents}
                </div>
                <%-- <c:choose>
                    <c:when test="${view.reLike eq 'true' }">
                        <div class="view_like" data="like">
                            <img src="../resources/images/like.png">
                            <span>좋아요</span>
                            <span>${view.reLike}</span>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="view_like" data="unlike">
                            <img src="../resources/images/unlike.png">
                            <span>좋아요</span>
                            <span>${view.reLike}</span>
                        </div>
                    </c:otherwise>
                </c:choose> --%>

            </div>
            <div class="view_footer">
                <div class="view_info">
                    <img src="../resources/images/studying.png">
                 <%--    <span id="view_nick">${view.nick }</span> --%>
                    <span>[ ${view.userId } ]</span>
                </div>
               <!--  <div class="view_contact">
                    <div class="view_message">
                        <img src="../images/main/mail.png" class="modal_open view_messenger" id="messageBtn" data="messageModal">
                        <span class="modal_open view_messenger" id="messageBtn" data="messageModal">메세지</span>
                    </div>
                    <div class="view_friend">
                        <img src="/images/main/friendship.png" class="modal_open view_messenger" id="friendBtn" data="messageModal">
                        <span class="modal_open view_messenger" id="friendBtn" data="messageModal">친구추가</span>
                    </div>
                </div> -->
            </div>

            <div class="view_button">
<%--                 <c:if test="${sessionScope.user.userId eq view.userId}"> --%>
                    <a href="reviewUp?number=${view.number}"><button class="btn btn-primary boardBtn" data="content_modify">수정</button></a>
                    <a href="delete?number=${view.number}"><button class="btn btn-primary boardBtn" data="content_delete">삭제</button></a>
<%--                 </c:if> --%>

               <a href="reply?groupNum=${view.groupNum}&groupOrd=${view.groupOrd}&groupDepth=${view.groupDepth}"> 
               <button class="btn btn-primary boardBtn" data="content_rewrite">답글쓰기</button></a>
               <a href="reviewList"> <button class="btn btn-primary boardBtn" data="board_list">목록</button></a>
            </div>


<div class="box-footer uploadFiles">
		<ul class="mailbox-attachments clearfix uploadedFileList"></ul>
	</div>

            <div class="view_comment">
                <%-- <div class="comment_subject">
                    <span>${commentCount }</span>
                    <span>개의 댓글이 있습니다.</span>
                </div> --%>
                <div class="comment_inputwarp">

					<div class="container">
							<form name="insertForm">
								<div class="input-group">
								<input type="hidden" class="board_no" name="number" value="${view.number}" />
									<input type="text" class="comment_text" id="content" name="content"  placeholder="덧글을 입력하세요" autofocus>
								<button class="btn btn-danger boardBtn" type="button" name="commentBtn">등록</button>
							</div>
					</form>
					 <script type="text/javascript" src="/resources/js/comment.js"></script>
				</div>
			<div class="commentList"></div>

									<%-- <input type="hidden" class="board_no" name="number" value="${view.number}"/>
                    <input type="text" class="comment_text">
                    <button class="btn btn-danger boardBtn" data="comment_write" name="commentBtn">작성</button>
                </div>

                <div class="comment_list">
                
                rows="10" cols="10"
                 --%>
                
                
                <!--    댓글          -->

<!--     댓글 끝     -->
                
               

                    <%-- <c:forEach items="${value}" var="comment">
                        <div class="comment_content">
                            <c:if test="${value.coDepth > 0 }">
                                <c:set var="wid" value="${value.coDepth*15 }"></c:set>
                                <img src='<c:url value="../resources/images/level.png"/>' style="width: ${wid}px; margin-right:0;">
                                <img src='<c:url value="../resources/images/comment.png"/>' style="width: 23px; height: 23px;">
                            </c:if>
                            <img src="../resources/images/studying.png">
                            <div class="comment_info">
                                <p>
                                    <span>[${value.userId}]</span>
                                    <c:if test="${value.userId ne 'default' }">
                                        <span class="comment_preId">${value.userId}</span>
                                    </c:if>
                                    <span>${value.contents }</span>
                                </p>
                                <p>${value.coDate }</p>
                            </div>
                           <div class="comment_button btn btn-info" data="close">답글작성
                            <!-- <a href="" onclick="commentReply+'value.coGroup'"> 답글작성</a> -->
                            </div>
                            <input type="hidden" id="comment_type" value="${comment.type }">
                            <input type="hidden" id="comment_id" value="${comment.id }">
                            <input type="hidden" id="comment_gNo" value="${comment.gNo }">
                            <input type="hidden" id="comment_step" value="${comment.step }">
                            <input type="hidden" id="comment_indent" value="${comment.indent }">
                            <div class="comment_rewrite"></div>
                        </div>
                    </c:forEach>
 --%>
                </div>
            </div>
        </div>
    </div>
</div>


</div>
<div class="rightmenu" style="float:left;">
    <div class="rightmenu_nav">

        <div class="rightmenu_infowarp">
            <div class="rightmenu_info">
                <img class="rightmenu_img" src="../resources/images/studying.png">
                <div class="rightmenu_user">
                    <p>${sessionScope.user.userId }</p>
                   <%--  <p>
                        <c:if test="${sessionScope.user.auth eq 'admin' }">
                            관리자
                        </c:if>
                        <c:if test="${sessionScope.user.auth eq 'normal' }">
                            일반유저
                        </c:if>
                    </p> --%>
                </div>
            </div>
            <div class="rightmenu_connect">
                <span>최종접속기록</span>
                <span>
                    <c:choose>
                        <c:when test="${sessionScope.review.date eq null}">
                            처음 접속한 회원 입니다. ^^
                        </c:when>
                        <c:otherwise>
                            ${sessionScope.review.date}
                        </c:otherwise>
                    </c:choose>
                </span>
            </div>
        </div>

        <ul>
            <li class="rightmenu_list" data="freeboard"><i class="fas fa-angle-right"></i><span>자유게시판</span></li>
            <li class="rightmenu_list" data="study"><i class="fas fa-angle-right"></i><span>스터디룸</span></li>
            <c:if test="${user ne null }">
                <li class="rightmenu_list" data="group"><i class="fas fa-angle-right"></i><span>스터디그룹</span></li>
            </c:if>
        </ul>

        <div class="rightmenu_community">
            <p>커뮤니티활동</p>
            <%-- <div class="rightmenu_commwarp">
                <div class="rightmenu_comm">
                    <p>${sessionScope.user.visitCount }</p>
                    <p>방문한수</p>
                </div>
                <div class="rightmenu_comm">
                    <p>${sessionScope.user.boardCount }</p>
                    <p>작성한글</p>
                </div>
                <div class="rightmenu_comm">
                    <p>${sessionScope.user.groupDepth }</p>
                    <p>댓글단글</p>
                </div>
            </div> --%>
        </div>
    </div>
</div>

</div>

<!-- 정보수정 모달 -->
<div class="modal fade modifymodal_warp" id="modifyModal">
    <div class="modal-dialog modal-dialog-centered modifymodal_retop">
        <div class="modal-content modifymodal_resize">
            <div class="modal-body loginmodal_body">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <img class="rounded-circle loginmodal_image" id="profileImage" src="/resources/images/studying.png">
                <p class="modifymodal_title">변경할 사진을 원안으로 넣어 주세요</p>
                <form method="POST" id="nickForm" action="<c:url value='/member/changeNick'/>">
                    <input type="hidden" name="userId" value="${sessionScope.user.userId }">
                    <input type="hidden" name="type" value="nick">
                    <input class="modifymodal_nick" type="text" name="nick" maxlength="12" placeholder="닉네임 입력">
                    <button class="btn btn-primary modifymodal_modifybtn" type="button">변경</button>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- 메신저 모달 -->
<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
    <div class="modal-dialog" id="message_modal_layout">
        <div class="modal-content" style="background-color: transparent; border: 1px solid transparent">
            <div class="modal-body">
                <div id="message_container">
                    <div style="width: 520px">
                        <!-- 메세지 목록 부분 -->
                        <div class="card mr-2 float-left" style="width: 125px;">
                            <div class="card-header bg-custom text-white" id="message_listtitle">
                                <span>목록</span>
                            </div>
                            <div class="card-body" id="message_list">

                            </div>

                            <div class="card-footer" id="memberList_footer" ondragover="return false;" ondragenter="return false;" ondrop="drop(this, event);">
                                <div class="message_waste"></div>
                            </div>
                        </div>
                        <!-- 메세지함 부분 -->
                        <div class="card">
                            <div class="card-header bg-custom text-white" id="message_title">
                                <div class="message_userInfo">
                                    <!-- <img class="rounded-circle message_userimage" src="/images/profile/kakao/kakao-5.png"> -->
                                    <span id="message_title_text">메세지시바</span>
                                </div>
                                <div class="message_functionbtn">
                                    <img src="/images/main/find-my-friend.png" class="modal_open" data="searchModal">
                                    <img src="/images/main/friendship.png" class="modal_open" data="friendModal">
                                </div>
                            </div>

                            <div class="card-body" id="message_body">

                            </div>
                            <div class="card-footer" id="message_footer">
                                <input type="text" class="messenger_input" id="message_input" data="message">
                                <button class="btn btn-warning messenger_btn" id="message_btn" data="message">전송</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 닉네임 검색 모달 -->
<div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content col-sm-8">
            <div class="modal-header">
                <h4 class="modal-title" id="modal" style="font-weight: bold;">닉네임 검색</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>닉네임</label> <input type="text" id="search_text" class="form-control messenger_input" maxlength="15" data="search">
                </div>
                <div class="modal-footer">
                    <button class="btn btn-danger messenger_btn" id="message_search" data-dismiss="modal" aria-label="Close" data="search">검색</button>
                    <button class="btn btn-default" type="button" data-dismiss="modal" aria-label="Close">취소</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 친구신청 모달 -->
<div class="modal fade" id="friendModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content col-sm-8">
            <div class="modal-header">
                <h4 class="modal-title" id="modal" style="font-weight: bold;">친구 추가</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>닉네임</label> <input type="text" name="searchText" id="friend_text" class="form-control messenger_input" maxlength="15" data="friend">
                </div>
                <div class="modal-footer">
                    <button class="btn btn-danger friend_apply messenger_btn" id="message_friend" data-dismiss="modal" aria-label="Close" data="friend">신청</button>
                    <button class="btn btn-default" data-dismiss="modal" aria-label="Close">취소</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 비밀번호변경 모달 -->
<div class="modal fade" id="passModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content col-sm-8 passmodal_locate">
            <div class="modal-header">
                <h4 class="modal-title" id="modal" style="font-weight: bold;">비밀번호 변경</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>현재비밀번호</label> <input type="password" name="currPassword" id="currPassword" class="form-control messenger_input" maxlength="15" data="currPass">
                </div>
                <div class="form-group">
                    <label>변경비밀번호</label> <input type="password" name="changePassword" id="changePassword" class="form-control messenger_input" maxlength="15" data="changePass">
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary messenger_btn" id="pass_btn" type="button" aria-label="Close" data="changePass">변경</button>
                    <button class="btn btn-danger" data-dismiss="modal" aria-label="Close">취소</button>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- 스터디룸 모달 -->
<div class="modal fade" id="studyModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content study_modallayout">
            <div class="modal-header">
                <img src="/images/sub/study_modal.png" class="study_modalimg">
                <h4 class="modal-title study_modaltitle">스터디 등록</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body study_modalbody">
                <form method="POST" action="/study/write" enctype="multipart/form-data" id="studyForm">
                    <div class="study_bodytop">
                        <div class="bodytop_inputs">

                            <div class="form-row">
                                <div class="form-group col-sm-4">
                                    <label>분류</label>
                                    <select name="divide" class="form-control">
                                        <option value="프로그래밍">프로그래밍</option>
                                        <option value="외국어">외국어</option>
                                        <option value="자격증">자격증</option>
                                        <option value="취미">취미</option>
                                        <option value="자기계발">자기계발</option>
                                        <option value="기타">기타</option>
                                    </select>
                                </div>
                                <div class="form-group col-sm-8">
                                    <label>스터디명</label>
                                    <input type="text" class="form-control inputs_gName" name="gName">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-sm-4">
                                    <label>지역</label>
                                    <select name="area" class="form-control">
                                        <option value="서울">서울</option>
                                        <option value="경기">경기</option>
                                        <option value="강원">강원</option>
                                        <option value="충북">충북</option>
                                        <option value="전남">전남</option>
                                        <option value="경북">경북</option>
                                        <option value="경남">경남</option>
                                        <option value="부산">부산</option>
                                        <option value="제주">제주</option>
                                        <option value="기타">기타</option>
                                    </select>
                                </div>
                                <div class="form-group col-sm-4">
                                    <label>시작일자</label>
                                    <input type="text" class="form-control datepickter inputs_toPer" name="toPer">
                                </div>
                                <div class="form-group col-sm-4">
                                    <label>종료일자</label>
                                    <input type="text" class="form-control datepickter inputs_fromPer" name="fromPer">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-sm-4">
                                    <label>참여인원</label>
                                    <select name="person" class="form-control">
                                        <option value="1">1명</option>
                                        <option value="2">2명</option>
                                        <option value="3">3명</option>
                                        <option value="4">4명</option>
                                        <option value="5">5명</option>
                                        <option value="5">6명</option>
                                        <option value="5">7명</option>
                                        <option value="5">8명</option>
                                        <option value="5">9명</option>
                                        <option value="99">제한없음</option>
                                    </select>
                                </div>
                               <%--  <div class="form-group col-sm-4">
                                    <label>시작시간</label>
                                    <select name="toTime" class="form-control">
                                        <c:forEach begin="1" end="24" step="1" var="i">
                                            <c:if test="${i < 10 }">
                                                <option value="0${i }:00">0${i }:00</option>
                                            </c:if>
                                            <c:if test="${i >= 10 }">
                                                <option value="${i }:00">${i }:00</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div> --%>

                              <%--   <div class="form-group col-sm-4">
                                    <label>종료시간</label>
                                    <select name="fromTime" class="form-control">
                                        <c:forEach begin="1" end="24" step="1" var="i">
                                            <c:if test="${i < 10 }">
                                                <option value="0${i }:00">0${i }:00</option>
                                            </c:if>
                                            <c:if test="${i >= 10 }">
                                                <option value="${i }:00">${i }:00</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div> --%>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-sm-9">
                                    <label>
                                        그룹사진
                                    </label>
                                    <input type="file" class="inputs_file" name="file">
                                </div>
                            </div>
                            <!-- end bodytop_inputs -->
                        </div>

                        <div class="bodytop_locate">
                            <div class="form-row">
                                <div class="form-group col-sm-4">
                                    <label>위도</label>
                                    <input type="text" class="form-control inputs_lat" name="lat" readonly="true" style="background-color: #ffffff;">
                                </div>
                                <div class="form-group col-sm-4">
                                    <label>경도</label>
                                    <input type="text" class="form-control inputs_lng" name="lng" readonly="true" style="background-color: #ffffff;">
                                </div>
                            </div>
                            <input type="text" class="form-control" id="pac-input" name="address" style="width: 192px;">
                            <div id="map"></div>

                        </div>

                        <!-- end study_bodytop -->
                    </div>

                    <div class="study_bodybottom">

                        <div class="form-row mt-sm-2 mb-sm-2">
                            <label>세부사항</label>
                            <input type="text" class="form-control inputs_title" name="title" class="form-control">
                        </div>
                        <div class="form-row">
                            <div id="study_contenttext"></div>
                            <input type="hidden" class="study_contenttext" name="content">
                        </div>

                    </div>
                </form>
                <!-- end study_modalbody -->
            </div>

            <div class="modal-footer">
                <button class="btn btn-primary boardBtn" data="study_register">등록</button>
            </div>
        </div>
    </div>
</div>



<!-- 업로드 모달 -->
<div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content col-sm-8">
            <div class="modal-header">
                <h4 class="modal-title" id="modal" style="font-weight: bold;">첨부파일</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="POST" action="/group/upload" id="groupUpload" enctype="multipart/form-data">
                    <div class="form-group">
                        <label>내용</label> <input type="text" name="comment" class="form-control" maxlength="15">
                    </div>
                    <div class="form-group">
                        <label>첨부파일</label> <input type="file" name="file" id="groupUploadFile" class="form-control messenger_input" maxlength="15" data="friend">
                    </div>
                    <div class="modal-footer">
                    	<input type="hidden" name="gNo" id="modal_gNo">
                        <button class="btn btn-danger boardBtn" data-dismiss="modal" aria-label="Close" data="groupUpload">등록</button>
                        <button class="btn btn-default" data-dismiss="modal" aria-label="Close">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


</div>


</body>

</html>




