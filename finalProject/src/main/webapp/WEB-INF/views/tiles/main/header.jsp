<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>청년농장</title>
<!-- #78c2ad -->
<style>
#ftco-navbar{
	background-color: white !important;
}
.nav-link{
	color:black !important;
}
</style>
</head>
<body class="goto-here">
	<!-- 내비게이션 바 시작 -->
	<nav class="navbar navbar-expand-lg navbar-dark" id="ftco-navbar">
		<div class="row">
			<!-- 배너(상단) -->
			<c:forEach items="${applicationScope.banner}" var="banner" end="0" varStatus="status">
				<c:if test="${banner.banner_check eq 0}">
					<div class="banner1 col-md-4">
						<a href="${banner.banner_link}">
							<img src="resources/images/banner/${banner.banner_filename}" style="max-width:190px;">
						</a>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div class="container">
			<a class="navbar-brand" href="./"><img src="resources/images/logo/logo2.png" style="width:160px; height:80px;"></a>
 			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span>
			</button> 

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="./" class="nav-link">HOME</a></li>
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">공지 & FAQ</a>
						<div class="dropdown-menu" aria-labelledby="dropdown">
							<a class="dropdown-item" href="getNotices">공지사항</a>
							<a class="dropdown-item" href="getFaq">FAQ</a>
						</div>
					</li>
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">귀농교육</a>
						<div class="dropdown-menu" aria-labelledby="dropdown">
							<a class="dropdown-item" href="education">귀농 적성 체크리스트</a>
							<a class="dropdown-item" href="onEducation">온라인 교육</a>
							<a class="dropdown-item" href="getOffEdu">오프라인 교육</a>
						</div>
					</li>
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="intoTheFarm" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">농촌속으로</a>
						<div class="dropdown-menu" aria-labelledby="dropdown02">
							<a class="dropdown-item" href="getFarmInfo">농촌속으로 소개</a>
							<a class="dropdown-item" href="getFarmList">체험신청</a>
							<a class="dropdown-item" href="insertFarm">체험등록</a>
						</div>
					</li>
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="shop" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">농산물판매</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="#"></a>
							<a class="dropdown-item" href="shop">판매리스트</a>
							<c:if test="${user_auth eq 'farmer'}">
								<!-- session 내 아이디 값 없을시 -->
								<a class="dropdown-item" href="prodManage?user_id=${user_id}">판매 관리</a>
							</c:if>
							<c:if test="${user_id ne null}">
								<!-- session 내 아이디 값 존재 할 경우 -->
								<a class="dropdown-item" href="cart?user_id=${user_id}">장바구니</a>
							</c:if>
							<a class="dropdown-item" href="infoShop">판매 소개</a>
						</div></li>
					<li class="nav-item"><a href="getComm" class="nav-link">커뮤니티</a></li>
					<c:if test="${user_auth ne 'admin' and user_id ne null}">
						<!-- session 내 아이디 값 있을시 마이페이지 표시 -->
						<li class="nav-item"><a href="myPage" class="nav-link">마이페이지</a></li>
					</c:if>
					<c:if test="${ user_auth eq 'admin' }">
						<!-- 'ADMIN'일시 관리자페이지 표시 -->
						<li class="nav-item"><a href="admin" class="nav-link">관리자</a></li>
					</c:if>
					<c:if test="${ user_id eq null }">
						<!-- session 내 아이디 값 없을시 -->

						<li class="nav-item cta cta-colored"><a href="login" class="nav-link">
								<span class="icon-person_outline"></span>로그인
							</a></li>
					</c:if>
					<c:if test="${user_id ne null}">
						<!-- session 내 아이디 값 존재 할 경우 -->
						<li class="nav-item cta cta-colored"><a href="logout" class="nav-link">
								<span class="icon-person_outline"></span>로그아웃
							</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 내비게이션 바 END -->
</body>
</html>