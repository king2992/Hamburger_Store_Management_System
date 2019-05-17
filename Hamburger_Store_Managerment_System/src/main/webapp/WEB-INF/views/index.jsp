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
  <title>Hamburger_Store_Managerment_System</title>
   <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
 <!--  <script src="/resources/js/mainR.js"></script>  -->
  

  <!-- Bootstrap core CSS -->
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 
  <!-- Custom fonts for this template -->
  <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/resources/css/grayscale.min.css" rel="stylesheet">

<style>
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
     }
    #submit,#cancel{margin-top:70px;}
      
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
         width: 500px; 
         height: 600px; 
         border-radius: 0.5rem; 
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
    #trigger{color:#fff;}
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
     }
    #submitup,#cancelup{margin-top:70px;}
      
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
     } 
     #cancelup:hover{ 
         color: #fff; 
         background-color: #216282; 
         opacity: 0.9; 
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
        
         transform: scale(1.1); 
         transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s; 
     } 
     .modal-contentup { 
         padding:50px 20px 20px;
         position: absolute; 
         top: 50%; 
         left: 50%; 
         transform: translate(-50%, -50%); 
          background:#ececec; 
  /*        padding: 1rem 1.5rem;  */
         width: 500px; 
         height: 600px; 
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
    
    #triggerup{color:#fff;}
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
        
        
        
        
        
</style>
</head>

<body id="page-top">

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="#page-to8up">Team2</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <!-- <a class="nav-link js-scroll-trigger" href="/user/signUp">SignUp</a> -->
             <a class="nav-link js-scroll-trigger" id="triggerup" href="#">SignUp</a>
          </li>
          <li class="nav-item">
              <c:choose>
                  <c:when test="${sessionScope.user eq null }">
          <a class="nav-link js-scroll-trigger" href="#"  id="trigger">Login</a> 
          </c:when>
          <c:otherwise>
              <a class="nav-link js-scroll-trigger" href="/user/userLogout">LogOut</a>
            </c:otherwise>
          </c:choose>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/review/reviewList">Community</a>
          </li>
           <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/store/storeFind">Takeout</a>
          </li>
           <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/kiosk/screen">Web 주문기(사용자)</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="/pos/posmanagement">포스기(관리자)</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Header -->
  <header class="masthead">
    <div class="container d-flex h-100 align-items-center">
      <div class="mx-auto text-center">
        <h1 class="mx-auto my-0 text-uppercase">Hamburger Store Management System</h1>
        <h2 class="text-white-50 mx-auto mt-2 mb-5">햄버거 매장 관리 시스템</h2>
        <a href="#about" class="btn btn-primary js-scroll-trigger">Go</a>
      </div>
    </div>
  </header>


 

  <!-- Footer -->
  <footer class="bg-black small text-center text-white-50">
    <div class="container">
      Copyright &copy; team2 Website 2019
    </div>
  </footer>

<!-- 로그인 모달창 -->

 	<div class="modal">
		<div class="modal-content">
			<span class="close-button">&times;</span>
			<h1 class="title">M-SA</h1>
			<p class="mSa">Mobile-Substation Automation</p>
			<form action="/user/signIn" method="POST" name="signIn" enctype="multipart/form-data">
			 <input type="text" class="input" name="userId" id="signInId" placeholder="ID" required="required">
			  <input type="password" class="input" name="userPassword"id="signInPassword" placeholder="password" required="required">
				<input type="button" id="cancel" value="취소"> 
				<!-- <input type="submit" id="submit" value="보내기"> -->
				<input type=submit id="submit" value="로그인">
			</form>
		</div>
	</div>

<!-- 회원가입 모달창 -->
<div class="modalup">
		<div class="modal-contentup">
			<span class="close-buttonup">&times;</span>
			<h1 class="title">M-SA</h1>
			<p class="mSa">Mobile-Substation Automation</p>
			<form action="/user/signUp" method="POST" name="signUp" id="signIn" enctype="multipart/form-data">
				 <input type="text" class="input" name="userId" placeholder="ID"  id="userId"><button type="button" onClick="idCk()" class="btn btn-primary">중복체크</button>
				 <p id="idCheck"></p>
				 <input type="password" class="input" name="userPassword" placeholder="password" id="userPassword">
				 <p id="pwCheck"></p>
				 <input type="text" class="input" name="userName" placeholder="your name" id="userName" >
				 <p id="nameCheck"></p>
				 <input type="text" class="input" name="userPhone" placeholder="phone number" id="userPhone" >
				 <p id="phoneCheck"></p>
			 <input type="button" id="cancelup" value="취소"> 
				<!-- <input type="submit" id="submit" value="보내기"> -->
				<input type="button" id="submitup" value="가입하기" onclick="signUpGoData()">
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
	function signUpGoData(){
		var form = document.signUp;
		var userId = document.userId;
		var userPw = document.userPassword;
		var userPhone = document.userPhone;
		var userName = document.userName;
		
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
		}else if(form.userPhone.value == ""){
			$("#phoneCheck").text("전화번호를 입력해 주세요");
			$("#userPhone").focus();
		}
		else if(form.userId.value != "" && form.userPassword.value != ""){
			
			if(idCkCnt == 1){
				alert("회원가입을 환영합니다.")	
				form.submit();	
			}else if(idCkCnt == 0){
				alert("아이디 중복체크를 해주시기 바랍니다.")
			}
			
		}
	}

	$(document).ready(function(){
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
		$(document).on('keyup', '#userPhone', function(e){
			var userPhone = $("#userPhone").val();
			var regexp = /^[0-9]*$/
				if(userPhone.length <= 11){
					$("#phoneCheck").text("숫자만 입력해주세요.");
				}
				if( !regexp.test(userPhone) ) {
					//$(this).val(userPhone.replace(regexp,''));
					$("#phoneCheck").text("숫자만 입력해주세요.");
					$("#userPhone").val("");	
				
				}else if(userPhone.length == 11){
					$("#phoneCheck").text("OK");
				}
		})
		
	})
	
	</script>



  <!-- Bootstrap core JavaScript -->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/resources/js/grayscale.min.js"></script>

</body>

</html>
