<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<link rel="stylesheet" href="resources/main/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="resources/main/css/jquery.timepicker.css">
<link rel="stylesheet" href="resources/main/css/flaticon.css">
<link rel="stylesheet" href="resources/main/css/icomoon.css">
<link rel="stylesheet" href="resources/main/css/style.css">
<link rel="stylesheet" href="resources/main/css/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	// 검색시 pro_name + pro_content 값 같이 넘겨주기
	$(document).ready(function() {
		$("#pro_name").on('keyup', function() {
			$("#pro_content").val($(this).val())
		});
	});

	// 가격대 슬라이더
	function ShowSliderValue(sVal) {
		var obValueView = document.getElementById("slider_value_view");
		obValueView.innerHTML = sVal
	}
</script>
</head>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary" id="ftco-navbar">
	<div class="container">
		<a class="navbar-brand" href="./">청년농장</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span>
		</button>
		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a href="./" class="nav-link">Home</a></li>
				<li class="nav-item"><a href="notice" class="nav-link">공지 & FAQ</a></li>
				<li class="nav-item"><a href="education" class="nav-link">귀농교육</a></li>
				<li class="nav-item"><a href="intoTheFarm" class="nav-link">농촌속으로</a></li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">농산물판매</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="#"></a>
						<a class="dropdown-item" href="shop">판매 리스트</a>
						<a class="dropdown-item" href="shopManage">판매 관리</a>
						<a class="dropdown-item" href="shopIntroduce">판매 소개</a>
					</div></li>
				<li class="nav-item"><a href="community" class="nav-link">커뮤니티</a></li>
				<li class="nav-item"><a href="myPage" class="nav-link">마이페이지</a></li>
				<li class="nav-item"><a href="admin" class="nav-link">관리자</a></li>
				<li class="nav-item cta cta-colored"><a href="login" class="nav-link">
						<span class="icon-shopping_cart"></span>로그인
					</a></li>
			</ul>
		</div>
	</div>
</nav>
<!-- 내비바 END -->
<div class="hero-wrap hero-bread" style="background-image: url('resources/main/images/bg_1.jpg');">
	<div class="container">
		<div class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<h1 class="mb-0 bread">농산물 판매</h1>
			</div>
		</div>
	</div>
</div>
<!-- 판매 페이지 START  -->
<section class="ftco-section">
	<div class="shop-box-inner">
		<div class="container">
			<div class="row">
				<div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
					<div class="right-product-box">
						<!-- 정렬 -->
						<div class="product-item-filter row col-md-9 col-md-push-3">
							<ul class="nav nav-pills flex-column">
								<li class="nav-item"><a class="nav-link dropdown-toggle " data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">정렬</a>
									<div class="dropdown-menu" style="">
										<a class="dropdown-item" href="shop?orderCond=popular">인기 많은순</a>
										<a class="dropdown-item" href="shop?orderCond=cheap">가격 낮은순</a>
										<a class="dropdown-item" href="shop?orderCond=expensive">가격 높은순</a>
									</div></li>
							</ul>
						</div>
						<!-- 정렬 END -->
						<!-- 판매품목 -->
						<div class="product-categorie-box">
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane fade show active" id="grid-view">
									<div class="row">
										<c:forEach items="${list}" var="shop">
											<div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
												<div class="product">
													<input type="hidden" name="pro_no" value="${shop.pro_no }">
													<a href="product?pro_no=${shop.pro_no}" class="img-prod">
														<!-- 이미지 -->
														<img class="img-fluid" src="resources/main/images/${shop.pro_filename}" alt="Colorlib Template">
													</a>
													<div class="text py-3 pb-4 px-3 text-center">
														<h3>
															<!-- 이름 -->
															<a href="product?pro_no=${shop.pro_no}">${shop.pro_name }</a>
														</h3>
														<div class="d-flex">
															<div class="pricing">
																<!-- 가격 -->
																<p class="price">
																	<span class="price-sale">￦ ${shop.pro_price }</span>
																</p>
															</div>
														</div>
														<div class="bottom-area d-flex px-3">
															<div class="m-auto d-flex">
																<!-- 상세 페이지 이동 -->
																<a href="product?pro_no=${shop.pro_no}" class="add-to-cart d-flex justify-content-center align-items-center text-center">
																	<span><i class="ion-ios-menu"></i></span>
																</a>
																<!-- 장바구니 이동 -->
																<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
																	<span><i class="ion-ios-cart"></i></span>
																</a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
									<div class="row mt-5">
										<div class="col text-center">
											<div class="block-27">
												<form action="shop" name="searchFrm">
													<input type="hidden" name="page" value="1">
													<input type="hidden" name="orderCond" value="${shopVO.orderCond}">
													<input type="hidden" name="pro_name" value="${shopVO.pro_name}">
													<input type="hidden" name="pro_content" value="${shopVO.pro_content}">
													<input type="hidden" name="pro_category" value="${shopVO.pro_category}">
													<input type="hidden" name="pro_price" value="${shopVO.pro_price}">
													<my:paging paging="${paging}" jsFunc="goPage" />
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 판매품목 END -->
				<!-- 사이드바 -->
				<div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
					<div class="product-categori">
						<!-- 검색창 -->
						<div class="search-product">
							<form action="shop" class="search-form">
								<input type="hidden" name="page" value="1">
								<div class="form-group">
									<span class="icon ion-ios-search"></span>
									<input type="text" class="form-control" placeholder="Search..." id="pro_name" name="pro_name">
									<input type="hidden" class="form-control" id="pro_content" name="pro_content" value="">
								</div>
							</form>
						</div>
						<br>
						<div class="filter-sidebar-left">
							<div class="title-left">
								<!-- 카테고리 -->
								<h3>카테고리</h3>
							</div>
							<div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
								<div class="list-group-collapse sub-men">
									<div class="collapse show" id="sub-men1" data-parent="#list-group-men">
										<div class="list-group">
												<a href="shop" class="list-group-item list-group-item-action">
													전체 <small class="text-muted">(${cnt})</small>
												</a>
											<c:forEach items="${cate}" var="cate">
												<a href="shop?pro_category=${cate.pro_category}" class="list-group-item list-group-item-action">
													${cate.pro_category} <small class="text-muted">(${cate.pro_count})</small>
												</a>
											</c:forEach>					
										</div>
									</div>
								</div>
							</div>
						</div>
						<br> <br>
						<div class="filter-price-left">
							<div class="title-left">
								<h3>가격대</h3>
							</div>
							<div class="price-box-slider">
								<form action="shop">
									<div id="slider-range"></div>
									<div class="Container">
										<font size=2 id="slider_value_view">￦ 0</font>
										<input oninput='ShowSliderValue(this.value)' type="range" name="pro_price" class="custom-range" min='0' max='20000' step="1000" value='￦ 1000'>
									</div>
									<button type="submit" class="btn btn-primary">검색</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- 판매 페이지 END -->
<!-- 푸터 START -->
<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
	<div class="container py-4">
		<div class="row d-flex justify-content-center py-5">
			<div class="col-md-6">
				<h2 style="font-size: 22px;" class="mb-0">Subcribe to our Newsletter</h2>
				<span>Get e-mail updates about our latest shops and special offers</span>
			</div>
			<div class="col-md-6 d-flex align-items-center">
				<form action="#" class="subscribe-form">
					<div class="form-group d-flex">
						<input type="text" class="form-control" placeholder="Enter email address">
						<input type="submit" value="Subscribe" class="submit px-3">
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<footer class="ftco-footer ftco-section">
	<div class="container">
		<div class="row">
			<div class="mouse">
				<a href="#" class="mouse-icon">
					<div class="mouse-wheel">
						<span class="ion-ios-arrow-up"></span>
					</div>
				</a>
			</div>
		</div>
		<div class="row mb-5">
			<div class="col-md">
				<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">Vegefoods</h2>
					<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia.</p>
					<ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
						<li class="ftco-animate"><a href="#">
								<span class="icon-twitter"></span>
							</a></li>
						<li class="ftco-animate"><a href="#">
								<span class="icon-facebook"></span>
							</a></li>
						<li class="ftco-animate"><a href="#">
								<span class="icon-instagram"></span>
							</a></li>
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
							<li><a href="#">
									<span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span>
								</a></li>
							<li><a href="#">
									<span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span>
								</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 text-center">

				<p>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by
					<a href="https://colorlib.com" target="_blank">Colorlib</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
			</div>
		</div>
	</div>
</footer>
<!-- 푸터 END -->


<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
	<svg class="circular" width="48px" height="48px">
		<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
		
		<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
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
<script>
	function goPage(p) {
		//	location.href="getSearchEmp?page="+p;
		searchFrm.page.value = p;
		searchFrm.submit();
	}
</script>
</body>
</html>