<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>관리자</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="" />
<meta name="keywords" content="">
<meta name="author" content="Phoenixcoded" />
<!-- 관리자 부트스트랩 css -->
<link rel="stylesheet" href="resources/admin/css/style.css">
<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body class="">
	<tiles:insertAttribute name="header" />
	<!-- [ navigation menu ] start -->
	<nav class="pcoded-navbar menu-light ">
		<div class="navbar-wrapper  ">
			<div class="navbar-content scroll-div ">
				<div class="">
					<div class="main-menu-header">
						<div class="user-details">
							<div id="more-details">
								<i class="fa fa-caret-down"></i>내정보 보기?
							</div>
						</div>
					</div>
					<div class="collapse" id="nav-user-link">
						<ul class="list-unstyled">
							<li class="list-group-item"><a href="user-profile.html">
									<i class="feather icon-user m-r-5"></i>View Profile
								</a></li>
							<li class="list-group-item"><a href="#!">
									<i class="feather icon-settings m-r-5"></i>Settings
								</a></li>
							<li class="list-group-item"><a href="auth-normal-sign-in.html">
									<i class="feather icon-log-out m-r-5"></i>Logout
								</a></li>
						</ul>
					</div>
				</div>

				<ul class="nav pcoded-inner-navbar ">
					<li class="nav-item"><a href="admin" class="nav-link ">
							<span class="pcoded-micon"><i class="feather icon-home"></i></span><span class="pcoded-mtext">메인</span>
						</a></li>
					<li class="nav-item pcoded-hasmenu"><a href="javascript:;" class="nav-link ">
							<span class="pcoded-micon"><i class="material-icons people">&#xe7fb;</i></span><span class="pcoded-mtext">회원 관리</span>
						</a>
						<ul class="pcoded-submenu">
							<li><a href="adminUser">회원 관리</a></li>
							<li><a href="adminFarmer">농업인 권한 신청 현황</a></li>
						</ul></li>
					<li class="nav-item pcoded-hasmenu"><a href="#!" class="nav-link ">
							<span class="pcoded-micon"><i class="material-icons dashboard">&#xe871;</i></span><span class="pcoded-mtext">게시판 관리</span>
						</a>
						<ul class="pcoded-submenu">
							<li><a href="#">배너 관리</a></li>
							<li><a href="adminIntoFarm">농촌속으로 관리</a></li>
							<li><a href="adminOrder">판매 현황</a></li>
							<li><a href="adminCommunity">커뮤니티 관리</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- [ navigation menu ] end -->

	<tiles:insertAttribute name="content" />

	<!-- Required Js -->
	<script src="resources/admin/js/vendor-all.min.js"></script>
	<script src="resources/admin/js/plugins/bootstrap.min.js"></script>
	<script src="resources/admin/js/ripple.js"></script>
	<script src="resources/admin/js/pcoded.min.js"></script>
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
	<script src="resources/main/js/main.js"></script>
</body>
</html>