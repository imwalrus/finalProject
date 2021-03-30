<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>청년농장</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<!-- <link rel="stylesheet" href="resources/main/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="resources/main/css/jquery.timepicker.css"> -->
<link rel="stylesheet" href="resources/main/css/flaticon.css">
<link rel="stylesheet" href="resources/main/css/icomoon.css">
<link rel="stylesheet" href="resources/main/css/style.css">
<link rel="stylesheet" href="resources/main/css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="resources/gotoFarm/js/jquery-ui-1.10.4.custom.min.js"></script>
<link rel="stylesheet" href="resources/gotoFarm/css/datepicker/jquery-ui-1.10.4.custom.css"></link>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />
<!--grid 리스트 -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
	$(document).ready(function() {
		var selectTarget = $('.selectbox select');
		selectTarget.change(function() {
			var select_name = $(this).children('option:selected').text();
			$(this).siblings('label').text(select_name);
		});
	});
</script>
<script type="text/javascript">
    $(function () {
        $('#datetimepicker1').datetimepicker({
        	 format: 'L'
        });
        $('#datetimepicker2').datetimepicker({
        	 format: 'L',
             useCurrent: false
        });
        $("#datetimepicker1").on("change.datetimepicker", function (e) {
            var select_date = $('#datetimepicker2').datetimepicker('minDate', e.date);
        });
        $("#datetimepicker2").on("change.datetimepicker", function (e) {
            $('#datetimepicker1').datetimepicker('maxDate', e.date);
        });
    });
</script>
</head>
<body class="goto-here">
	

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
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">농산물판매</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="getFarmList">체험신청</a>
							<a class="dropdown-item" href="">체험등록</a>
							<a class="dropdown-item" href="wishlist.html">농촌속으로 문의</a>
						</div>	
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">농산물판매</a>
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
	<!-- 내비게이션 바 END -->
	<!--농촌속으로 리스트  -->
	<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
      <div class="container py-4">
	        <!-- <div class="selectbox"> 
				<label for="city_select">지역</label> 
					<select id="ex_select"> <option selected>지역 선택</option> 
											<option>대구</option> 
											<option>서울</option> 
					</select> 
			</div>
			<div class="selectbox"> 
				<label for="product_select">농작물 종류</label> 
					<select id="ex_select"> <option selected>농작물 선택</option> 
											<option>포도</option> 
											<option>사과</option> 
					</select>
			</div>		
				<div class='col-md-3 col-xs-4'>
					<label for="product_select">기간</label> 
					<div class="form-group">
						<div class="input-group date" id="datetimepicker1"
							data-target-input="nearest">
							<input type="text" class="form-control datetimepicker-input"
								data-target="#datetimepicker1" value="01/01/2021">
							<div class="input-group-append" data-target="#datetimepicker1"
								data-toggle="datetimepicker">
								<div class="input-group-text">
									<i class="fa fa-calendar"></i>
								</div>
							</div>
						</div>
					</div>
				
					<div class="form-group">
						<div class="input-group date" id="datetimepicker2"
							data-target-input="nearest">
							<input type="text" class="form-control datetimepicker-input"
								data-target="#datetimepicker2" value="01/01/2021">
							<div class="input-group-append" data-target="#datetimepicker2"
								data-toggle="datetimepicker">
								<div class="input-group-text">
									<i class="fa fa-calendar"></i>
								</div>
							</div>
						</div>
					</div>
			</div>
			<button type="button" onclick="">검색</button> -->
			

			 <!-- Product grid -->
			<%-- <div class="w3-row w3-grayscale">
				<div class="w3-col l3 s6">
					<c:forEach items="${list}" var="listt">
						<div class="w3-container">
							<ul>
								<li><span></span><span><img
										src="https://i.imgur.com/CBU1h2t.png" width="240"></span></li>
								<li><span></span><span class="text">지역</span></li>
								<li>${listt.into_city}</li>
								<li><span></span><span class="text">농작물</span></li>
								<li>${listt.into_product}</li>
								<li><span></span><span class="text">기간</span></li>
								<li>${listt.into_date}</li>
								<li><span></span><span class="text">모집 인원 수&남은 인원 수</span></li>
								<li>${listt.into_entry}</li>
								<li><a href="#"><span></span><span class="text">상세보기</span></a></li>
							</ul>
						</div>
					</c:forEach>
				</div>
			</div> 
			<%--end of product grid  --%>
			



			<div class="row d-flex justify-content-center py-5">
					<div class="container-fluid mt-5 mb-5">
						<div class="row">
							<div class="col-md-4">
								<div class="col max-mb-30 aos-init aos-animate"
									data-aos="fade-up">
									<c:forEach items="${list}" var="listt">
										<div class="block-23 mb-3">
											<ul>
												<li><span></span><span><img
														src="https://i.imgur.com/CBU1h2t.png" width="240"></span></li>
												<li><span></span><span class="text">지역</span></li>
												<li>${listt.into_city}</li>
												<li><span></span><span class="text">농작물</span></li>
												<li>${listt.into_product}</li>
												<li><span></span><span class="text">기간</span></li>
												<li>${listt.into_date}</li>
												<li><span></span><span class="text">모집 인원 수&남은
														인원 수</span></li>
												<li>${listt.into_entry}</li>
												<li><a href="#"><span></span><span class="text">상세보기</span></a></li>
											</ul>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
		</div>
	</section>
   
    <section class="ftco-section bg-light">
			<div class="container">
				<div class="row no-gutters ftco-services">
          <div class="col-lg-3 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-shipped"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">Free Shipping</h3>
                <span>On order over $100</span>
              </div>
            </div>      
          </div>
          <div class="col-lg-3 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-diet"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">Always Fresh</h3>
                <span>Product well package</span>
              </div>
            </div>    
          </div>
          <div class="col-lg-3 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-award"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">Superior Quality</h3>
                <span>Quality Products</span>
              </div>
            </div>      
          </div>
          <div class="col-lg-3 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-customer-service"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">Support</h3>
                <span>24/7 Support</span>
              </div>
            </div>      
          </div>
        </div>
			</div>
		</section>

    <footer class="ftco-footer ftco-section">
      <div class="container">
      	<div class="row">
      		<div class="mouse">
						<a href="#" class="mouse-icon">
							<div class="mouse-wheel"><span class="ion-ios-arrow-up"></span></div>
						</a>
					</div>
      	</div>
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Vegefoods</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia.</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2">Menu</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">Shop</a></li>
                <li><a href="#" class="py-2 d-block">About</a></li>
                <li><a href="#" class="py-2 d-block">Journal</a></li>
                <li><a href="#" class="py-2 d-block">Contact Us</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-4">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Help</h2>
              <div class="d-flex">
	              <ul class="list-unstyled mr-l-5 pr-l-3 mr-4">
	                <li><a href="#" class="py-2 d-block">Shipping Information</a></li>
	                <li><a href="#" class="py-2 d-block">Returns &amp; Exchange</a></li>
	                <li><a href="#" class="py-2 d-block">Terms &amp; Conditions</a></li>
	                <li><a href="#" class="py-2 d-block">Privacy Policy</a></li>
	              </ul>
	              <ul class="list-unstyled">
	                <li><a href="#" class="py-2 d-block">FAQs</a></li>
	                <li><a href="#" class="py-2 d-block">Contact</a></li>
	              </ul>
	            </div>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
						  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
          </div>
        </div>
      </div>
    </footer>
    
	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
		</svg>
	</div>
	
	<script src="resources/main/js/jquery.min.js"></script>
	<script src="resources/main/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="resources/main/js/popper.min.js"></script>
	<script src="resources/main/js/bootstrap.min.js"></script>
	<script src="resources/main/js/jquery.easing.1.3.js"></script>
	<script src="resources/main/js/jquery.waypoints.min.js"></script>
	<script src="resources/main/js/jquery.stellar.min.js"></script>
	<script src="resources/main/js/owl.carousel.min.js"></script>
	<script src="resources/main/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/main/js/aos.js"></script>
	<script src="resources/main/js/jquery.animateNumber.min.js"></script>
	<script src="resources/main/js/bootstrap-datepicker.js"></script>
	<script src="resources/main/js/scrollax.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="resources/main/js/google-map.js"></script>
	<script src="resources/main/js/main.js"></script>
</body>
</html>