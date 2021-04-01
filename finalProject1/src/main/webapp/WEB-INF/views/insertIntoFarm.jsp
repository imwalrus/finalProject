<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--홈페이지 include-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/main/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="resources/main/css/animate.css">
<link rel="stylesheet" href="resources/main/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/main/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/main/css/magnific-popup.css">
<link rel="stylesheet" href="resources/main/css/aos.css">
<link rel="stylesheet" href="resources/main/css/ionicons.min.css">
<link rel="stylesheet" href="resources/main/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="resources/main/css/jquery.timepicker.css">
<link rel="stylesheet" href="resources/main/css/flaticon.css">
<link rel="stylesheet" href="resources/main/css/icomoon.css">
<link rel="stylesheet" href="resources/main/css/style.css">
<link rel="stylesheet" href="resources/main/css/bootstrap.css">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

<title>체험등록/</title>
</head>

<!--start of nav-bar  -->
<body class="goto-here">
<script>
   $(document).ready(function() {
		  $('#summernote').summernote({
		    	placeholder: '체험 프로그램 소개(소개,일정,준비물안내,오시는길,담당자이름,담당자 전화번호)',
		    	height: 300,  
		        minHeight: null,
		        maxHeight: null,
		        /* focus: true,  */
		        lang : 'ko-KR',
		        toolbar: [
				    // [groupName, [list of button]]
				    ['fontname', ['fontname']],
				    ['fontsize', ['fontsize']],
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    ['color', ['forecolor','color']],
				    ['table', ['table']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']],
				    ['insert',['picture','link','video']],
				    ['view', ['fullscreen', 'help']]
				  ],
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		  });
		});
   
   function insertFarm() {
		var into_city = frm.into_city.value;
		var into_title = frm.into_title.value;
		var into_product = frm.into_product.value;
		var into_phone = frm.into_phone.value;
		var into_date = frm.into_date.value;
		var into_entry = frm.into_entry.value;
		var into_info = frm.into_info.value;
		
		if (into_city.trim() == ''){
			alert("지역을 선택해주세요");
			return false;
		}
		if (into_title.trim() == ''){
			alert("체험이름을 입력해주세요");
			return false;
		}
		if (into_product.trim() == ''){
			alert("농작물 종류를 선택해주세요");
			return false;
		}
		if (into_phone.trim() == ''){
			alert("연락처를 입력해주세요");
			return false;
		}
		if (into_date.trim() == ''){
			alert("일정을 선택해주세요");
			return false;
		}
		if (into_entry.trim() == ''){
			alert("참여가능 인원 수를 입력해주세요");
			return false;
		}
		if (into_info.trim() == ''){
			alert("내용을 입력해주세요");
			return false;
		}
		var yn = confirm("등록하시겠습니까?")
		
		if(yn) {
			frm.action = "insertFarm";
			frm.submit();
		}
	}
   </script>
   <nav class="navbar navbar-expand-lg navbar-dark bg-primary" id="ftco-navbar">
      <div class="container">
         <a class="navbar-brand" href="./">청년농장</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> 
         </button>

         <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
               <li class="nav-item active">
                  <a href="./" class="nav-link">Home</a>
               </li>
               <li class="nav-item">
                  <a href="notice" class="nav-link">공지 & FAQ</a>
               </li>
               <li class="nav-item">
                  <a href="education" class="nav-link">귀농교육</a>
               </li>
               <li class="nav-item">
                  <a href="intoTheFarm" class="nav-link">농촌속으로</a>
               </li>
               <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="shop" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">농산물판매</a>
                  <div class="dropdown-menu" aria-labelledby="dropdown04">
                     <a class="dropdown-item" href="shop"></a>
                     <a class="dropdown-item" href="wishlist.html">Wishlist</a>
                     <a class="dropdown-item" href="product-single.html">Single Product</a>
                     <a class="dropdown-item" href="cart.html">Cart</a>
                     <a class="dropdown-item" href="checkout.html">Checkout</a>
                  </div>
               </li>
               <li class="nav-item">
                  <a href="community" class="nav-link">커뮤니티</a>
               </li>
               <li class="nav-item">
                  <a href="myPage" class="nav-link">마이페이지</a>
               </li>
               <li class="nav-item">
                  <a href="admin" class="nav-link">관리자</a>
               </li>
               <li class="nav-item cta cta-colored">
                  <a href="login" class="nav-link"><span class="icon-shopping_cart"></span>로그인</a>
               </li>
            </ul>
         </div>
      </div>
   </nav>
<!-- end of nav -->

<h2 style="text-align: center;">체험 등록</h2><br><br><br>

<div style="width: 60%; margin: auto;">
   <form id="frm" method="post" action="insertFarm" enctype="multipart/form-data">
      <input type="hidden" name="user_id" id="user_id" value="a">
      <select name="into_city" id="city-select" style="margin-top:1%;">
          <option value="">--지역을 선택 하여 주십시오--</option>
          <option value="광주">광주</option>
          <option value="대구">대구</option>
          <option value="대전">대전</option>
          <option value="독도">독도</option>
          <option value="부산">부산</option>
          <option value="서울">서울</option>      
          <option value="울릉도">울릉도</option>
          <option value="울산">울산</option>
          <option value="인천">인천</option>
          <option value="제주도">제주도</option>
      </select><br>

      <input type="text" name="into_title" style="width: 40%; margin-top: 1%;" placeholder="체험이름"/><br>
      <input type="text" name="into_product" style="width: 40%; margin-top: 1%;" placeholder="농작물 종류"/><br>
      <input type="text" name="into_phone" style="width: 40%; margin-top: 1%;" placeholder="연락처"/><br>
      <!--체험일정 calendar 넣기  -->
      <input type="date" name="into_date" style="width: 40%; margin-top: 1%;" placeholder="체험일정"/><br>
      <input type="text" name="into_entry" style="width: 40%; margin-top: 1%;" placeholder="참여 가능 인원 수 "/><br>
      <input multiple="multiple" type="file" name="uploadFile" id="uploadFile" accept="image/png, image/jpeg, image/jpg"><br>
      <br><br> 
      <textarea id="summernote" name="into_info"></textarea>
      
      <button type="button" id="save" onclick="insertFarm()">등록</button>
      <button type="reset" onclick="getSearchFarm">취소</button>
      
   </form>
		
	</div>

   
   
</body>
</html>