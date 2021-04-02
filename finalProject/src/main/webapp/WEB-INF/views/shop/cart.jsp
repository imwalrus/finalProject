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
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
	// form - hidden 수량에 수량값 넘겨주기
	$(document).ready(function() {
		$("#count").on({
			keyup : function() {
				$("#hcount").val($(this).val())
			},
			click : function() {
				$("#hcount").val($(this).val())
			}
		});
	});
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
						<a class="dropdown-item" href="prodManage">판매 관리</a>
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
<!-- 장바구니 START  -->
<section class="pt-5 pb-5">
	<div class="container">
		<div class="row w-100">
			<div class="col-lg-12 col-md-12 col-12">
				<h3 class="display-5 mb-2 text-center">장바구니</h3>
				<p class="mb-5 text-center">
				<table id="shoppingCart" class="table table-condensed table-responsive">
					<thead>
						<tr>
							<th style="width: 55%">상품정보</th>
							<th style="width: 12%">판매가</th>
							<th style="width: 10%">수량</th>
							<th style="width: 12%"></th>
						</tr>
					</thead>
					<tbody>
						<!-- 총액 계산 -> c:set 태그 설정(총액 변수명 price) -->
						<c:set var="price" value="0" />
						<!-- c:forEach START -->
						<c:forEach items="${cart}" var="cart" varStatus="status">
							<tr>
								<form action="updateCart" method="post">
								<td data-th="Product">
									<input type="hidden" name="pro_no" value="${cart.pro_no}">
									<div class="row">
										<div class="col-md-3 text-left">
											<!-- 이미지 -->
											<img src="resources/main/images/${cart.pro_filename}" alt="" class="img-fluid d-none d-md-block rounded mb-2 shadow ">
										</div>
										<div class="col-md-9 text-left mt-sm-2">
											<!-- 상품명 · 상품 내용 -->
											<h4>${cart.pro_name}</h4>
											<p class="font-weight-light">${cart.pro_content}</p>
										</div>
									</div>
								</td>
								<!-- 판매가(jstl - 3자리마다 ',') -->
								<c:set var="com" value="${cart.cart_price}" />
								<td data-th="Price">
									￦
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${com}" />
								</td>
								<td data-th="Quantity">
									<!-- 수량 -->
									<input type="text" class="form-control-sm" name="cart_count" value="${cart.cart_count}">
								</td>
								<td class="actions" data-th="">
									<div class="text-right">
										<!-- 수량 수정 · 삭제 버튼 -->
										<button class="btn btn-white border-secondary bg-white btn-md mb-2">
											<i class="material-icons refresh">&#xe5d5;</i>
										</button>
										<a type="button" href="deleteCart?cart_no=${cart.cart_no}" class="btn btn-white border-secondary bg-white btn-md mb-2">
											<i class="material-icons close_fullscreen">&#xe14c;</i>
										</a>
									</div>
								</td>
								</form>
							</tr>
							<!-- 총액 계산 -> c:set 태그 종료 -->
							<c:set var="price" value="${price + cart.cart_price}" />
						</c:forEach>
						<!-- c:forEach END -->
					</tbody>
				</table>
				<div class="float-right text-right">
					<h4>총 결제금액</h4>
					<!-- jstl - 총액 계산 · 3자리마다 ','  -->
					<c:set var="com" value="${price}" />
					<h1>
						￦
						<fmt:formatNumber type="number" maxFractionDigits="3" value="${com}" />
					</h1>
				</div>
			</div>
		</div>
		<div class="row mt-4 d-flex align-items-center">
			<div class="col-sm-6 order-md-2 text-right">
				<!-- 주문 버튼 -->
				<a href="#" class="btn btn-success mb-4 btn-lg pl-5 pr-5">주문하기</a>
			</div>
			<div class="col-sm-6 mb-3 mb-m-1 order-md-1 text-md-left">
				<a href="shop">
					<!-- '<- 쇼핑 계속하기' -->
					<i class="material-icons arrow_back">&#xe5c4;<strong> 쇼핑 계속하기</strong></i>
				</a>
			</div>
		</div>
	</div>
</section>
<!-- 장바구니 END -->
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
</body>
</html>