<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포스기(관리자)</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="/resources/css/pos.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/mainR.css">
<link rel="stylesheet" href="/resources/css/sub.css"> 
<script src="/resources/js/mainR.js"></script> 
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@7.32.2/dist/sweetalert2.min.css"> 
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<script src="sweetalert2.all.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="/resources/js/posmanagement.js"></script>
<style>
/*     .active { 
    background-color: #EC5538 ;
    color: #fff;
} */
.selected {
	background-color: black;
}
#pMenuClick{
	display:none;
}
.nmg,#nmg{display:none;}
.document{
    width: 127px;
    height: 48px;
    text-align: center;
    border: none;
    margin-top: 20px;
    cursor: pointer;
    }
#submitcash{
	display:none;
 
}
[data-tooltip-text]:hover {
	position: relative;
}

[data-tooltip-text]:hover:after {
	background-color: #000000;
	background-color: rgba(0, 0, 0, 0.8);

	-webkit-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	-moz-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);

	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;

	color: #FFFFFF;
	font-size: 12px;
	content: attr(data-tooltip-text);

    margin-bottom: 10px;
	top: 70px;
	left: 0;    
	padding: 7px 12px;
	position: absolute;
	width: 200px;
	min-width: 50px;
	max-width: 600px;
	word-wrap: break-word;

	z-index: 9999;
} 
.deleteUpdate li {cursor: pointer;}

</style>
	<script>
	$(document).ready(function(){
		   var fileTarget = $('.filebox .upload-hidden');

		    fileTarget.on('change', function(){
		        if(window.FileReader){
		            // 파일명 추출
		            var filename = $(this)[0].files[0].name;
		        } 

		        else {
		            // Old IE 파일명 추출
		            var filename = $(this).val().split('/').pop().split('\\').pop();
		        };

		        $(this).siblings('.upload-name').val(filename);
		    });

		    //preview image 
		    var imgTarget = $('.preview-image .upload-hidden');

		    imgTarget.on('change', function(){
		        var parent = $(this).parent();
		        parent.children('.upload-display').remove();

		        if(window.FileReader){
		            //image 파일만
		            if (!$(this)[0].files[0].type.match(/image\//)) return;
		            
		            var reader = new FileReader();
		            reader.onload = function(e){
		                var src = e.target.result;
		                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
		            }
		            reader.readAsDataURL($(this)[0].files[0]);
		        }

		        else {
		            $(this)[0].select();
		            $(this)[0].blur();
		            var imgSrc = document.selection.createRange().text;
		            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

		            var img = $(this).siblings('.upload-display').find('img');
		            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
		        }
		    });
		});
	$(document).ready(function(){
		   var fileTarget = $('.filebox2 .upload-hidden2');

		    fileTarget.on('change', function(){
		        if(window.FileReader){
		            // 파일명 추출
		            var filename = $(this)[0].files[0].name;
		        } 

		        else {
		            // Old IE 파일명 추출
		            var filename = $(this).val().split('/').pop().split('\\').pop();
		        };

		        $(this).siblings('.upload-name2').val(filename);
		    });

		    //preview image 
		    var imgTarget = $('.preview-image2 .upload-hidden2');

		    imgTarget.on('change', function(){
		        var parent = $(this).parent();
		        parent.children('.upload-display2').remove();

		        if(window.FileReader){
		            //image 파일만
		            if (!$(this)[0].files[0].type.match(/image\//)) return;
		            
		            var reader = new FileReader();
		            reader.onload = function(e){
		                var src = e.target.result;
		                parent.prepend('<div class="upload-display2"><div class="upload-thumb-wrap2"><img src="'+src+'" class="upload-thumb2"></div></div>');
		            }
		            reader.readAsDataURL($(this)[0].files[0]);
		        }

		        else {
		            $(this)[0].select();
		            $(this)[0].blur();
		            var imgSrc = document.selection.createRange().text;
		            parent.prepend('<div class="upload-display2"><div class="upload-thumb-wrap2"><img class="upload-thumb2"></div></div>');

		            var img = $(this).siblings('.upload-display2').find('img');
		            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
		        }
		    });
		});
		        
	$(function() {
		  var select = $("select#menuCategory");

		  select.change(function() {
		    var select_name = $(this).children("option:selected").text();
		    $(this).siblings("label").text(select_name);
		  });
		});
</script>
<script type="text/javascript">
$(document).on('click', "#trigger", function(){
	console.log("왜 씨발 안나오냐 ");
	 /*$(".modal-content").show();$(".modal").show();*/
	 $(".modal").css('display','block');
	 $(".modal").css('visibility','visible');
	 $(".modal").css('opacity','1');
})
$(document).on('click','#cancel',function(){
	$(".modal").hide();
})
</script>
</head>
<body>
	<div id="container">
			<nav class="navbar navbar-expand-sm navbar-dark fixed-top1 layout-menu">
			<!-- Brand -->
			<a class="navbar-brand menu-title" href='<c:url value="/"/>'> <span
				class="menu-pre">store</span><span class="menu-last">management</span>
			</a>
			<!-- Links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href='<c:url value="/pos/posmanagement"/>'> <i class="fa fa-home menu-icon"></i>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href='<c:url value="/pos/reservedList"/>'> <i
						class="fa fa-edit menu-icon"></i>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href='<c:url value="/study/list"/>'> <i
						class="fas fa-book menu-icon"></i>
				</a></li>
			</ul>
			<div id="chat_box" style = "color : white;"></div>
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
							href="<c:url value='/user/userLogout'/>">로그아웃</a> <a
							class="dropdown-item modal_open modal_menu" data="secessionModal"
							href="#">회원탈퇴</a>
					</div></li>
			</ul>
		</nav>
	
		<div class="margin">
			<div style="width: 100%; height: 100%;">
				<section class="left-section">
					<div class="take">
						<p>Take Out</p>
					</div>
					<div class="top-table">
						<table>
							<thead>
								<tr>
									<th>상품번호</th>
									<th>상품명</th>
									<th>상품수량</th>
									<th>가격</th>
								</tr>
							</thead>
							<tbody class="orderList" id="orderList">
								
							</tbody>
						</table>
					</div>
					<div class="total">
						<table>
							<thead>
								<tr>
									<th colspan="2">총 금액  <span class="pTotal" id="pTotal"
										></span></th>
								</tr>
							</thead>
												</table>
					</div>
					<div class="crud-width">
						<ul class="crud">
							<li onclick="menuRemove()"  ><a href="#" data-tooltip-text="상품을 선택 후 눌러주세요.">지정취소</a></li>
							<li onclick="allRemove()"  ><a href="#" data-tooltip-text="전체 상품을 취소합니다.">전체취소</a></li>
							<!-- <li>수정입력</li> -->
							<li onclick="menuCntUp()"  style="cursor:pointer;" data-tooltip-text="상품을 선택 후 눌러주세요. ">+</li>
							<li onclick="menuCntDown()"   style="cursor:pointer;" data-tooltip-text="상품을 선택 후 눌러주세요.">-</li>
						</ul>
					</div>

				</section>
				<section class="right-section">
					<table class="right-table">
						<tr>
							<th class="chickenMenu">치킨 메뉴</th>
							<th class="burgerMenu">버거 메뉴</th>
							<th class="sideMenu" >사이드 메뉴</th>
							<th class="drinkMenu" >음료류</th>
						</tr>
					</table>
<ul class="ul chicken">
	<c:choose>
		<c:when test="${chicken.size() > 0}">
			<c:forEach var="item" items="${chicken}">
				<input type="hidden" class="hiddenNumber" value="${item.menuId}" style="display: none; cursor:pointer;">
				<li style="cursor:pointer;" class="pNameClick" value="${item.menuName}" data-price="${item.menuPrice}" data-number="${item.menuId}"
					data-cnt="1" data-menu="${item.menuCategory}"><p class="pName" name="${item.menuCategory}">${item.menuName}</p>
						<p class="pPrice">${item.menuPrice}</p>
						<p id="pMenuClick">${item.menuCategory}
						</li>
			</c:forEach>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
</ul>
<ul class="ul burger">
	<c:choose>
		<c:when test="${burger.size() > 0}">
			<c:forEach var="item" items="${burger}">
				<input type="hidden" class="hiddenNumber" value="${item.menuId}" style="display: none; cursor:pointer;">
				<li style="cursor:pointer;" class="pNameClick" value="${item.menuName}" data-price="${item.menuPrice}" data-number="${item.menuId}"
					data-cnt="1" data-menu="${item.menuCategory}"><p class="pName" name="${item.menuCategory}">${item.menuName}</p>
						<p class="pPrice">${item.menuPrice}</p>
						<p id="pMenuClick">${item.menuCategory}
						</li>
			</c:forEach>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
</ul>
<ul class="ul side">
	<c:choose>
		<c:when test="${sideMenu.size() > 0}">
			<c:forEach var="item" items="${sideMenu}">
				<input type="hidden" class="hiddenNumber" value="${item.menuId}" style="display: none; cursor:pointer;">
				<li style="cursor:pointer;" class="pNameClick" value="${item.menuName}" data-price="${item.menuPrice}" data-number="${item.menuId}"
					data-cnt="1" data-menu="${item.menuCategory}"><p class="pName" name="${item.menuCategory}">${item.menuName}</p>
						<p class="pPrice">${item.menuPrice}</p>
						<p id="pMenuClick">${item.menuCategory}
						</li>
			</c:forEach>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
</ul>
<ul class="ul drink">
	<c:choose>
		<c:when test="${drinkMenu.size() > 0}">
			<c:forEach var="item" items="${drinkMenu}">
				<input type="hidden" class="hiddenNumber" value="${item.menuId}" style="display: none; cursor:pointer;">
				<li style="cursor:pointer;" class="pNameClick" value="${item.menuName}" data-price="${item.menuPrice}" data-number="${item.menuId}"
					data-cnt="1" data-menu="${item.menuCategory}"><p class="pName" name="${item.menuCategory}">${item.menuName}</p>
						<p class="pPrice">${item.menuPrice}</p>
						<p id="pMenuClick">${item.menuCategory}
						</li>
			</c:forEach>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
</ul>
				</section>
				<footer>
					<div class="pay">
						<ul class="deleteUpdate">
							<li class="cardCash" onclick="card()">카드결제</li>
							<li class="triggercash">현금결제</li>
							<li><a href="#" id="trigger">메뉴등록</a></li>
							<li><a href="#" id="setAdd">세트관리</a></li>
						</ul>
					</div>
				</footer>
			</div>
		</div>
	</div>
	<!-- 팝업 될 레이어 -->
	<div class="modal">
		<div class="modal-content">
			<h1 class="title">메뉴등록</h1>
			<form action="/pos/add" method="POST" enctype="multipart/form-data">
				
				<div id="select_box">
  				<label for="menuCategory">chicken</label>
  				<select id="menuCategory" title="select menuCategory" name="menuCategory">
    			<option value="chicken" selected="selected">chicken</option>
    			<option value="burger">burger</option>
    			<option value="side">side</option>
   				 <option value="drink">drink</option>
  				</select>
				</div>
				
				 <label for="menu">MENU</label> <input type="text" name="menuName"
					placeholder="상품명을 입력해주세요." required="required"> <label></label>
				<textarea name="menuPrice" placeholder="상품가격을 입력해주세요."
					required="required"></textarea>
					
					<!-- <input type="file" name="file"> -->
					 <div class="filebox bs3-primary preview-image">
            <input class="upload-name" value="파일선택" disabled="disabled" style="width: 280px;" >
            <label for="input_file" style="vertical-align: sub;">업로드</label> 
            <input type="file" id="input_file" class="upload-hidden" name="file"> 
        </div>
				<input type="button" id="cancel" class="menuAddModalCancle" value="취소"> 
				<input type="submit" id="submit" value="보내기">
			</form>
		</div>
	</div>
	<!-- 셋트 관리 모달 -->
	<div class="setModal">
		<div class="set-modal-content">
			<h1 class="title">세트메뉴관리</h1>
		<form action="/pos/setMenuAdd" method="POST" enctype="multipart/form-data">
			
				<div id="select_box">
  				<label for="menuCategory">setSide</label>
	  				<select id="menuCategory" name="menuCategory" title="select menuCategory">
		    			<option value="setSide" selected="selected">setSide</option>
		    			<option value="setDrink">setDrink</option>
	  				</select>
				</div>
				
				<label for="menuName">MENU</label>
				 <input type="text" name="menuName" placeholder="상품명을 입력해주세요." required="required">
				  <label></label>
				<textarea name="menuPrice" placeholder="상품가격을 입력해주세요." required="required"></textarea>
					
			 <div class="filebox2 bs3-primary2 preview-image2">
				<input class="upload-name2" value="파일선택" disabled="disabled" style="width: 280px;" >
	            <label for="input_file2" style="vertical-align: sub;">업로드</label> 
	            <input type="file" id="input_file2" class="upload-hidden2" name="file"> 
        		</div>
				<input type="button" id="cancle" class="setMenuModalCancel" value="취소"> 
				<input type="submit" id="submit" value="보내기">
		</form>
		</div>
	</div>

	<!-- 현금결제 레이어 -->
	<div class="modalcash"> 
    <div class="modal-contentcash"> 
        <h1 class="titlecash">현금결제</h1> 
        <form action="/pos/orders" class="formcash" id="frm"method="POST">
          <label for="total" class="labelcash" >총 금액</label> 
          <input type="text" name="payTotal"  id="payTotal2"  class="inputcash" readonly="readonly"> 
          <label class="labelcash">받은 금액 입력란</label> 
          <input type="text" name="payTotal2" placeholder="받은 금액" id="payTotal" class="inputcash" required="required">
          <input type="button" class="document" value="거스름돈 출력">
          <label class="labelcash nmg">거스름돈</label>
          <input type="text" id="nmg" name="nmg" readonly="readonly"> 
          <input type="button" id="cancelcash" value="취소"> 
          <input type="button" id="submitcash" onclick ="send()" value="보내기"> 
        </form> 
    </div> 
</div>
</body>
</html>