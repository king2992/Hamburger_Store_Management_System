<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>

<link href="/resources/css/header.css" rel="stylesheet" type="text/css">
<!-- <link href="/resources/css/header.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
        <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src="/resources/js/mainR.js"></script> 
  
  <link rel="shortcut icon" href="/">
  Bootstrap core CSS
   <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  Custom fonts for this template
  <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
   <link href="/resources/css/mainIndex.css" rel="stylesheet" type="text/css">
       <script src="/resources/js/carousel.js"></script> 
       <link rel="stylesheet" href="/resources/css/mainR.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
     <link rel="shortcut icon" href="/"> -->
     
     
     <script src="https://code.jquery.com/jquery-3.3.1.js"></script>   
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@7.32.2/dist/sweetalert2.min.css">
<link rel="stylesheet" href="${path}/resources/css/sub.css"> 

<link href="/resources/css/mainIndex.css" rel="stylesheet" type="text/css">
<!-- <link rel="stylesheet" href="/resources/css/mainR.css">  -->
     <script>
	$(document).on("click",".dropdown",function(){
		if($(".dropdown-menu").css('display') == 'block'){
			$(".dropdown-menu").hide();
		}else{$(".dropdown-menu").show();}
	})
</script>
</head>
<body>
  <header class="header">
                    <nav class="navi navbar navbar-expand-lg navbar-light" id="mainNav">
                     <a href="/" class="navbar-brand js-scroll-trigger" style="color:rgba(255,255,255,0.5)"><img src="/resources/images/m-sa.png" class="msa"></a>
                        <ul>
                            
                          <!--   <li class="nav-item"> <a class="nav-link js-scroll-trigger" id="triggerup" href="#">SignUp</a></li> -->
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/about/aboutUs">About Us</a></li>
            				<li class="nav-item"><a class="nav-link js-scroll-trigger" href="/menuIntroduce/menuList">Menu</a></li>
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/review/reviewList">Community</a></li>
                            <li class="nav-item"><a class="nav-link js-scroll-trigger" href="/store/storeFind">Takeout</a></li>
                           
                       
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
</body>
</html>