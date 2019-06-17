<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 정보</title>
<link rel="shortcut icon" href="${path}/menuIntroduce/menuList">
<link rel="stylesheet" href="/resources/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/js/menuIntroduceList.js"></script>
<link href="${path}/resources/css/menuIntroduceList.css" rel="stylesheet" type="text/css">
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
                $('#setMenu').show();
                $('.burgerMenu').hide();
                $('.sideMenu').hide();
                $('.drinkMenu').hide();
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
                $(document).on("click", "#setMenu", function(){
                    $('.setMenu').show();
                    $('.burgerMenu').hide();$('.sideMenu').hide();$('.drinkMenu').hide();
                })
                 $(document).on("click", "#burgerMenu", function(){
                    $('.burgerMenu').show();
                    $('.setMenu').hide();$('.sideMenu').hide();$('.drinkMenu').hide();
                })
                $(document).on("click", "#sideMenu", function(){
                    $('.sideMenu').show();
                    $('.burgerMenu').hide();$('.setMenu').hide();$('.drinkMenu').hide();
                })
                $(document).on("click", "#drinkMenu", function(){
                    $('.drinkMenu').show();
                    $('.burgerMenu').hide();$('.sideMenu').hide();$('.setMenu').hide();
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
               <h1>Menu List</h1>  
            </div>       
        </div>
        <div class="container_box">
<!--      사이드바      -->
            <div class="aside">                    
                     <ul id="tab_btn">
                         <li id="setMenu"><button type="button" class="aside_item" >세트메뉴</button></li>
                        <li id="burgerMenu"><button type="button" class="aside_item"  >버거메뉴</button></li>
                        <li id="sideMenu"><button type="button" class="aside_item"  >사이드메뉴</button></li>
                        <li id="drinkMenu"><button type="button" class="aside_item"  >음료메뉴</button></li>
                    </ul>    
            </div>
<!--            큰 div-->
            <div id="contents">
            <div class="setMenu">
                <h3>세트메뉴</h3>
                <ul>
              <c:choose>
		<c:when test="${setList.size() > 0}">
			<c:forEach var="item" items="${setList}">
			
				<li style="cursor:pointer;" class="pNameClick" >
						<a href="/menuIntroduce/menuInfo?menuId=${item.menuId}" ><img src="/upload/${item.menuImg}"></a>
						<p class="pName">${item.menuName}</p>
				</li>
						
			</c:forEach>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
	</ul>
            </div>
            <div class="burgerMenu">    
                <h3>버거메뉴</h3>
                <ul>
                   <c:choose>
		<c:when test="${burgerList.size() > 0}">
			<c:forEach var="item" items="${burgerList}">
				<li style="cursor:pointer;" class="pNameClick" >
				<a href="/menuIntroduce/menuInfo?menuId=${item.menuId}" data-menuid="${item.menuId}"><img src="/upload/${item.menuImg}"></a>
				<p class="pName">${item.menuName}</p>
						</li>
			</c:forEach>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
	</ul>
               </div>
            <div class="sideMenu">    
                <h3>사이드메뉴</h3>
                <ul>
                      <c:choose>
		<c:when test="${sideList.size() > 0}">
			<c:forEach var="item" items="${sideList}">
				<li style="cursor:pointer;" class="pNameClick" >
				<a href="/menuIntroduce/menuInfo?menuId=${item.menuId}" data-menuid="${item.menuId}"><img src="/upload/${item.menuImg}"></a>
				<p class="pName">${item.menuName}</p>
						</li>
			</c:forEach>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
	</ul>
               </div>
            <div class="drinkMenu">    
             	<h3>음료메뉴</h3>
             	<ul>
                      <c:choose>
		<c:when test="${drinkList.size() > 0}">
			<c:forEach var="item" items="${drinkList}">
				<li style="cursor:pointer;" class="pNameClick" >
				<a href="/menuIntroduce/menuInfo?menuId=${item.menuId}" data-menuid="${item.menuId}"><img src="/upload/${item.menuImg}"></a>
				<p class="pName">${item.menuName}</p>
						</li>
			</c:forEach>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
	</ul>
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