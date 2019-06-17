<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 마이페이지</title>
<link rel="shortcut icon" href="${path}/admin/myPage">
<link rel="stylesheet" href="/resources/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/js/adminMyPage.js"></script>
<link href="${path}/resources/css/adminMyPage.css" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script>
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
    		}
        	 $('.modal a.close-modal').removeAttr('width');
                // 클래스이름이 test 인 것을 show메소드로 보인다
                $('#personalInfomationChange').show();
                $('.withdrawal').hide();
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
                    $('.withdrawal').hide();
                })
                 $(document).on("click", "#withdrawal", function(){
                    $('.withdrawal').show();
                    $('#personalInfomationChange').hide();
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
</head>
<body>
<%@include file="header.jsp"%> 
	<div class="MyPage_box">
            <div class="MyPage">
               <h1>Admin My Page</h1>  
            </div>       
        </div>
        <div class="container_box">
<!--      사이드바      -->
            <div class="aside">                    
                     <ul id="tab_btn">
                         <li id="change"><button type="button" class="aside_item" >개인정보변경</button></li>
                        <li id="withdrawal"><button type="button" class="aside_item"  >회원탈퇴</button></li>
                    </ul>    
            </div>
<!--            큰 div-->
            <div id="contents">
                <div id="personalInfomationChange">
                <h3>개인정보변경</h3>
                <p>관리자 기본 정보</p>
                
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
                                <td>
                                	<input type="text" readonly="readonly" value="${admin.adminId}" id="adminId" class="input">
                                </td>
                            </tr>
                             <tr>
                                <td scope="col" class="table_td">
                                    	이름
                                </td>
                                <td>
                                    <input type="text" readonly="readonly" value="${admin.adminName}" class="input">
                                </td>
                            </tr>            
                             <tr>
                                <td scope="col" class="table_td">
                                    	전화번호
                                </td>
                                 <td>
                                 	<input type="text" value="${admin.adminPhone}" class="input_phone">
                                </td>
                            </tr>
                            <tr>
                                <td scope="col" class="table_td">
                                    	이메일
                                </td>
                                 <td>
                               			<c:choose>
										<c:when test="${admin.authstatus eq 'y_auth' }">
											<p class="emailPP">본인 인증 완료 된 계정입니다. </p>
										</c:when>
										<c:otherwise>
											<p class="emailP">본인 인증을 진행해주세요.</p>
											<button type="button" id="emailAuth" class="email_btn">인증하기</button>
										</c:otherwise>
									</c:choose>
									<input type="text" value="${admin.adminEmail}" id="adminEmail" class="input_email">
                                </td>
                            </tr>
                            <tr>
                                <td scope="col" class="table_td">
                                    	사업자 <br>등록번호
                                </td>
                                 <td>
                                 <div class="register">등록상태: 
                                 <c:choose>
                                 <c:when test ="${admin.businessStatus eq 'n_auth'}">
                                 <p style="color: red; font-size:14px; margin-left:3px;" id="notAuth">미등록</p>
                                 </c:when>
                                 <c:otherwise>
                                 <p style="color: green; font-size:14px; margin-left:3px;"" id="checkAuth">등록</p>
                                 </c:otherwise>
                                 </c:choose> 
                                 </div>
                                  <input type="text" class="adminPhone" id="firstBuNum" value="${businessNum2}">-
								 <input type="text" class="adminPhone" id="centerBuNum" value="${businessNum4}"> - 
								 <input type="text" class="adminPhone" id="lastBuNum" value="${businessNum6}">
								 <button type="button" class="phone_btn" id="businessAuth">인증하기</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" class="btn_type">변경하기</button>
				     <!-- Trigger/Open The Modal -->
                </form>
            </div>
<!--          회원퇄퇴                       -->
            <div class="withdrawal">    
                <h3>회원탈퇴</h3>
                    <ul>
                        <li>사용하고 계신 아이디 (${sessionScope.admin})는 탈퇴할 경우 재사용 및 복구가 불가능 합니다.</li>   
                        <li> 탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</li>
                            <br>
                            <br>
                        <li class="disc">탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</li>
                        <li class="disc">탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</li>
                    </ul>
                <button type="button" class="btn_type"  id="myBtn">회원탈퇴</button>
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
    </div>       
</body> 
</html>