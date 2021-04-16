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
<script>
	$(function() {
		// 검색시 pro_name + pro_content 값 같이 넘겨주기
		$(document).ready(function() {
			$("#pro_name").on('keyup', function() {
				$("#pro_content").val($(this).val())
			});
		});

		// 장바구니 버튼 클릭시 로그인 되어있지 않으면 경고창
		$('.buy-now').click(function() {
			var id = $('input[name=user_id]').val();
			console.log(id);
			if (id == '') {
				alert("로그인이 필요합니다.");
				return false;
			}
		});

		// 화면 전환 후 가격 슬라이더 고정
		<c:if test="${!empty param.pro_price}">
		$("#slider_value_view").html('${param.pro_price}');
		$(".custom-range").val('${param.pro_price}');
		</c:if>
	});

	// 가격대 슬라이더
	function ShowSliderValue(sVal) {
		var obValueView = document.getElementById("slider_value_view");
		obValueView.innerHTML = sVal
	}


	// 페이징
	function goPage(p) {
		//	location.href="shop?page="+p;
		searchFrm.page.value = p;
		searchFrm.submit();
	}
</script>
</head>
<body class="goto-here">
	<!-- 판매 페이지 START  -->
	<section class="ftco-section">
		<div class="shop-box-inner">
			<div class="container">
				<div class="row">
					<div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
						<input type="hidden" name="user_id" value="${user_id}">
						<div class="right-product-box">
							<!-- 정렬 -->
							<div class="product-item-filter">
								<ul class="nav nav-pills">
									<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">정렬</a>
										<div class="dropdown-menu">
											<a class="dropdown-item" href="shop?orderCond=popular">인기 많은순</a>
											<a class="dropdown-item" href="shop?orderCond=cheap">가격 낮은순</a>
											<a class="dropdown-item" href="shop?orderCond=expensive">가격 높은순</a>
										</div></li>
								</ul>
							</div>
							<!-- 정렬 END -->
							<!-- 판매품목 -->
							<div class="product-categorie-box">
								<div class="tab-content">
									<div role="tabpanel" class="tab-pane fade show active" id="grid-view">
										<div class="row">
											<!-- c:forEach START -->
											<c:forEach items="${list}" var="shop">
												<div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
													<div class="product">
														<input type="hidden" name="pro_no" value="${shop.pro_no }">
														<a href="product?pro_no=${shop.pro_no}" class="img-prod">
															<!-- 이미지 -->
															<img class="img-fluid" src="resources/images/shop/${shop.pro_filename}" alt="Colorlib Template">
														</a>
														<div class="text py-3 pb-4 px-3 text-center">
															<h3>
																<!-- 이름 -->
																<a href="product?pro_no=${shop.pro_no}">${shop.pro_name }</a>
															</h3>
															<div class="d-flex">
																<div class="pricing">
																	<!-- 가격 -->
																	<p class="price">
																		<span class="price-sale">￦ ${shop.pro_price }</span>
																	</p>
																</div>
															</div>
															<div class="bottom-area d-flex px-3">
																<div class="m-auto d-flex">
																	<!-- 상세 페이지 이동 -->
																	<a href="product?pro_no=${shop.pro_no}" class="add-to-cart d-flex justify-content-center align-items-center text-center">
																		<span><i class="ion-ios-menu"></i></span>
																	</a>
																	<!-- 장바구니 이동(본인 상품일시 표시 X) -->
																	<c:if test="${shop.user_id ne user_id}">
																		<a href="insertCart?pro_no=${shop.pro_no}&cart_count=1&user_id=${user_id}" class="buy-now d-flex justify-content-center align-items-center mx-1">
																			<span><i class="ion-ios-cart"></i></span>
																		</a>
																	</c:if>
																</div>
															</div>
														</div>
													</div>
												</div>
											</c:forEach>
											<!-- c:forEach END -->
										</div>
										<!-- 페이징 -->
										<div class="row mt-5">
											<div class="col text-center">
												<form action="shop" name="searchFrm">
													<input type="hidden" name="page" value="1">
													<input type="hidden" name="pro_category" value="${shopVO.pro_category}">
													<input type="hidden" name="orderCond" value="${shopVO.orderCond}">
													<input type="hidden" name="pro_name" value="${shopVO.pro_name}">
													<input type="hidden" name="pro_content" value="${shopVO.pro_content}">
													<input type="hidden" name="pro_price" value="${shopVO.pro_price}">
													<my:paging paging="${paging}" jsFunc="goPage" />
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 판매품목 END -->
					<!-- 사이드바 -->
					<div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
						<div class="product-categori">
							<!-- 검색창 START -->
							<div class="search-product">
								<form action="shop" class="search-form">
									<input type="hidden" name="page" value="1">
									<div class="form-group">
										<span class="icon ion-ios-search"></span>
										<input type="text" class="form-control" placeholder="Search..." id="pro_name" name="pro_name">
										<input type="hidden" class="form-control" id="pro_content" name="pro_content" value="">
									</div>
								</form>
							</div>
							<br />
							<!-- 검색창 END -->
							<!-- 카테고리 START -->
							<div class="filter-sidebar-left">
								<div class="title-left">
									<h3>카테고리</h3>
								</div>
								<div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
									<div class="list-group-collapse sub-men">
										<div class="collapse show" id="sub-men1" data-parent="#list-group-men">
											<div class="list-group">
												<a href="shop" class="list-group-item list-group-item-action">
													전체 <small class="text-muted">(${cnt})</small>
												</a>
												<c:forEach items="${cate}" var="cate">
													<a href="shop?pro_category=${cate.pro_category}" class="list-group-item list-group-item-action">
														${cate.pro_category} <small class="text-muted">(${cate.pro_count})</small>
													</a>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>
							<br /> <br />
							<!-- 카테고리 END -->
							<!-- 가격대 필터 START -->
							<div class="filter-price-left">
								<div class="title-left">
									<h3>가격대</h3>
								</div>
								<div class="price-box-slider">
									<form action="shop">
										<div id="slider-range"></div>
										<div class="Container">
											<font size=2 id="slider_value_view">10000</font>
											<!-- 최소값:0 최대값:10000 단위:1000 -->
											<input oninput='ShowSliderValue(this.value)' type="range" name="pro_price" class="custom-range" min='0' max='20000' step="1000">
										</div>
										<button type="submit" class="btn btn-primary">검색</button>
									</form>
								</div>
							</div>
							<!-- 가격대 필터 END -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 판매 페이지 END -->
</body>
</html>