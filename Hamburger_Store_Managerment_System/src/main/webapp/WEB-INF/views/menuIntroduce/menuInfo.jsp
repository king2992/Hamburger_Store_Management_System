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
           
            });
        </script>
      <style>
         #container{
            width: 100%;
         }
         .center-wrap{width:1020px;
    min-height: 780px;
    margin: 0 auto;
    padding: 22px 0 125px;
    position: relative;}
   #aside {
    float: left;
}
.conbg_top {
    float: left;
  /*   width: 788px; */
    margin-left: 7px;
}
#contents {
   /*  width: 788px; */
    margin-top: 15px;
}
#contents p{
}
.con_top {
    width: 728px;
    margin: 0 auto;
    border-bottom: 2px solid #e0e0e0;
}
.menu_txt p{color: #141414 !important; font-size:15px !important;}

#con_toph3 {
    padding: 0 0 20px 0;
    font-size: 40px;
    letter-spacing: -5px;
    line-height: 115px;
   
}
.con_top h3{float:left;}
.content2 {
    width: 728px;
    margin: 0 auto;
    position: relative;
}
.menu_view {
    padding: 35px 0 100px;
}
.menu_view .menu_top {
    margin-bottom: 40px;
}
.menu_view .menu_image {
    width: 361px;
    height: 315px;
    line-height: 315px;
    float: left;
    text-align: center;
    margin-right: 26px;
}
.menu_view .menu_image .big_frame {
    position: relative;
    width: 361px;
    height: 315px;
}
.menu_view .menu_image .menu_img {
    position: absolute;
    left: 1px;
    top: 1px;
    width: 361px;
    height: 315px;
}
.menu_view .menu_txt {
    float: left;
    margin-bottom: 40px;
    width: 341px;
/*     margin-left: 30px; */
}
.menu_view h4 {
    width: 341px;
    padding: 0 0 10px;
    color: #3f3f3f;
    font-weight: bold;
    font-size: 30px;
    letter-spacing: -5px;
    background: url(../../img/menu/menu_tit_line.gif) no-repeat left bottom;
}
.menu_view p {
    padding: 30px 0 0;
    background: none;
    color: #3f3f3f;
    word-break: break-all;
}
.table_01 {
    width: 722px;
    margin: 0 auto;
    border-top: 2px solid #ed2542;
    border-bottom: 1px solid #898989;
    margin: 60px 0 10px;
    font-size: 13px;
    color: #3f3f3f;
}
.table_01 th {
    border-bottom: 1px dashed #d1d1d1;
    text-align: center;
    padding:15px;
}
.table_01 td {
    text-align: center;
    padding: 15px;
}
.btn_list {
    float: right;
    display: block;
    overflow: hidden;
}
h5 {
    font-weight: bold;
    font-size: 13px;
    color: #3f3f3f;
    padding-left: 13px;
    position: relative;
    top: 48px;
}
      </style>
</head>
<body>
<%@include file="header.jsp"%> 
   <div id="container">
      <div class="center-wrap">
           <div class="aside">                    
                     <ul id="tab_btn">
                         <li id="setMenu"><button type="button" class="aside_item" >세트메뉴</button></li>
                        <li id="burgerMenu"><button type="button" class="aside_item"  >버거메뉴</button></li>
                        <li id="sideMenu"><button type="button" class="aside_item"  >사이드메뉴</button></li>
                        <li id="drinkMenu"><button type="button" class="aside_item"  >음료메뉴</button></li>
                    </ul>    
            </div>
        
      <div class="conbg_top">
      <div id="contents">
         <div class="con_top">
            <h3 id="con_toph3">${menuInfo.menuName}</h3>
         </div>
         <div class="content2">
         <div class="menu_view">
         <div class="menu_top">
            <div class="menu_image">
               <div class="big_frame">
               <span class="menu_img">
               <img src="/upload/${menuInfo.menuImg}">
               </span>
               </div>
            </div>
            <div class="menu_txt">
               <h4>${menuInfo.menuName}</h4>
               <p>다양한 양념과 버터가 들어간 양념 소스와 갈릭 <br> 후레이크로 고소하고 깊은 인도의 풍미를 바삭하게 <br> 즐길 수 있는 치킨!</p>
               <p>※알레르기 유발식품 <br>&nbsp; : 난류, 우유, 대두, 밀, 새우, 토마토, 닭고기, 조개류</p>
            </div>
         </div>
         <h5 style="clear: both;">${menuInfo.menuName} 영양성분</h5>
         <table class="table_01">
            <%-- <caption>영양성분표</caption> --%>
            <thead>
               <tr>
                  <th class="first">1회제공량(g)</th>
                  <th>칼로리(kcal)</th>
                  <th>나트륨(mg)</th>
                  <th>당류(g)</th>
                  <th>포화지방(g)</th>
                  <th>단백질(g)</th>
               </tr>
            </thead>
            <tbody>
               <tr>
               <td class="first">100</td>
               <td>${menuInfo.menuKcal}</td>
               <td>356(18)</td>
               <td>7</td>
               <td>4(27)</td>
               <td>21(38)</td>
               </tr>
            </tbody>
         </table>
         <a href="btn_list">목록</a>
         </div>
      </div>
      </div>
      
      </div>
      
      
      <%--    <p>${menuInfo.menuName}</p>
      <p>${menuInfo.menuIntroduce}</p>
      <p>칼로리 : ${menuInfo.menuKcal} kcal</p> --%>
      </div>
   
   </div>
</body> 
</html>