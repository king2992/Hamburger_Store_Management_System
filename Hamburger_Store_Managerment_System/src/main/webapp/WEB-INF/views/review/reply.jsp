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
</c:if>
</head>
<body>
    <div class="warp">
        <div class="layout-topheader"></div>
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
                        <a class="dropdown-item modal_open modal_menu" data="logoutModal" href="<c:url value='/user/logout'/>">로그아웃</a>
                        <a class="dropdown-item modal_open modal_menu" data="secessionModal" href="#">회원탈퇴</a>
                    </div>
                </li>
            </ul>
        </nav>
        <div class="layout-body">
            <div class="content" style="float:left;">
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
</div>
</body>
</html>
 
 