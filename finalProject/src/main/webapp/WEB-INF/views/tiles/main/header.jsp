<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>청년농장</title>
</head>
<body class="goto-here">
	<!-- 내비게이션 바 시작 -->
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
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">공지 & FAQ</a>
					    <div class="dropdown-menu" aria-labelledby="dropdown">
					    <a class="dropdown-item" href="getNotices">공지사항</a>
					    <a class="dropdown-item" href="getFaq">FAQ</a>
					    </div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">귀농교육</a>
						<div class="dropdown-menu" aria-labelledby="dropdown">
					    <a class="dropdown-item" href="education">귀농 작성 체크리스트</a>
					    <a class="dropdown-item" href="onEducation">온라인 교육</a>
					    <a class="dropdown-item" href="getOffEdu">오프라인 교육</a>
					    </div>
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
					<c:if test="${ user_id eq null }"><!-- session 내 아이디 값 없을시 -->
						<li class="nav-item cta cta-colored">
							<a href="login" class="nav-link"><span class="icon-person_outline"></span>로그인</a>
						</li>
					</c:if>
					<c:if test="${ user_id ne null }"><!-- session 내 아이디 값 존재 할 경우 -->
						<li class="nav-item cta cta-colored">
							<a href="logout" class="nav-link"><span class="icon-person_outline"></span>로그아웃</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 내비게이션 바 END -->
</body>
</html>