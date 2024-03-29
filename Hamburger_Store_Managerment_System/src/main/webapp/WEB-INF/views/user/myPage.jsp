<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/mypage.css">
<link rel="shortcut icon" href="${path}/user/myPage">
<link href="/resources/css/header.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/js/personalInfomationChange.js"></script>
<script type="text/javascript" src="/resources/js/myWritten.js"></script>
<script type="text/javascript" src="/resources/js/MYcard.js"></script>
<link rel="stylesheet" href="/resources/css/personalInfomationChange.css">
<script type="text/javascript" src="/resources/js/userTakeoutReservedLIst.js"></script>
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/mainR.css">
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@7.32.2/dist/sweetalert2.min.css"> 
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<!-- Remember to include jQuery :) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
        <script>
        $(document).ready(function(){
        	 $('.modal a.close-modal').removeAttr('width');
                // 클래스이름이 test 인 것을 show메소드로 보인다
                $('#personalInfomationChange').show();
                $('.myWritten,.TakeoutReservedLIst,.withdrawal,.cardAdd,.MYcard').hide();
                /*$('#contents').hide();*/
                // #tab_btn li 클릭 시 함수 실행해서
                $('#tab_btn li').on('click', function(){
                  
                    //#contents 보여줘
                   $('#contents').show();
                    // list 라는 변수를 만들어서 $(this) 는 #tab_btn li 의 순서를 구한다index()
                    var list = $(this).index();
                    // removeClass 는 on 이라는 클래스 이름을 삭제
                    $('#tab_btn li').removeClass('on');
                    // addClass 는 on 이름을 추가 
                    $(this).addClass('on');
                    //  추가
                    $("#tab_btn li").each(function(){
                        $(this).css("background", "white");
                        if($(this).attr("class") == "on"){
                            $(this).css("background", "#ffd9a3");
                        }
                    });
                  
                }); 
                $(document).on("click", "#change", function(){
                    $('#personalInfomationChange').show();
                    $('.myWritten,.TakeoutReservedLIst,.withdrawal,.cardAdd,.MYcard').hide();
                })
                 $(document).on("click", "#userPayCardUpdate", function(){
                    $('.cardAdd').show();
                    $("#change").css("background", "#ffd9a3");
                    $('.myWritten,.TakeoutReservedLIst,.withdrawal,#personalInfomationChange,.MYcard').hide();
                })
                $(document).on("click", "#MyCard", function(){
                    $('.MYcard').show();
                    $("#change").css("background", "#ffd9a3");
                    $('.myWritten,.TakeoutReservedLIst,.withdrawal,#personalInfomationChange,.cardAdd').hide();
                })
                 $(document).on("click", "#myWriten", function(){
                    $('.myWritten').show();
                    $('#personalInfomationChange,.TakeoutReservedLIst,.withdrawal,.cardAdd,.dropDown,.MYcard').hide();
                })
                 $(document).on("click", "#takeoutReservedList", function(){
                    $('.TakeoutReservedLIst').show();
                    $('#personalInfomationChange,.myWritten,.withdrawal,.cardAdd,.dropDown,.MYcard').hide();
                })
                 $(document).on("click", "#withdrawal", function(){
                    $('.withdrawal').show();
                    $('.myWritten,.TakeoutReservedLIst,#personalInfomationChange,.cardAdd,.dropDown,.MYcard').hide();
                })
            });
        </script>
        <script>
            $(document).on("click","#change",function(){
               if($('.dropDown').is(':visible')){
               $('.dropDown').css('display','none');
               }
                else{
                    $('.dropDown').css('display','block');
               }
            });
           
        </script>
        <script type="text/javascript">
     
        	$(document).on("click",".dropdown",function(){
        		if($(".dropdown-menu").css('display') == 'block')
        			$(".dropdown-menu").css('display','none');
        		else
        			$(".dropdown-menu").css('display', 'block');
        	});
        	window.onload = function(){
        		console.log("${sessionScope.card}");
        	}
        
        </script>
        <style>
        	.test{display: block !important;}
            #tab_btn li:hover button{color: #ff6c00;}
            /*header 부분*/
            .test{display: block !important;}
            .aside_item:hover {color: #ff6c00;}
            .fa-cog:before {content: "\f013";}
            .navbar-brand {margin:0 0 0 -8px;}
            .navi ul {margin:0 0 0 90px;}
            .menu-icon {margin-left:-12px;}
            html a:hover{text-decoration:none !important;}
            .msa {position: relative; bottom: 7px;}
        </style>
    </head>
    <body>
         <header class="header">
                    <nav class="navi navbar navbar-expand-lg navbar-light" id="mainNav">
                     <a href="/" class="navbar-brand js-scroll-trigger" style="color:rgba(255,255,255,0.5)"><img src="/resources/images/m-sa.png" class="msa"></a>
                        <ul>
                            
                          <!--   <li class="nav-item"> <a class="nav-link js-scroll-trigger" id="triggerup" href="#">SignUp</a></li> -->
                            
            				<li class="nav-item"><a class="nav-link js-scroll-trigger" href="/about/aboutUs">About Us</a></li>
                            <li class="nav-item nav-admin"><a class="nav-link js-scroll-trigger" href="/kiosk/screen">Kiosk</a></li>
                            <li class="nav-item nav-admin"><a class="nav-link js-scroll-trigger" href="/pos/posmanagement">Pos</a></li>
                            <li class="nav-item nav-admin"><a class="nav-link js-scroll-trigger" href="/order/orderDisplay">Display</a></li>
                       
                        </ul>
                          <ul class="nav navbar-nav menu-infobtn">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle menu-dropicon" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expaneded="false">
                        <i class="fa fa-cog fa-spin fa-fw menu-icon"></i>
                    </a>
                    <div class="dropdown-menu menu-dropmenu">
                        <a class="dropdown-item modal_open modal_menu" data="modifyModal" id="triggerup" href="#">SignUp</a>
          <c:choose>
	           <c:when test="${sessionScope.user eq null && sessionScope.admin eq null}"> <!-- 사용자 로그인 -->
	      		    <a class="dropdown-item modal_open modal_menu" href="#"  id="trigger">Login</a>
	          </c:when>
          	  <c:when test="${sessionScope.user ne null }">
              		<a class="dropdown-item modal_open modal_menu" href="/user/userLogout">User-LogOut</a><!-- 사용자 로그아웃 -->
              </c:when>
              <c:when test="${sessionScope.admin ne null}"> 
              		<a class="dropdown-item modal_open modal_menu" href="/admin/adminLogout">Admin-LogOut</a>
              </c:when>
          </c:choose>
          
          <c:choose>
          <c:when test="${sessionScope.user ne null }">
            <a class="dropdown-item modal_open modal_menu" href="/user/myPage">User-My-Page</a>
          </c:when>
          <c:when test="${sessionScope.admin ne null }">
          <a class="dropdown-item modal_open modal_menu" href="/admin/myPage">Admin-My-Page</a>
          </c:when>
          </c:choose>
                    </div>
                </li>
            </ul>
                    </nav>
                </header>
        <div class="MyPage_box">
            <div class="MyPage">
               <h1>My Page</h1>  
            </div>       
        </div>
        <div class="container_box">
<!--      사이드바      -->
            <div class="aside">                    
                     <ul id="tab_btn">
                         <li id="change"><button type="button" class="aside_item" >개인정보변경</button></li>
                            <!--<ul class="dropDown">-->
                        <li id="userPayCardUpdate" class="dropDown" style="border:none; padding-bottom: 1px;"><button type="button" class="userPayCardUpdate">
                            <img src="/resources/images/cardAdd_03.png" class="cardAdd_img">카드 등록</button></li>
                            
                        <li id="MyCard" class="dropDown" style="padding-top: 10px;"><button type="button" class="ButtonMyCard">
                                <img src="/resources/images/cardAdd_03.png" class="cardAdd_img2">MY 카드</button></li>
                        <li id="myWriten"><button class="aside_item" >내가 작성 한 글</button></li>
                        <li id="takeoutReservedList"><button type="button" class="aside_item" >TakeOut 예약 내역</button></li>
                        <li id="withdrawal"><button type="button" class="aside_item"  >회원탈퇴</button></li>
                    </ul>    
            </div>
<!--            큰 div-->
            <div id="contents">
                <div id="personalInfomationChange">
                <h3>개인정보변경</h3>
                <p>회원 기본 정보</p>
                
                <form name="Regist" id="Regist" method="post" style="height:470px;">
                    <table width="100%" cellpadding="0" cellspacing="0" class="tb_type" summary="회원 기본 정보 테이블">
                        <colgroup>
                            <col width="20%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                                <td scope="col" class="table_td">
                                   	 아이디
                                </td>
                                <td>${user.userId}</td>
                            </tr>         
                            <tr>
                                <td scope="col" class="table_td">
                                   	 비밀번호
                                </td>
                                <td>
                                    <input type="password" class="userPw" name="password" id="password" title="비밀번호 입력">
                                    <button type="button" class="pwChange">비밀번호 변경</button>
                                </td>
                            </tr> 
                             <tr>
                                <td scope="col" class="table_td">
                                    	전화번호
                                </td>
                                 <td>
                                 <select name="phon" id="phon" class="first_number" title="전화번호 앞자리 입력">
                                     <option value="010" selected> 010</option>
                                     <option value="011"> 011</option>
                                     <option value="011"> 016</option>
                                     <option value="011"> 017</option>
                                     <option value="011"> 018</option>
                                     <option value="011"> 019</option> 
                                 </select> -
                                    <input type="text" class="userPhone" name="userPhone1" id="number"  value="${phone2}" title="전화번호 중간자리 입력"> -
                                    <input type="text" class="userPhone" name="userPhone2" id="number" value="${phone4}" title="전화번호 마지막자리 입력">
                                </td>
                            </tr>
                             <tr>
                                <td scope="col" class="table_td">
                                    	이름
                                </td>
                                <td>
                                    <input type="text" class="userName" name="name" id="name" value="${user.userName}" title= "이름 입력">
                                </td>
                            </tr>                
                        </tbody>
                    </table>
                    <button type="button" class="btn_type"  id="userInfoUpdate">변경하기</button>
				     <!-- Trigger/Open The Modal -->
				 
				    <!-- The Modal -->
				    <div id="myModal" class="modal">
				      <!-- Modal content -->
				      <div class="modal-content">
				        <a href="#"><span class="close">&times;</span></a>
				        <h5>비밀번호 변경</h5>                                                               
				     <ul class="pwUpdate">
						<li><span>현재 비밀번호<input type="password" class="nowPw"></span></li>
						<li><span>새 비밀번호<input type="password" class="newPw"></span></li>
						<li><span>새 비밀번호 확인<input type="password" class="newPwCheck"></span></li>
					</ul>
					<div><button type="button" class="pwUpSubmit">변경하기</button></div>
				      </div>
				    </div>
                </form>
            </div>
<!--      내가 작성 한 글      -->
                <div class="myWritten">
                    <h3>내가 작성 한 글</h3>
                    <table class="myWritten-table">
                        <thead class="myWrittenHead">
                            <tr>
                                <th class="thead"></th>
                                <th class="thead">작성일</th>
                                <th class="thead title">제목</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody class="myWrittenContainer">
                        <c:choose>
							<c:when test="${myWrittenList.size() > 0 }">
								<c:forEach items="${myWrittenList}" var="list">
                            <tr>
                                <th><button type="button" class="boardMove" data-number="${list.number}">게시글 이동</button></th>
                                <th><fmt:formatDate value="${list.date}" pattern="yyyy-MM-dd"/></th>
                                <th class="title">${list.title}</th>
                                <th><button type="button" class="boardDelete"  data-number="${list.number}" id="boardDel">게시글 삭제</button></th>
                            </tr>
                            	</c:forEach>
							</c:when>
						</c:choose>
                        </tbody>
                    </table>
                </div>
<!--      TakeOut 예약 내역      -->
                <div class="TakeoutReservedLIst">
                    <h3>TakeOut 예약 내역</h3>
                    <table class="reserved-table">
                        <thead class="reservedHead">
                            <tr>
                                <th style="width: 130px;" class="border_right">주문날짜</th>
                                <th style="width: 100px;" class="border_right">주문시간</th>
                                <th style="width: 75px;" class="border_right">예약자</th>
                                <th style="width: 173px;" class="border_right">예약자 전화번호</th>
                                <th style="width: 300px;" class="border_right">지점</th>
                                <th style="width: px;"></th>
                            </tr>
                        </thead>
                        <tbody class="reservedContainer">
                        <c:choose>
							<c:when test="${takeoutReservedList.size() > 0 }">
								<c:forEach items="${takeoutReservedList}" var="list">
		                            <tr>
		                                <td>${list.reservedDate}</td>
										<td>${list.reservedTime}</td>
										<td>${list.reservedName}</td>
										<td>${list.reservedPhone}</td>
		                                <td>${list.frcName}</td>
		                            	<td><a href="#modal_takeOut" rel="modal:open" ><button type="button" id="checkButton" class="reservedCheck" data-takeoutid="${list.takeoutId}">예약 확인 내역</button></a></td>
		                            </tr>
                         			</c:forEach>
								</c:when>
							</c:choose>   
                        </tbody>
                    </table>
                    
                </div>
<!--      회원탈퇴      -->
            <div class="withdrawal">    
                <h3>회원탈퇴</h3>
                    <ul>
                        <li>사용하고 계신 아이디 (${sessionScope.user})는 탈퇴할 경우 재사용 및 복구가 불가능 합니다.</li>   
                        <li> 탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</li>
                            <br>
                            <br>
                        <li class="disc">탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</li>
                        <li class="disc">탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</li>
                    </ul>
                <button type="button" class="btn_type"  id="myBtn">회원탈퇴</button>
               </div>
                <!-- MYcard Modal -->
			    <div id="MYcardModal" class="MYcard">
				      <!-- Modal content -->
				      <div class="cardmodal-content">
				      	<span class="cardmodal-close">&times;</span>
							<ul class="cardImg"> 
			                      <li class="BankName">신한은행</li>
			                      <li class="MYcardNum">1234-5678-1234-5678</li>
			                      <li class="MYcardNum">12/08</li>
			                      <li class="MYcardName">이 진 우</li>
		                    </ul>
		                    <button type="button" class="cardDelete"  id="cardDelete">삭제하기</button>
				      </div>
			    </div>
			    <!-- 영수증 -->
					<div class="documentPopup" id="modal_takeOut" style="max-width:750px; height:600px; ">
						<div class="documentCenter">
						<h2>[ 주문 내역 ]</h2>
							<table class="menuTable">
								<thead>
									<tr>
										<th>메뉴명</th>
										<th>수 량</th>
									</tr>
								</thead>
								<tbody class="documentTable" id="reservedCheckList">
								</tbody>
							</table>
							<div>
							<div class="documentBtnCenter">
								<a href="#" rel="modal:close"><button type="button" class="documentClose">닫 기</button></a>
							</div>
					</div>
						</div>

					</div>
            </div>
        </div>
 
    <!-- The Modal -->
		    <div id="myModal" class="withdrawalModal">
		      <!-- Modal content -->
		      <div class="withdrawal-modal-content">
		        <span class="withdrawal-close">&times;</span>                                                               
		        <h2 class="withdrawalH2">현재 비밀번호를 입력해주세요.</h2>
		        <input type="password" id="nowPw" class="nowPwClass">
		        <button type="button" id="userDelete" class="userDeleteClass">회원탈퇴</button>
		      </div>
		 
		    </div>
        
        </body>
        </html>