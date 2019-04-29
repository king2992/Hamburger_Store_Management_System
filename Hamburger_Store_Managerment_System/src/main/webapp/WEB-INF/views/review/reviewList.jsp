<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReviewBoard List</title>
 <style>
 button { border-style:none; width: 70px; height:35px; background-color:#2d70be; font-weight:bold; color:#fff; cursor: pointer;}
 </style>
 <script src="https://code.jquery.com/jquery-3.3.1.js">
		function frm_search() {
			$("#searchfrm").submit();
		}
		</script>
</head>
<body>
<div>
${sessionScope.user}님 접속중
		<!-- 검색 부분 -->
		<form id="searchfrm">
		<select name="search" style="width: 100px; height: 36px;">
				<option value="title">제목만</option>
				<option value="contents">내용만</option>
				<option value="id">작성자</option>
				<option value="title_contents">제목+내용</option>
		</select>
		<input style="width:130px; height:36px;" type="search" placeholder="Search" name="keyword" />
		<button onclick="javascript:frm_search();">
			<i><img src="/resources/images/search.png"></i>
		</button>
		</form>
<!-- 		검색 시마이 --> 
<!-- 리스트 부분 -->
		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${reviewList.size() > 0}">
					<c:forEach var="list" items="${reviewList}">
						<tr>
							<td>${list.number}</td>
							<td>
							<c:if test="${list.groupDepth > 0 }">
								<c:forEach begin="1" end="${list.groupDepth}">
									<span>&nbsp;&nbsp;</span>
								</c:forEach> 
								<img src="../resources/images/reply.gif">
							</c:if>
								
							<a href="view?number=${list.number}">${list.title}</a>
							<c:if test="${list.coNum > 0}">
							<span style="color: red;">(${list.coNum})</span>
							</c:if>
							</td>
							<td>${list.id}</td>
							<td><fmt:formatDate value="${list.date}" pattern="yyyy-MM-dd"/></td>
							<td>${list.ref}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">없음</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
		</div>
	<div>
		<a href="reviewAdd"><button >글쓰기</button></a>
	</div>
		<div style="display:inline;">${paging.html}</div>	
</body>
</html>