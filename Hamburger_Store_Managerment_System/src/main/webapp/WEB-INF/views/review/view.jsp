<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:if test="${sessionScope.user == null}">
<script type="text/javascript">
		alert("로그인 하신 후에 이용해 주세요.");
			location.href="${pageContext.request.contextPath}/";
</script>
</c:if>
<meta charset="UTF-8">
<title></title>
<style>
.replyBtn{width:99px; height:56px; position:relative; top:10px; right:-5px; clear:both;}
.re { position:relative; top:18px; float:left; left:10px;} 
/* .commentInfo {margin-left:74px;} */
.commentList{display:block; clear:both;}
.reply{width:883px; height:57px; margin-left:8px; margin-right:8px; margin-top:7px; resize: none; float:left;}
.comment_contents{width:883px; height:57px; margin-left:8px; margin-right:8px; margin-top:7px; resize: none; float:left;}
.add_button{width:99px; height:56px; margin-top:9px; border-style:none; background-color:#5a5a71; text-align: center; font-size:12pt; color: #ffffff;  position:relative; top:65px; right:90px; clear:both;}
.button_list{width:1000px; height:65pxcommentContent; float:left; }
button {border-style:none; width: 70px; height:35px; font-weight:bold; color:#fff; cursor: pointer;}
.listbutton{width:70px; height:35px; margin-top:20px; margin-left:7px; float:left; cursor: pointer; background-color: #2d70be;  border-style: none; font-weight:bold; color:#ffffff;}
.delBtn{width:70px; height:35px; margin-top:20px; margin-left:7px; float:left; cursor: pointer; background-color: #2d70be;  border-style: none; font-weight:bold; color:#ffffff;}
</style>
<link rel="shortcut icon" type="image/x-icon" href="/resources/images/etc/check.ico" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(".delBtn").on("click", function ()
		// 첨부파일명들을 배열에 저장
		var arr = [];
		$(".uploadedFileList").each(function)() {
			arr.push($(this).attr("data-src"));
		});
		
		// 첨부파일 삭제요청
		if (arr.length > 0) {
			$.post("/review/file/deleteAll", {files: arr}, function() {
				
			});
		}
		
</script>
</head>
<body>
   <div>
      <div>
         <span>번호:</span>
         <span>${view.number}</span>
      </div>
      <div>commentContent
         <span>작성자:</span>
         <span>${view.id}</span>
      </div>
      <div>
        <span>제목:</span>
      	<span>${view.title}</span>
      </div>
      
      <div>
      	<span>내용:</span>
      	<span>${view.contents}</span>
      
      </div>
      
      <div>
         <span>조회:</span>
         <span>${view.ref}</span>
      </div>
      
      <div>
         <span>좋아요:</span>
         <span>${view.reLike}</span>
      </div>
      
      <div>
         <span>첨부파일:</span>
         <span><a href="/upload/${view.file}" target="_blank">${view.file}</a></span>
      </div>
      
      <div>
         <span>작성일:</span>
         <span><fmt:formatDate value="${view.date}" pattern="yyyy-MM-dd hh:mm:ss"/></span>
      </div>
   </div>
   <div class="button_list">
      <span><button class="listbutton"><a href="reviewList">목록</a></button></span>   
      <span><button class="listbutton"><a href="like?number=${view.number}">좋아요</a></button></span>
      <span><button class="listbutton"><a href="reviewUp?number=${view.number}">수정</a></button></span>
      <span><button class="delBtn"><a href="delete?groupNum=${view.groupNum}">삭제</a></button></span>
   </div>

</body>
</html>