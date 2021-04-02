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
<link rel="stylesheet" href="netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	// 툴팁 활성화
	$(document).ready(function(){
		$('[data-toggle="tooltip"]').tooltip();
	});

	// modal-단건 보기 불러오기
	function modalView(str){
	   $('#modal .modal-content').load("modalView?pro_no=" + str);
	   $('#modal').modal();
	}
	
	// modal-등록 폼 불러오기
	function modalInsert(){
	   $('#modal .modal-content').load("modalInsert");
	   $('#modal').modal();
	}
	
	// modal-수정 폼 불러오기
	function modalUpdate(str){
	   $('#modal .modal-content').load("modalUpdate?pro_no=" + str);
	   $('#modal').modal();
	}
	
	//번호 값 삭제 모달로 넘기기
	function delFunc(e){
		var tds = $(e.target).closest("tr").children()
		console.log(tds.eq(0).html());
		$('#pro_no').val(tds.eq(0).html());
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
<!-- 관리 페이지 START  -->
<section class="ftco-section">
	<div class="container">
		<div class="row">
			<div class="col-auto mr-auto">
				<h2>
					<b>판매 관리</b>
				</h2>
			</div>
			<div class="col-auto">
				<a href="javascript:;" class="btn btn-success" onclick="modalInsert()">
					<span>상품 등록</span>
				</a>
				<a href="shop" class="btn btn-primary">
					<span>판매 리스트</span>
				</a>
			</div>
			<table class="table table-hover">
				<thead>
					<tr class="table-primary">
						<th scope="col">No.</th>
						<th scope="col">이름</th>
						<th scope="col">가격</th>
						<th scope="col">수량</th>
						<th scope="col">상태</th>
						<th scope="col">이미지</th>
						<th scope="col" align="center">카테고리</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${manage}" var="manage">
						<tr>
							<th scope="row">${manage.pro_no}</th>
							<td>${manage.pro_name}</td>
							<td>${manage.pro_price}원</td>
							<td>${manage.pro_quantity}</td>
							<td>${manage.pro_condition}</td>
							<td>${manage.pro_filename}</td>
							<td>${manage.pro_category}</td>
							<td>
							<a href="javascript:;" class="view" onclick="modalView('${manage.pro_no}')">
							<i class="material-icons" data-toggle="tooltip" title="보기">&#xe8f4;</i></a>
							<a href="javascript:;" class="edit" onclick="modalUpdate('${manage.pro_no}')">
							<i class="material-icons btn-outline-warning" data-toggle="tooltip" title="수정">&#xE254;</i></a>
							<a href="#delProdModal" class="delete" data-toggle="modal" onclick="delFunc(event)">
							<i class="material-icons btn-outline-danger" data-toggle="tooltip" title="삭제">&#xE872;</i></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<form action="prodManage" name="searchFrm">
			<input type="hidden" name="page" value="1">
			<my:paging paging="${paging}" jsFunc="goPage" />
		</form>
	</div>
<!-- 단건 보기 · 등록 · 수정 Modal -->
<div class="modal" id="modal" tabindex="-1" role="dialog" aria-labelledby="historyModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    </div>
  </div>
</div>
<!-- 상품 삭제 Modal -->
<div id="delProdModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="deleteProduct" method="post">
				<input type="hidden" id="pro_no" name="pro_no">
				<div class="modal-body">				
					<p>정말로 삭제하시겠습니까?</p>
					<p class="text-warning"><small>이 작업은 되돌릴 수 없습니다.</small></p>
				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-danger" value="삭제">
					<input type="button" class="btn btn-info" data-dismiss="modal" value="닫기">
				</div>
			</form>
		</div>
	</div>
</div>
</section>
<!-- 관리 페이지 END -->
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
		//	location.href="prodManage?page="+p;
		searchFrm.page.value = p;
		searchFrm.submit();
	}
</script>
</body>
</html>