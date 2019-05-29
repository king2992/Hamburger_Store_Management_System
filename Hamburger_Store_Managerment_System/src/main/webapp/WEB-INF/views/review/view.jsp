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
                    <a class="nav-link" href='<c:url value="#"/>'>
                        <i class="fa fa-edit menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href='<c:url value="#"/>'>
                        <i class="fas fa-book menu-icon"></i>
                    </a>
                </li>
                <c:if test="${user ne null }">
                    <li class="nav-item">
                        <a class="nav-link" href='<c:url value="#"/>'>
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
                <c:choose>
                	<c:when test="${view.reLike eq 0 }">
                		<div class="view_like" onclick="likeAdd()">
                			<img src="${path}/resources/images/unlike.png">
                			<span>좋아요</span>
                			<span>${view.reLike }</span>
                		</div>
                	</c:when>
                	<c:otherwise>
                		<div class="view_like" onclick="likeMin()">
                			<img src="${path}/resources/images/like.png">
                			<span>좋아요</span>
                			<span>${view.reLike }</span>
                		</div>
                	</c:otherwise>
                </c:choose>
                
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
</div>
</body>
</html>