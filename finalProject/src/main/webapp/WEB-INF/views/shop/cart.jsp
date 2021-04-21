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
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body class="goto-here">
	<!-- 장바구니 START  -->
	<section class="pt-5 pb-5">
		<div class="container">
			<div class="row w-100">
				<div class="col-lg-12 col-md-12 col-12">
					<h1 class="display-5 mb-2 text-center">
						<i class="material-icons shopping_cart">&#xe8cc;</i> 장바구니
					</h1>
					<p class="mb-5 text-center">
					<table id="shoppingCart" class="table table-condensed">
						<thead>
							<tr>
								<th style="width: 55%">상품정보</th>
								<th style="width: 12%">판매가</th>
								<th style="width: 10%">수량</th>
								<th style="width: 12%"></th>
							</tr>
						</thead>
						<tbody>
							<!-- 장바구니가 비었을 경우 -->
							<c:if test="${empty cart}">
								<td colspan="6">장바구니가 비었습니다.</td>
							</c:if>
							<!-- 총액 계산 -> c:set 태그 설정(총액 변수명 price) -->
							<c:set var="price" value="0" />
							<!-- c:forEach START -->
							<c:forEach items="${cart}" var="cart" varStatus="status">
								<tr>
									<form action="updateCart" method="post">
										<td data-th="Product">
											<input type="hidden" name="pro_no" value="${cart.pro_no}">
											<div class="row">
												<!-- 이미지 -->
												<div class="col-md-3 text-left">
													<img src="resources/images/shop/${cart.pro_filename}" alt="" class="img-fluid d-none d-md-block rounded mb-2 shadow ">
												</div>
												<!-- 상품명 · 상품 내용 -->
												<div class="col-md-9 text-left mt-sm-2">
													<h3>${cart.pro_name}</h3>
													<p>${cart.pro_content}</p>
												</div>
											</div>
										</td>
										<!-- 판매가(jstl - 3자리마다 ',') -->
										<c:set var="com" value="${cart.cart_price}" />
										<td data-th="Price">
											￦
											<fmt:formatNumber type="number" maxFractionDigits="3" value="${com}" />
										</td>
										<td data-th="Quantity">
											<!-- 수량 -->
											<input type="text" class="form-control-sm" name="cart_count" value="${cart.cart_count}">
										</td>
										<td class="actions" data-th="">
											<!-- 수량 수정 · 삭제 버튼 -->
											<div class="text-right">
												<button class="btn btn-white border-secondary bg-white btn-md mb-2">
													<i class="material-icons refresh">&#xe5d5;</i>
												</button>
												<a type="button" href="deleteCart?cart_no=${cart.cart_no}" class="btn btn-white border-secondary bg-white btn-md mb-2">
													<i class="material-icons close_fullscreen">&#xe14c;</i>
												</a>
											</div>
										</td>
									</form>
								</tr>
								<!-- 총액 계산 -> c:set 태그 종료 -->
								<c:set var="price" value="${price + cart.cart_price}" />
							</c:forEach>
							<!-- c:forEach END -->
						</tbody>
					</table>
					<div class="float-right text-right">
						<h2>총 금액</h2>
						<!-- jstl - 총액 계산 · 3자리마다 ','  -->
						<c:set var="com" value="${price}" />
						<h1>
							￦
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${com}" />
						</h1>
					</div>
				</div>
			</div>
			<div class="row mt-4 d-flex align-items-center">
				<c:if test="${not empty cart}">
					<div class="col-sm-6 order-md-2 text-right">
						<!-- 주문 버튼 -->
						<a href="checkout?user_id=${user_id}" class="btn btn-success mb-4 btn-lg pl-5 pr-5">주문하기</a>
					</div>
				</c:if>
				<div class="col-sm-6 mb-3 mb-m-1 order-md-1 text-md-left">
					<a href="shop">
						<!-- '<- 쇼핑 계속하기' -->
						<i class="material-icons arrow_back">&#xe5c4;<strong> 쇼핑 계속하기</strong></i>
					</a>
				</div>
			</div>
		</div>
	</section>
	<!-- 장바구니 END -->
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
</body>
</html>