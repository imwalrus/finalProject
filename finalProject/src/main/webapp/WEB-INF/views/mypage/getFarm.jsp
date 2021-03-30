<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../mypage/adminMenu.jsp" />

<!DOCTYPE html>
<html lang="ko">

<head>
    <title>나의 농지 리스트</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="" />
    <meta name="keywords" content="">
    <meta name="author" content="Phoenixcoded" />
    <!-- Favicon icon -->
    <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">

    <!-- vendor css -->
    <link rel="stylesheet" href="resources/admin/css/style.css">
</head>
<body>
${farm }
<div class="pcoded-main-container">
	<div class="pcoded-content">
		<!-- [ breadcrumb ] start -->
		<div class="page-header">
			<div class="page-block">
				<div class="row align-items-center">
					<div class="col-md-12">
						<div class="page-header-title">
							<h5 class="m-b-10">Cards</h5>
						</div>
						<ul class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html"><i class="feather icon-home"></i></a></li>
							<li class="breadcrumb-item"><a href="#!">Basic Components</a></li>
							<li class="breadcrumb-item"><a href="#!">Cards</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- [ breadcrumb ] end -->
		<!-- [ Main Content ] start -->
		<div class="row">
			<div class="col-md-6 col-xl-4">
				<h5>Image Caps [ Bottom ]</h5>
				<hr>
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
						<p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
					</div>
					<img class="img-fluid card-img-bottom" src="resources/admin/images/slider/img-slide-6.jpg" alt="Card image cap">
				</div>
			</div>
			<!-- [ card ] end -->
		</div>
		<!-- [ Main Content ] end -->
	</div>
</div>
    <!-- Required Js -->
    <script src="resources/admin/js/vendor-all.min.js"></script>
    <script src="resources/admin/js/plugins/bootstrap.min.js"></script>
    <script src="resources/admin/js/ripple.js"></script>
    <script src="resources/admin/js/pcoded.min.js"></script>
</body>
</html>