<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>M-SA</title>
   <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
 <!--  <script src="/resources/js/mainR.js"></script>  -->
  
  <link rel="shortcut icon" href="/">
  <!-- Bootstrap core CSS -->
   <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
   <link href="/resources/css/mainIndex.css" rel="stylesheet" type="text/css">
       <script src="/resources/js/carousel.js"></script> 
       <link rel="stylesheet" href="/resources/css/mainR.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  <!-- Custom styles for this template -->
<!--   <link href="/resources/css/grayscale.min.css" rel="stylesheet"> -->


<style>
ul{margin:0;}
p{margin:0;}
 #submit{ 
         width: 127px; 
         height: 48px; 
         text-align: center;
/*          line-height:48px;  */
         border: none; 
         background-color: rgb(36, 36, 75);
         border-radius: 10px;
        /*  margin-top:20px; */
         color: #fff; 
         margin-top: 20px; 
         cursor: pointer;
         outline:none;	 
     }
    #submit,#cancel{margin:50px 0;}
      
     #submit:hover{ 
         color: #fff; 
         background-color: #216282; 
         opacity: 0.9; 
     } 
     #cancel { 
         width: 127px; height: 48px; 
         text-align: center; 
         border: none; 
         margin-top: 20px; 
         border-radius:10px;
         cursor: pointer; 
         color:#fff;
         background-color: rgb(36, 36, 75);
         outline:none;	
     } 
     #cancel:hover{ 
         color: #fff; 
         background-color: #216282; 
         opacity: 0.9; 
     }

    .modal { 
    	border-radius:25px;
         position: fixed; 
         left: 0; 
         top: 0; 
         width: 100%; 
         height: 100%; 
         text-align:center;
         background-color: rgba(0, 0, 0, 0.5); 
         opacity: 0; 
         visibility: hidden; 
         display: block !important;
        z-index:9999;
         transform: scale(1.1); 
         transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s; 
     } 
     .modal-content { 
         padding:50px 20px 20px;
         position: absolute; 
         top: 50%; 
         left: 50%; 
         transform: translate(-50%, -50%); 
          background:#ececec; 
  /*        padding: 1rem 1.5rem;  */
         width: 450px; 
      /*    height: 600px;  */
         border-radius: 0.5rem; 
         display: inline-block;
     } 
     .close-button { 
         float: right; 
         width: 1.5rem; 
         line-height: 1.5rem; 
         text-align: center; 
         cursor: pointer; 
         border-radius: 0.25rem; 
         background-color: lightgray; 
     } 
     .close-button:hover { 
         background-color: darkgray; 
     } 
     .show-modal { 
         opacity: 1; 
         visibility: visible; 
         transform: scale(1.0); 
         transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s; 
     } 
    .tr-none{display:none;}
    /* #trigger{color:#fff;} */
 h1{ 
         font-family: 'Oswald', sans-serif; 
         font-size: 45px; 
         font-weight:700;
         margin-bottom:0;
         margin-top:50px;
     /*     color: #ececec;  */
     } 
     .mSa{margin-top:0; color: #a8a5a5;}

/*      form { 
         margin: 0 auto; 
         width: 459px; 
     }  */
     .input { 
         width: 300px; 
       /*   height: 30px; */
         line-height:30px; 
         background-color: #efefef; 
         border-radius: 10px; 
         border: 1px solid #dedede; 
         padding: 10px; 
         /* margin-top: 3px;  */
         margin-bottom:20px;
         font-size: 0.9em; 
         color: #3a3a3a; 
     	margin:0 auto;
     	display: block;
         
     } 
        .input:focus{ 
             border: 1px solid #97d6eb; 
        } 
        input[name=userId]{margin-bottom:25px; margin-top:30px;}
        input[name=userPhone]{margin-bottom:25px; margin-top:30px;}
        input[name=userName]{margin-bottom:25px; margin-top:30px;}
        
        /* signup */
        
        #submitup{ 
         width: 127px; 
         height: 48px; 
         text-align: center;
/*          line-height:48px;  */
         border: none; 
         background-color: rgb(36, 36, 75);
         border-radius: 10px;
        /*  margin-top:20px; */
         color: #fff; 
         margin-top: 20px; 
         cursor: pointer; 
         outline:none;	
     }
/*     #submitup,#cancelup{margin-top:70px;} */
      
     #submitup:hover{ 
         color: #fff; 
         background-color: #216282; 
         opacity: 0.9; 
     } 
     #cancelup { 
         width: 127px; height: 48px; 
         text-align: center; 
         border: none; 
         margin-top: 20px; 
         border-radius:10px;
         cursor: pointer; 
         color:#fff;
         background-color: rgb(36, 36, 75);
         outline:none;	
     } 
     #cancelup:hover{ 
         color: #fff; 
         background-color: #216282; 
         opacity: 0.9; 
     }
	/*관리자 회원가입*/
	.adminSignup_btn {
		 width: 127px; 
		 height: 48px; 
         text-align: center; 
         border: none; 
         margin-top: 20px; 
         border-radius:10px;
         cursor: pointer; 
         color:#fff;
         background-color: rgb(121, 121, 121);
         outline:none;
/*          font-size: 13px; */
	}
	.adminSignup_btn:hover{ 
         color: #fff; 
         background-color: rgb(66, 66, 66); 
         opacity: 0.9;
         outline:none; 
     }	
	.adminlogin_btn {
		width: 127px; height: 48px; 
         text-align: center; 
         border: none; 
         margin-top: 20px; 
         border-radius:10px;
         cursor: pointer; 
         color:#fff;
         background-color: rgb(121, 121, 121);
         outline:none;	
	}
	.adminlogin_btn:hover{ 
         color: #fff; 
         background-color: rgb(66, 66, 66);
         opacity: 0.9;
         outline:none; 
     }
    .modalup { 
    	border-radius:25px;
         position: fixed; 
         left: 0; 
         top: 0; 
         width: 100%; 
         height: 100%; 
         text-align:center;
         background-color: rgba(0, 0, 0, 0.5); 
         opacity: 0; 
         visibility: hidden; 
         display: block !important;
        z-index:9999;
         transform: scale(1.1); 
         transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s; 
     } 
     .modal-contentup { 
         padding:50px 20px 50px;
         position: absolute; 
         top: 50%; 
         left: 50%; 
         transform: translate(-50%, -50%); 
          background:#ececec; 
  /*        padding: 1rem 1.5rem;  */
         width: 500px; 
  /*        height: 600px;  */
         border-radius: 0.5rem; 
     } 
     .close-buttonup { 
         float: right; 
         width: 1.5rem; 
         line-height: 1.5rem; 
         text-align: center; 
         cursor: pointer; 
         border-radius: 0.25rem; 
         background-color: lightgray; 
     } 
     .close-buttonup:hover { 
         background-color: darkgray; 
     } 
     .show-modalup { 
         opacity: 1; 
         visibility: visible; 
         transform: scale(1.0); 
         transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s; 
     } 
    .tr-none{display:none;}
    
/*     #triggerup{color:#fff;} */
 h1{ 
         font-family: 'Oswald', sans-serif; 
         font-size: 45px; 
         font-weight:700;
         margin-bottom:0;
     /*     color: #ececec;  */
     } 
     .mSa{margin-top:0; color: #a8a5a5;}

/*      form { 
         margin: 0 auto; 
         width: 459px; 
     }  */
     .input { 
         width: 300px; 
       /*   height: 30px; */
         line-height:30px; 
         background-color: #efefef; 
         border-radius: 10px; 
         border: 1px solid #dedede; 
         padding: 10px; 
         /* margin-top: 3px;  */
         margin-bottom:20px;
         font-size: 0.9em; 
         color: #3a3a3a; 
     	margin:0 auto;
     	display: block;
         
     } 
        .input:focus{ 
             border: 1px solid #97d6eb; 
        } 
        input[name=userId]{margin-bottom:25px; margin-top:30px;}
        
     .check{
	    box-shadow: 0 .1875rem .1875rem 0 rgba(0,0,0,.1)!important;
	    padding: 10px;
	    font-family: 'Varela Round';
	    font-size: 80%;
	    text-transform: uppercase;
	    letter-spacing: .15rem;
	    border: 0;
	    background-color: #64a19d;
	    border-radius: 10px;
	    color:#fff;
	    float:right;
	    position: relative;
	    right:70px;
	    top:6px;
     }   
     #userId{
     width:220px;
     }
     #idCheck{
     	font-size:12px;
     }
    .msa:hover {
	color:#fff;
}
	.msa p:hover{color:#fff;}
</style>
</head>
<body>
     <div id="container">
            <div id="center-wrap">
                <header class="header">
                    <nav class="navi navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
                     <a href="/" class="navbar-brand js-scroll-trigger msa" style="color:rgba(255,255,255,0.5)"><img src="/resources/images/m-sa.png" style="padding-bottom: 18px;"></a>
                       <ul>
                           <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/user/about">About Us</a></li>
                           <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/menuIntroduce/menuList">Menu</a></li>
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/review/reviewList">Community</a></li>
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/store/storeFind">Takeout</a></li>
                            
                            <li class="nav-item nav-admin"><a class="nav-link js-scroll-trigger" href="/user/about">About Us</a></li>
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
              <a class="dropdown-item modal_open modal_menu" href="/admin/adminLogout">Admin-LogOut</a
              ></c:when>
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
                <div style="position: relative; width: 100%; height:600px;">
          <div id="slider">
            <div class="slider_item img1"></div>
            <div class="slider_item img2"></div>
            <div class="slider_item img3"></div>
            <div class="slider_item img4"></div>
<!--            <div class="slider_item img5"></div>-->
        </div>
            </div>
                 <script>
        const SHOWING_CLASS = "showing";
        const firstSlide = document.querySelector(".slider_item:first-child");
        function slide(){
                const currentSlide = document.querySelector('.showing');
            if(currentSlide){
                currentSlide.classList.remove(SHOWING_CLASS);
                const nextSlide = currentSlide.nextElementSibling;
                if(nextSlide){
                    nextSlide.classList.add(SHOWING_CLASS);
                } else{
                    firstSlide.classList.add(SHOWING_CLASS);
                }
               }else{
                firstSlide.classList.add(SHOWING_CLASS);
            }
        }
        slide();
       setInterval(slide,6000);
            // setInterval(slide,2000); 
        </script>
  
               
            </div>
            
              <div style="clear: both; position: relative;">
        <div class="banner-wrap">
            <ul class="bannerUl">
             
                 <li>
                    <div class="autoRolling"  style="background: #8e1316">
                    <ul class="rolling community">
                     <li style=""><!-- <h3>COMMUNITY</h3><a href="">COMMUNITY</a> --></li>
                    <li style="display: none"></li>
                    <li style="display: none"></li>
                    </ul>
                    </div>
                </li>
                 <li>
                    <div class="autoRolling">
                    <ul class="rolling takeout">
                     <li style=""><!-- <h3>TakeOut</h3><a href="">TakeOut</a> --></li>
                    <li style="display: none"></li>
                    <li style="display: none"></li>
                    </ul>
                    </div>
                </li>
                 <li>
                    <div class="autoRolling" style="background: #8e1316">
                    <ul class="rolling kiosk">
                     <li><!-- <h3>Kiosk</h3><a href="">web Kiosk</a> --></li>
                    <li style="display: none"></li>
                    <li style="display: none"></li>
                    </ul>
                    </div>
                </li>
                   <li>
                    <div class="autoRolling">
                    <ul class="rolling display">
                     <li style=""><!-- <h3>Display</h3><a href="">Display</a> --></li>
                    <li style="display: none"></li>
                    <li style="display: none"></li>
                    </ul>
                    </div>
                </li>
            </ul>        
        </div>
        <div>
            <div class="mainFootArea">
                <div class="footerNoticeArea">
                    <h3>NOTICE&NEWS</h3>
                    <div class="footNoticeWrap">
                        <ul class="footNoticeUl">
                            <li>
                                <p>
                                    <a href="">공휴일 및 넷째 주 일요일 휴업</a>
                                </p>
                            </li>
                        </ul>
                    </div>
                </div>
                
                <ul class="footQuickUl">
                    <li><a href=""><img src="/resources/images/24.gif"></a></li>
<!--                     <li><a href=""><img src="images/drive.jpg"></a></li>-->
                     <li><a href=""><img src="/resources/images/home.gif"></a></li>
                     <li class="btn_ria_insta"><a href=""><img src="/resources/images/instargram.gif"></a></li>
                     <li class="btn_ria_movie"><a href=""><img src="/resources/images/grow.gif"></a></li>
                </ul>
            </div>          
        </div>
                  
                   <footer class="footer">
                    <div class="inner">
                        <address>
                            <p>대전광역시 동구 우암로 352-21 대표문의 : 010-8950 - 1914</p>
                            <p>고객지원센터 010-5456-0801 (고객불편사항 등)대표자:주이원박조</p>
                            <p>COPYRIGHT &copy; 2019 M-SA ALL RIGHT RESERVED</p>
                        </address>
                        <div>
                            <img src="/resources/images/footer2.jpg">
                            <img src="/resources/images/footer.jpg">
                            <img src="/resources/images/footer4.gif">
                            <img src="/resources/images/footer5.gif">
                            <img src="/resources/images/footer6.gif">
                        </div>
                        
                        
                    </div>
                </footer>
    </div>
        </div>

<!-- 로그인 모달창 -->

 	<div class="modal">
		<div class="modal-content">
			<span class="close-button">&times;</span>
			<h1 class="title">M-SA</h1>
			<p class="mSa">Mobile-Substation Automation</p>
<!-- 			<form action="/user/signIn" method="POST" name="signIn" enctype="multipart/form-data"> -->
			 <input type="text" class="input" name="userId" id="signInId" placeholder="ID" required="required">
			  <input type="password" class="input" name="userPassword"id="signInPassword" placeholder="password" required="required">
				<input type="button" id="cancel" value="취소"> 
				<!-- <input type="submit" id="submit" value="보내기"> -->
				<input type=submit id="submit" class="loginSubmit" value="로그인">
<!-- 			</form> -->
				<button type="button" id="adminLogin" class="adminlogin_btn">관리자 로그인</button>
		</div>
	</div>
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
					}else if(data.authstatus == "n_auth"){
						alert("이메일 본인인증을 진행해주세요.");
						location.href="/admin/myPage";
					}else if(data.businessStatus == "n_auth"){
						alert("사업자 등록번호 인증을 진행해주세요.");
						location.href="/admin/myPage";
					}
				}
			})	
		}
		
		$(document).on("click", "#adminLogin", function(){
			location.href = "/admin/adminLogin";
		})
		$(document).on("click", ".loginSubmit", function(){
			var signInId = $("#signInId").val();
			var signInPassword = $("#signInPassword").val();
			
			$.ajax({
				data : {"userId" : signInId, "userPassword" : signInPassword},
				url : "/user/signIn",
				success : function(data){
					if(data == 1){
						alert("로그인 되었습니다.");
						location.href="/";
					}else if(data == 0){
						alert("아이디 또는 비밀번호를 확인해주세요.");
					}
				}
			})
		})
	})
	</script>
<!-- 회원가입 모달창 -->
<div class="modalup">
		<div class="modal-contentup">
			<span class="close-buttonup">&times;</span>
			<h1 class="title">M-SA</h1>
			<p class="mSa">Mobile-Substation Automation</p>
			<form action="/user/signUp" method="POST" name="signUp" id="signIn" enctype="multipart/form-data">
			<button type="button" onClick="idCk()" class="check">중복체크</button>
				 <input type="text" class="input" name="userId" placeholder="ID"  id="userId">
				 <p id="idCheck"></p>
				 <input type="password" class="input" name="userPassword" placeholder="password" id="userPassword">
				 <p id="pwCheck"></p>
				 <input type="text" class="input" name="userName" placeholder="your name" id="userName" >
				 <p id="nameCheck"></p>
				 <div class="phoneDiv">
				 <select class="selectPhone" style="width: 92.72px;">
				 	<option value="010">010</option>
				 </select> -
				 <input type="text" class="selectPhone" name="userPhone1" style="ime-mode:disabled; height:45px;" id="userPhone1"> -
				 <input type="text" class="selectPhone" name="userPhone2" id="userPhone2" style="ime-mode:disabled; height:45px;" >
				 </div>
				 <p id="phoneCheck"></p>
			 <input type="button" id="cancelup" value="취소"> 
				<!-- <input type="submit" id="submit" value="보내기"> -->
				<input type="button" id="submitup" value="가입하기" >
				<button type="button" id="adminAdd" class="adminSignup_btn">관리자 회원가입</button>
			</form>
		</div> 
	</div>
<!-- login modal -->
	<script type="text/javascript">
	
	var modal = document.querySelector(".modal");
	var trigger = document.querySelector("#trigger");
	var closeButton = document.querySelector(".close-button");
	var cancelButton = document.querySelector("#cancel");
	var menuNameArray = new Array();
	var menuCntArray = new Array();

	//console.log(modal);

	function toggleModal() {
		modal.classList.toggle("show-modal");
	}

	function windowOnClick(event) {
		if (event.target === modal) {
			toggleModal();
		}
	}

	trigger.addEventListener("click", toggleModal);
	closeButton.addEventListener("click", toggleModal);
	cancel.addEventListener("click", toggleModal);
	window.addEventListener("click", windowOnClick);
	</script>
	
	<script type="text/javascript">
	var modalup = document.querySelector(".modalup");
	var triggerup = document.querySelector("#triggerup");
	var closeButtonup = document.querySelector(".close-buttonup");
	var cancelButtonup = document.querySelector("#cancelup");
	var menuNameArray = new Array();
	var menuCntArray = new Array();

	//console.log(modal);

	function toggleModalup() {
		modalup.classList.toggle("show-modalup");
	}

	function windowOnClickup(event) {
		if (event.target === modalup) {
			toggleModalup();
		}
	}

	triggerup.addEventListener("click", toggleModalup);
	closeButtonup.addEventListener("click", toggleModalup);
	cancelup.addEventListener("click", toggleModalup);
	window.addEventListener("click", windowOnClickup);


	var idCkCnt = 0;
	function idCk(){
		var userId = $("#userId").val(); 
		
		$.ajax({
			type : 'POST',
			url : "/user/idCk",
			dataType : "json",
			data : userId,
			contentType: "application/json; charset=UTF-8",
			success : function(data){
				if(data.cnt > 0){
					$("#idCheck").text("이미 사용중인 아이디 입니다.");
					$("#userId").focus();
				}else {
					$("#idCheck").text("사용 가능 한 아이디 입니다.");
					$("#userPassword").focus();
					idCkCnt = 1;
				}
			}
		});
	}
	

	$(document).ready(function(){
		$(document).on("click", "#adminAdd", function(){
			$(".modalup show-modalup").hide();
			$(".modal-contentup").hide();
			location.href="/admin/adminAdd";
		})
		var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
		
		$(document).on('keydown', '#userId', function(){
			var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
			var userId = $("#userId").val();
			
			
			if(userId.length < 7){
				$("#idCheck").text("아이디는 8~16자로 입력해주세요.");
			}else{
				$("#idCheck").text("ok");	
			}
			
		})
		$(document).on('keydown', '#userPassword', function(){
			var userPassword = $("#userPassword").val();
			
			if(userPassword.length < 7){
				$("#pwCheck").text("비밀번호는 8~16자로 입력해주세요.");
			}else{
				$("#pwCheck").text("ok");	
			}
			
		})
		
		$(document).on('keydown', '#userName', function(){
			var userName = $("#userName").val();
			
		})
		$(document).on('keydown', '[name=userPhone1]', function(e){
			var userPhone1 = $("[name=userPhone1]").val();
			var regexp = /^[0-9]*$/
				if(userPhone1.length < 4){
					$("#phoneCheck").text("숫자만 입력해주세요.");
				}
				if( !regexp.test(userPhone1) ) {
					//$(this).val(userPhone.replace(regexp,''));
					$("#phoneCheck").text("숫자만 입력해주세요.");
					$("[name=userPhone1]").val("");	
				
				}else if(userPhone1.length == 3){
					$("#phoneCheck").text("OK");
				}
		})
		$(document).on('keydown', '[name=userPhone2]', function(e){
			var userPhone2 = $("[name=userPhone2]").val();
			var regexp = /^[0-9]*$/
				if(userPhone2.length < 4){
					$("#phoneCheck").text("숫자만 입력해주세요.");
				}
				if( !regexp.test(userPhone2) ) {
					//$(this).val(userPhone.replace(regexp,''));
					$("#phoneCheck").text("숫자만 입력해주세요.");
					$("[name=userPhone2]").val("");	
				
				}else if(userPhone2.length == 3){
					$("#phoneCheck").text("OK");
				}
		})
		$(document).on("click","#submitup",function(){
			var form = document.signUp;
			var userId = document.userId;
			var userPw = document.userPassword;
			var userPhone1 = document.userPhone1;
			var userPhone2 = document.userPhone2;
			var userName = document.userName;
			var userPhoneId1 = $("#userPhone1").val();
			var userPhoneId2 = $("#userPhone2").val();
			
			if(form.userId.value == ""){
				$("#idCheck").text("아이디는 8~16자로 입력해주세요.");
				$("#userId").focus();
			}
			else if(form.userPassword.value == ""){
				$("#pwCheck").text("비밀번호를 입력해 주세요");
				$("#userPassword").focus();
			}else if(form.userName.value == ""){
				$("#nameCheck").text("이름을 입력해 주세요");
				$("#userName").focus();
			}else if(form.userPhone1.value == ""){
				$("#phoneCheck").text("전화번호를 입력해 주세요");
				$("[name=userPhone1]").focus();
			}else if(form.userPhone2.value == ""){
				$("#phoneCheck").text("전화번호를 입력해 주세요");
				$("#userPhone").focus();
			}
			else{
				if(userPhoneId1.length != 4 ){
					alert("전화번호 양식이 맞지 않습니다.");
					$("#userPhone1").val("");
					$("#userPhone2").val("");
					$("#userPhone1").focus();
					
				} else if(userPhoneId2.length !=4 ){
					alert("전화번호 양식이 맞지 않습니다.");
					$("#userPhone2").val("");
					$("#userPhone1").val("");
					$("#userPhone1").focus();
				}else if(idCkCnt == 1){
					alert("회원가입을 환영합니다.");
					form.submit();	
				}else if(idCkCnt == 0){
					alert("아이디 중복체크를 해주시기 바랍니다.");
				}
				
			}
		})
		
	})
	
	</script>


  <!-- Bootstrap core JavaScript -->
<!--   <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

  <!-- Plugin JavaScript -->
<!--   <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script> -->

  <!-- Custom scripts for this template -->
<!--   <script src="/resources/js/grayscale.min.js"></script> -->

</body>

</html>
