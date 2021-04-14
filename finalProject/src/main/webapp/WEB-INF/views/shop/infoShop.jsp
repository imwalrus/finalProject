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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body class="goto-here">
	<!-- 소개 페이지 START -->
	<section class="pt-4 pb-4">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="row">
						<!-- single -->
						<c:forEach items="${list}" var="list">
							<div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
								<div class="product">
									<a href="http://www.nongsaro.go.kr${list.explain}" class="img-prod">
										<!-- 이미지 -->
										<img class="img-fluid" src="http://www.nongsaro.go.kr${list.img}" alt="Colorlib Template">
									</a>
									<div class="text py-3 pb-4 px-3 text-center">
										<h3>
											<!-- 이름 -->
											<a href="http://www.nongsaro.go.kr${list.explain}">${list.farmName}</a>
										</h3>
										<div class="d-flex">
											<div class="pricing">
												<!-- 가격 -->
												<p class="price">
													<span class="price-sale">￦ ${list.price}</span>
												</p>
											</div>
										</div>
										<div class="bottom-area d-flex px-3">
											<div class="m-auto d-flex">
												<!-- 상세 페이지 이동 -->
												<a href="http://www.nongsaro.go.kr${list.explain}" class="add-to-cart d-flex justify-content-center align-items-center text-center">
													<span><i class="ion-ios-menu"></i></span>
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
							<form action="infoShop" method="post">
								<input type="submit" class="btn btn-secondary" name="cnt" value="1">
								<input type="submit" class="btn btn-secondary" name="cnt" value="2">
								<input type="submit" class="btn btn-secondary" name="cnt" value="3">
								<input type="submit" class="btn btn-secondary" name="cnt" value="4">
								<input type="submit" class="btn btn-secondary" name="cnt" value="5">
								<input type="submit" class="btn btn-secondary" name="cnt" value="6">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 소개 페이지 END -->
</body>
</html>