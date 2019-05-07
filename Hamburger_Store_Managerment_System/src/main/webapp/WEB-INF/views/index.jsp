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
  <!-- Bootstrap core CSS -->
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 
  <!-- Custom fonts for this template -->
  <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/resources/css/grayscale.min.css" rel="stylesheet">

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
            <a class="nav-link js-scroll-trigger" href="/user/signUp">SignUp</a>
          </li>
          <li class="nav-item">
              <c:choose>
                  <c:when test="${sessionScope.user eq null }">
            <a class="nav-link js-scroll-trigger" href="/user/signIn">Login</a>
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
            <a class="nav-link js-scroll-trigger" href="/takeOutReservation/takeOutUserReservation">Take_Out</a>
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

  <!-- Bootstrap core JavaScript -->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/resources/js/grayscale.min.js"></script>

</body>

</html>
