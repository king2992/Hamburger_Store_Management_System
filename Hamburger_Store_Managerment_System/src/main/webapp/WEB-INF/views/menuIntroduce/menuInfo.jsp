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
        	
            });
        </script>
      
</head>
<body>
<%@include file="header.jsp"%> 
	<div>
		<img src="/upload/${menuInfo.menuImg}">
		<p>${menuInfo.menuName}</p>
		<p>${menuInfo.menuIntroduce}</p>
		<p>칼로리 : ${menuInfo.menuKcal} kcal</p>
	</div>
</body> 
</html>