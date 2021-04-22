<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <title>청년농장</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="" />
    <meta name="keywords" content="">
    <meta name="author" content="Phoenixcoded" />
	
	 <!-- 관리자 부트스트랩 css -->
 	<link rel="stylesheet" href="resources/admin/css/style.css">
    <link rel="icon" href="resources/admin/images/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script src="resources/main/js/jquery.min.js"></script>
</head>
<script type="text/javascript">
	function showChat(){
		var pop = window.open("showChat","chat","width=1220,height=690px,resizable=no,scrollbars=no;");
	}
</script>
<body class="">
<tiles:insertAttribute name="header"/>

	<!-- [ navigation menu ] start -->
	<nav class="pcoded-navbar menu-light ">
		<div class="navbar-wrapper  ">
			<div class="navbar-content scroll-div " >
				<div class="">
					<div class="main-menu-header">
						<div class="myMenu">
							<%-- <p><strong style="font-size:25px;font-weight:bold;">${user_id}</strong>님 마이페이지</p> --%>
							<h4>${user_id }</h4>
							<c:if test="${user_auth == 'user'}">
								<p><strong>일반 유저</strong> 권한 입니다.</p>
							</c:if>
							<c:if test="${user_auth == 'farmer'}">
								<p><strong>농업인</strong> 권한 입니다.</p>
							</c:if>
 							<a href="#" class="btn chatBtn" onclick="showChat()" >CHAT
 								<c:if test="${unreadNum >= 1 }">
								&nbsp;&nbsp;&nbsp;<span class="badge badge-danger">new</span>
								</c:if> 
							</a> 
						</div>
					</div>
				</div>
				<c:if test="${user_auth =='user' }">
				<ul class="nav pcoded-inner-navbar ">
					<li class="nav-item pcoded-hasmenu">
					    <a href="#" class="nav-link "><span class="pcoded-micon"><i class="material-icons account_box">&#xe851;</i></span><span class="pcoded-mtext">내정보 관리</span></a>
					    <ul class="pcoded-submenu">
					        <li><a href="updateUser?user_id=${user_id }">회원정보수정</a></li>
					        <li><a href="memberOut?user_id=${user_id }">회원탈퇴</a></li>
                            <li><a href="insertFarmer">농업인 권한 신청</a></li>
					    </ul>
					</li>
                    <li class="nav-item pcoded-hasmenu">
					    <a href="#" class="nav-link "><span class="pcoded-micon"><i class="material-icons shopping_cart">&#xe8cc;</i></span><span class="pcoded-mtext">구매관리</span></a>
					    <ul class="pcoded-submenu">
					        <li><a href="#">장바구니</a></li>
					        <li><a href="getOrderList?user_id=${user_id}">구매내역</a></li>
					        <li><a href="getpuchasInqofUser">구매 관련 문의</a></li>
					    </ul>
                        <li class="nav-item pcoded-hasmenu">
                            <a href="#" class="nav-link "><span class="pcoded-micon"><i class="material-icons agriculture">&#xea79;</i></span><span class="pcoded-mtext">농촌속으로</span></a>
                            <ul class="pcoded-submenu">
                                <li><a href="myIntoList?user_id=${user_id }">나의 신청 내역</a></li>
                                <li><a href="getIntoFarmInqOfUser">체험 관련 문의</a></li>
                            </ul>
                        </li>
				</ul>
				</c:if>
				<c:if test="${user_auth =='farmer' }">
				<ul class="nav pcoded-inner-navbar ">
					<li class="nav-item">
					    <a href="fDiaryCalendar" class="nav-link "><span class="pcoded-micon"><i class="material-icons calendar_today">&#xe935;</i></span><span class="pcoded-mtext">영농일지</span></a>
					</li>
					<li class="nav-item pcoded-hasmenu">
					    <a href="#" class="nav-link "><span class="pcoded-micon"><i class="material-icons account_box">&#xe851;</i></span><span class="pcoded-mtext">내정보 관리</span></a>
					    <ul class="pcoded-submenu">
					        <li><a href="updateUser?user_id=${user_id }">회원정보수정</a></li>
					        <li><a href="memberOut?user_id=${user_id }">회원탈퇴</a></li>
					        <li><a href="getFarmsList">나의 농지</a></li>
					        <li><a href="getpuchasInqofFarmer">판매상품 문의 관리</a></li>
					        <li><a href="getFarmInqofFarmer">농촌속으로 문의 관리</a></li>
					    </ul>
					</li>
                    <li class="nav-item pcoded-hasmenu">
					    <a href="#" class="nav-link "><span class="pcoded-micon"><i class="material-icons store">&#xe8d1;</i></span><span class="pcoded-mtext">판매관리</span></a>
					    <ul class="pcoded-submenu">
					        <li><a href="getSaleList?user_id=${user_id }">판매내역</a></li>
					    </ul>
					</li>
                    <li class="nav-item pcoded-hasmenu">
					    <a href="#" class="nav-link "><span class="pcoded-micon"><i class="material-icons shopping_cart">&#xe8cc;</i></span><span class="pcoded-mtext">구매관리</span></a>
					    <ul class="pcoded-submenu">
					        <li><a href="#">장바구니</a></li>
					        <li><a href="getOrderList?user_id=${user_id}">구매내역</a></li>
					        <li><a href="getpuchasInqofUser">구매 관련 문의</a></li>
					    </ul>
                        <li class="nav-item pcoded-hasmenu">
                            <a href="#" class="nav-link "><span class="pcoded-micon"><i class="material-icons agriculture">&#xea79;</i></span><span class="pcoded-mtext">농촌속으로</span></a>
                            <ul class="pcoded-submenu">
                                <li><a href="farmerIntoList?user_id=${user_id }">신청 내역 관리</a></li>
                                <li><a href="myIntoList?user_id=${user_id }">나의 신청 내역</a></li>
                                <li><a href="getIntoFarmInqOfUser">체험 관련 문의</a></li>
                            </ul>
                        </li>
				</ul>
				</c:if>
			</div>
		</div>
	</nav>
	<!-- [ navigation menu ] end -->
	
	<tiles:insertAttribute  name="content"/>

	
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