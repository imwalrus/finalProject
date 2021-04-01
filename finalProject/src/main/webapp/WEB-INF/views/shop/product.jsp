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
<!-- 상품 페이지 START  -->
<section class="ftco-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 mb-5 ftco-animate">
				<!-- 이미지 -->
				<a href="resources/main/images/${prod.pro_filename}" class="image-popup">
					<img src="resources/main/images/${prod.pro_filename}" class="img-fluid" alt="Colorlib Template">
				</a>
			</div>
			<div class="col-lg-6 product-details pl-md-5 ftco-animate">
				<!-- 상품 이름 -->
				<h3>${prod.pro_name}</h3>
				<p class="text-left mr-4">
					<a class="mr-2" style="color: #000;">
						판매자 <span style="color: #bbb;">${prod.user_name}</span>
					</a>
					<!-- ★문의하기 url 넣기★ -->
					<a href="#" class="mr-2">문의하기</a>
				<div class="rating d-flex">
					<p class="text-left mr-4">
						<a class="mr-2" style="color: #000;">
							카테고리 <span style="color: #bbb;">${prod.pro_category}</span>
						</a>
					</p>
					<p class="text-left">
						<a class="mr-2" style="color: #000;">
							재고 <span style="color: #bbb;">${prod.pro_quantity}개</span>
						</a>
					</p>
				</div>
				<!-- 가격 -->
				<p class="price">
					<c:set var="price" value="${prod.pro_price}"/>
					<span>￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${price}"/></span>
				</p>
				<p>
					<span style="color: #000;">배송사 :</span> ${prod.pro_dcompany}
				</p>
				<p>
					<c:set var="dcost" value="${prod.pro_dcost}"/>
					<span style="color: #000;">배송비 :</span> ￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${dcost}"/>
				</p>
				<!-- 내용 -->
				<p>${prod.pro_content}</p>
				<div class="row mt-4">
					<div class="input-group col-md-6 d-flex mb-3">
						<span class="input-group-btn ml-2">
							<button type="button" class="quantity-left-minus btn" data-type="minus" data-field="">
								<i class="ion-ios-remove"></i>
							</button>
						</span>
						<input type="text" id="quantity" name="quantity" class="form-control input-number" value="1" min="1" max="100">
						<span class="input-group-btn mr-2">
							<button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
								<i class="ion-ios-add"></i>
							</button>
						</span>
					</div>
				</div>
				<p>
					<!-- ★장바구니, 구매 url 추가하기★ -->
					<a href="#modalAlert" class="btn btn-primary py-3 px-5" data-toggle="modal">장바구니 담기</a>
					<a href="cart.html" class="btn btn-primary py-3 px-5">바로구매</a>
				</p>
			</div>
		</div>
	</div>
	<!-- 모달 START -->
	<div id="modalAlert" class="modal fade">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- ★장바구니 action 추가★ -->
				<form action="shop">
					<div class="modal-body">
						<p>해당 상품이 장바구니에 담겼습니다.</p>
						<p>장바구니로 이동하시겠습니까?</p>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">확인</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 모달 END -->
</section>
<!-- 상품 페이지 END -->
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
	$(document).ready(function() {

		var quantitiy = 0;
		$('.quantity-right-plus').click(function(e) {

			// Stop acting like a button
			e.preventDefault();
			// Get the field name
			var quantity = parseInt($('#quantity').val());

			// If is not undefined

			$('#quantity').val(quantity + 1);

			// Increment

		});

		$('.quantity-left-minus').click(function(e) {
			// Stop acting like a button
			e.preventDefault();
			// Get the field name
			var quantity = parseInt($('#quantity').val());

			// If is not undefined

			// Increment
			if (quantity > 0) {
				$('#quantity').val(quantity - 1);
			}
		});

	});
</script>

</body>
</html>