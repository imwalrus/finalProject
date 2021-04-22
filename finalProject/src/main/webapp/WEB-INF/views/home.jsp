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
</head>
<body class="goto-here">
	<section id="home-section" class="hero">
		<div class="home-slider owl-carousel">
			<div class="slider-item" style="background-image: url(resources/images/home/main_image.jpg);">
				<div class="overlay"></div>
				<div class="container">
					<div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">
						<div class="col-md-12 ftco-animate text-center">
							<h1 class="mb-2">자연이 좋은 <br> 사람들</h1>
							<h2 class="subheading mb-4">청년농장</h2>
						</div>
					</div>
				</div>
			</div>
			<div class="slider-item" style="background-image: url(resources/images/home/main_image2.jpg);">
				<div class="overlay"></div>
				<div class="container">
					<div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">
						<div class="col-md-12 ftco-animate text-center">
							<h1 class="mb-2">자연속에서 찾는 <br> 행복한 삶</h1>
							<h2 class="subheading mb-4">청년농장</h2>
						</div>
					</div>
				</div>
			</div>
			<div class="slider-item" style="background-image: url(resources/images/home/main_image3.png);">
				<div class="overlay"></div>
				<div class="container">
					<div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">
						<div class="col-md-12 ftco-animate text-center">
							<h1 class="mb-2">도시에서 <br> 농촌으로</h1>
							<h2 class="subheading mb-4">청년농장</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section pt-4 pb-4">
		<div class="categories-shop">
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="hvr-grow">
							<a href="education" class="btn hvr-hover hvr-grow">
								<img class="img-fluid" src="resources/images/home/categories_img_01.png" />
							</a>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="hvr-grow">
							<a href="getFarmInfo" class="btn hvr-hover hvr-grow">
								<img class="img-fluid" src="resources/images/home/categories_img_02.png" />
							</a>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="hvr-grow">
							<a href="shop" class="btn hvr-hover hvr-grow">
								<img class="img-fluid" src="resources/images/home/categories_img_03.png" />
							</a>
						</div>
					</div>
				</div>
			</div>
			<br> <br>
			<div class="container">
				<div class="card-deck">
					<div class="card col-8 col-sm-6">
						<div class="row">
							<div class="card-body ">
								<table class="card-table" style="table-layout: fixed">
									<thead>
										<tr>
											<th><a href="getNotices" style="color: black">
													<strong>공지</strong>
												</a></th>
											<td></td>
											<td></td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${notice}" begin="0" end="3" var="notice">
											<tr>
												<td class="stringcut" style="max-width: 410px;">
													<a href="getSearchNotices?notice_no=${notice.notice_no}">${notice.notice_title}</a>
												</td>
												<td></td>
												<td>
													<fmt:parseDate value="${notice.notice_date}" var="notice_date" pattern="yyyy-MM-dd HH:mm:ss" />
													<a href="getSearchNotices?notice_no=${notice.notice_no}">
														<fmt:formatDate value="${notice_date}" pattern="yyyy-MM-dd" />
													</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="card col-4 col-sm-6">
						<div class="row">
							<div class="card-body ">
								<a href="getComm" style="color: black">
									<strong>커뮤니티</strong>
								</a>
								<table class="card-table" style="table-layout: fixed">
									<tbody>
										<c:forEach items="${community}" begin="0" end="3" var="community">
											<tr>
												<td align="left" width="30%" class="text-truncate">
													<a href="getSchComm?comm_no=${community.comm_no}">${community.comm_title}</a>
												</td>
												<td align="right" width=20%>
													<fmt:parseDate value="${community.comm_date}" var="comm_date" pattern="yyyy-MM-dd HH:mm:ss" />
													<a href="getSchComm?comm_no=${community.comm_no}">
														<fmt:formatDate value="${comm_date}" pattern="yyyy-MM-dd" />
													</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>