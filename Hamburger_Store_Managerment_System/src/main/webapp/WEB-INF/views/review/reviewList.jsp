<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
 
<head>
<meta charset="UTF-8">
<title>커뮤니티 게시판</title>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@7.32.2/dist/sweetalert2.min.css">
<link rel="stylesheet" href="/resources/css/messenger.css">
<link rel="stylesheet" href="/resources/css/mainR.css">
<link rel="stylesheet" href="/resources/css/sub.css">

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- <script	src="https://cdn.jsdelivr.net/npm/sweetalert2@7.32.2/dist/sweetalert2.min.js"></script> -->
<script src="/resources/js/mainR.js"></script>

<!-- 접속현황 -->
 <c:if test="${sessionScope.user ne null }">
	<script>
		$(document).ready(function() {
			statusConnect();
		});
	</script>
</c:if>


</head>

<body>

	<div class="warp">

		<div class="layout-topheader"></div>

		<nav class="navbar navbar-expand-sm navbar-dark fixed-top layout-menu">
			<!-- Brand -->
			<a class="navbar-brand menu-title" href='<c:url value="/"/>'> <span
				class="menu-pre">store</span><span class="menu-last">management</span>
			</a>
			<!-- Links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href='<c:url value="/"/>'> <i class="fa fa-home menu-icon"></i>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href='<c:url value="/review/reviewList"/>'> <i
						class="fa fa-edit menu-icon"></i>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href='<c:url value="/study/list"/>'> <i
						class="fas fa-book menu-icon"></i>
				</a></li>
			</ul>

			<ul class="nav navbar-nav menu-infobtn">
				<li class="dropdown"><a href="#"
					class="dropdown-toggle menu-dropicon" data-toggle="dropdown"
					role="button" aria-haspopup="true" aria-expaneded="false"> <i
						class="fa fa-cog fa-spin fa-fw menu-icon"></i>
				</a>
					<div class="dropdown-menu menu-dropmenu">
						<a class="dropdown-item modal_open modal_menu" data="modifyModal"
							href="#">정보수정</a> <a class="dropdown-item modal_open modal_menu"
							data="passModal" href="#">비밀번호변경</a> <a
							class="dropdown-item modal_open modal_menu" data="logoutModal"
							href="<c:url value='${path}/user/userLogout'/>">로그아웃</a> <a
							class="dropdown-item modal_open modal_menu" data="secessionModal"
							href="#">회원탈퇴</a>
					</div></li>
			</ul>
		</nav>
		<div class="layout">
		<!-- <div class="layout-body"></div> -->
		<div class="rightmenu">
			<div class="rightmenu_nav">

				<div class="rightmenu_infowarp">
					<div class="rightmenu_info">
						<img class="rightmenu_img"
							src="../resources/images/studying.png">
						<div class="rightmenu_user">
							<p>
						
							</p>
						</div>
					</div>
				 	<div class="rightmenu_connect">
						<span>최종접속기록</span> <span> <c:choose>
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
					<li class="rightmenu_list" data="freeboard"><i
						class="fas fa-angle-right"></i><span><a href="${path}/takeOutReservation/takeOutUserReservation">Take_Out 예약 하기</a></span></li>
					<li class="rightmenu_list" data="study"><i
						class="fas fa-angle-right"></i><span><a href="${path}/kiosk/screen">Web 상품 주문 하기</a></span></li>
				<%-- 	<c:if test="${user ne null }">
						<li class="rightmenu_list" data="group"><i
							class="fas fa-angle-right"></i><span>스터디그룹</span></li>
					</c:if> --%>
				</ul>

				<div class="rightmenu_community">
					<p>커뮤니티활동</p>
					<div class="rightmenu_commwarp">
<!-- 						<div class="rightmenu_comm"> -->
<%-- 							<p>${sessionScope.user.visitCount }</p> --%>
<!-- 							<p>방문한수</p> -->
<!-- 						</div> -->
<!-- 						<div class="rightmenu_comm"> -->
<%-- 							<p>${sessionScope.user.boardCount }</p> --%>
<!-- 							<p>작성한글</p> -->
<!-- 						</div> -->
						<div class="rightmenu_comm">
							<p>${sessionScope.Review.coNum}</p>
							<p>댓글단글</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="content">

			<div class="content_subject">
				<div class="content_subjectleft">
					<img src="../resources/images/studying.png"> <span>커뮤니티 게시판</span>
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
											<img src="../resources/images/studying.png">
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
						<%--  <c:if test="${page.startPage > page.pageBlock }">
                <li class="page-item"><a class="page-link" href="/board/list?pageNum=${page.startPage-1 }">이전</a></li>
            </c:if>
            <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }" step="1">
                <c:if test="${page.pageNum eq i }">
                    <li class="page-item active"><a class="page-link" href="/board/list?pageNum=${i }">${i }</a></li>
                </c:if>
                <c:if test="${page.pageNum ne i }">
                    <li class="page-item"><a class="page-link" href="/board/list?pageNum=${i }">${i }</a></li>
                </c:if>
            </c:forEach>
            <c:if test="${page.endPage < page.pageCount }">
                <li class="page-item"><a class="page-link" href="/board/list?pageNum=${page.startPage+page.pageBlock }">다음</a></li>
            </c:if> --%>
						<li>${paging.html}</li>
					</ul>

				</div>

			</div>

		</div>

		<!-- 정보수정 모달 -->
		<div class="modal fade modifymodal_warp" id="modifyModal">
			<div class="modal-dialog modal-dialog-centered modifymodal_retop">
				<div class="modal-content modifymodal_resize">
					<div class="modal-body loginmodal_body">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<img class="rounded-circle loginmodal_image" id="profileImage"
							src="../resources/images/studying.png">
						<p class="modifymodal_title">변경할 사진을 원안으로 넣어 주세요</p>
						<form method="POST" id="nickForm"
							action="<c:url value='/member/changeNick'/>">
						<%-- 	<input type="hidden" name="id"
								value="${sessionScope.user.userId }">  --%><input
								type="hidden" name="type" value="nick"> <input
								class="modifymodal_nick" type="text" name="nick" maxlength="12"
								placeholder="닉네임 입력">
							<button class="btn btn-primary modifymodal_modifybtn"
								type="button">변경</button>
						</form>
					</div>
				</div>
			</div>
		</div>


		<!-- 메신저 모달 -->
		<div class="modal fade" id="messageModal" tabindex="-1" role="dialog"
			aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog" id="message_modal_layout">
				<div class="modal-content"
					style="background-color: transparent; border: 1px solid transparent">
					<div class="modal-body">
						<div id="message_container">
							<div style="width: 520px">
								<!-- 메세지 목록 부분 -->
								<div class="card mr-2 float-left" style="width: 125px;">
									<div class="card-header bg-custom text-white"
										id="message_listtitle">
										<span>목록</span>
									</div>
									<div class="card-body" id="message_list"></div>

									<div class="card-footer" id="memberList_footer"
										ondragover="return false;" ondragenter="return false;"
										ondrop="drop(this, event);">
										<div class="message_waste"></div>
									</div>
								</div>
								<!-- 메세지함 부분 -->
								<div class="card">
									<div class="card-header bg-custom text-white"
										id="message_title">
										<div class="message_userInfo">
											<!-- <img class="rounded-circle message_userimage" src="/images/profile/kakao/kakao-5.png"> -->
											<span id="message_title_text">메세지시바</span>
										</div>
										<div class="message_functionbtn">
											<img src="/images/main/find-my-friend.png" class="modal_open"
												data="searchModal"> <img
												src="/images/main/friendship.png" class="modal_open"
												data="friendModal">
										</div>
									</div>

									<div class="card-body" id="message_body"></div>
									<div class="card-footer" id="message_footer">
										<input type="text" class="messenger_input" id="message_input"
											data="message">
										<button class="btn btn-warning messenger_btn" id="message_btn"
											data="message">전송</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 닉네임 검색 모달 -->
		<div class="modal fade" id="searchModal" tabindex="-1" role="dialog"
			aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content col-sm-8">
					<div class="modal-header">
						<h4 class="modal-title" id="modal" style="font-weight: bold;">닉네임
							검색</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>닉네임</label> <input type="text" id="search_text"
								class="form-control messenger_input" maxlength="15"
								data="search">
						</div>
						<div class="modal-footer">
							<button class="btn btn-danger messenger_btn" id="message_search"
								data-dismiss="modal" aria-label="Close" data="search">검색</button>
							<button class="btn btn-default" type="button"
								data-dismiss="modal" aria-label="Close">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 친구신청 모달 -->
		<div class="modal fade" id="friendModal" tabindex="-1" role="dialog"
			aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content col-sm-8">
					<div class="modal-header">
						<h4 class="modal-title" id="modal" style="font-weight: bold;">친구
							추가</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>닉네임</label> <input type="text" name="searchText"
								id="friend_text" class="form-control messenger_input"
								maxlength="15" data="friend">
						</div>
						<div class="modal-footer">
							<button class="btn btn-danger friend_apply messenger_btn"
								id="message_friend" data-dismiss="modal" aria-label="Close"
								data="friend">신청</button>
							<button class="btn btn-default" data-dismiss="modal"
								aria-label="Close">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 비밀번호변경 모달 -->
		<div class="modal fade" id="passModal" tabindex="-1" role="dialog"
			aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content col-sm-8 passmodal_locate">
					<div class="modal-header">
						<h4 class="modal-title" id="modal" style="font-weight: bold;">비밀번호
							변경</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>현재비밀번호</label> <input type="password" name="currPassword"
								id="currPassword" class="form-control messenger_input"
								maxlength="15" data="currPass">
						</div>
						<div class="form-group">
							<label>변경비밀번호</label> <input type="password"
								name="changePassword" id="changePassword"
								class="form-control messenger_input" maxlength="15"
								data="changePass">
						</div>
						<div class="modal-footer">
							<button class="btn btn-primary messenger_btn" id="pass_btn"
								type="button" aria-label="Close" data="changePass">변경</button>
							<button class="btn btn-danger" data-dismiss="modal"
								aria-label="Close">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- 스터디룸 모달 -->
		<div class="modal fade" id="studyModal" tabindex="-1" role="dialog"
			aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content study_modallayout">
					<div class="modal-header">
						<img src="/images/sub/study_modal.png" class="study_modalimg">
						<h4 class="modal-title study_modaltitle">스터디 등록</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<div class="modal-body study_modalbody">
						<form method="POST" action="/study/write"
							enctype="multipart/form-data" id="studyForm">
							<div class="study_bodytop">
								<div class="bodytop_inputs">

									<div class="form-row">
										<div class="form-group col-sm-4">
											<label>분류</label> <select name="divide" class="form-control">
												<option value="프로그래밍">프로그래밍</option>
												<option value="외국어">외국어</option>
												<option value="자격증">자격증</option>
												<option value="취미">취미</option>
												<option value="자기계발">자기계발</option>
												<option value="기타">기타</option>
											</select>
										</div>
										<div class="form-group col-sm-8">
											<label>스터디명</label> <input type="text"
												class="form-control inputs_gName" name="gName">
										</div>
									</div>

									<div class="form-row">
										<div class="form-group col-sm-4">
											<label>지역</label> <select name="area" class="form-control">
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
											<label>시작일자</label> <input type="text"
												class="form-control datepickter inputs_toPer" name="toPer">
										</div>
										<div class="form-group col-sm-4">
											<label>종료일자</label> <input type="text"
												class="form-control datepickter inputs_fromPer"
												name="fromPer">
										</div>
									</div>

									<div class="form-row">
										<div class="form-group col-sm-4">
											<label>참여인원</label> <select name="person"
												class="form-control">
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
										<div class="form-group col-sm-4">
											<label>시작시간</label> <select name="toTime"
												class="form-control">
												<c:forEach begin="1" end="24" step="1" var="i">
													<c:if test="${i < 10 }">
														<option value="0${i }:00">0${i }:00</option>
													</c:if>
													<c:if test="${i >= 10 }">
														<option value="${i }:00">${i }:00</option>
													</c:if>
												</c:forEach>
											</select>
										</div>

										<div class="form-group col-sm-4">
											<label>종료시간</label> <select name="fromTime"
												class="form-control">
												<c:forEach begin="1" end="24" step="1" var="i">
													<c:if test="${i < 10 }">
														<option value="0${i }:00">0${i }:00</option>
													</c:if>
													<c:if test="${i >= 10 }">
														<option value="${i }:00">${i }:00</option>
													</c:if>
												</c:forEach>
											</select>
										</div>
									</div>

									<div class="form-row">
										<div class="form-group col-sm-9">
											<label> 그룹사진 </label> <input type="file" class="inputs_file"
												name="file">
										</div>
									</div>
									<!-- end bodytop_inputs -->
								</div>

								<div class="bodytop_locate">
									<div class="form-row">
										<div class="form-group col-sm-4">
											<label>위도</label> <input type="text"
												class="form-control inputs_lat" name="lat" readonly="true"
												style="background-color: #ffffff;">
										</div>
										<div class="form-group col-sm-4">
											<label>경도</label> <input type="text"
												class="form-control inputs_lng" name="lng" readonly="true"
												style="background-color: #ffffff;">
										</div>
									</div>
									<input type="text" class="form-control" id="pac-input"
										name="address" style="width: 192px;">
									<div id="map"></div>

								</div>

								<!-- end study_bodytop -->
							</div>

							<div class="study_bodybottom">

								<div class="form-row mt-sm-2 mb-sm-2">
									<label>세부사항</label> <input type="text"
										class="form-control inputs_title" name="title"
										class="form-control">
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
		<div class="modal fade" id="uploadModal" tabindex="-1" role="dialog"
			aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content col-sm-8">
					<div class="modal-header">
						<h4 class="modal-title" id="modal" style="font-weight: bold;">첨부파일</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form method="POST" action="/group/upload" id="groupUpload"
							enctype="multipart/form-data">
							<div class="form-group">
								<label>내용</label> <input type="text" name="comment"
									class="form-control" maxlength="15">
							</div>
							<div class="form-group">
								<label>첨부파일</label> <input type="file" name="file"
									id="groupUploadFile" class="form-control messenger_input"
									maxlength="15" data="friend">
							</div>
							<div class="modal-footer">
								<input type="hidden" name="gNo" id="modal_gNo">
								<button class="btn btn-danger boardBtn" data-dismiss="modal"
									aria-label="Close" data="groupUpload">등록</button>
								<button class="btn btn-default" data-dismiss="modal"
									aria-label="Close">취소</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>

</html>

