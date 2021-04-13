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
		// 장바구니 클릭시 확인창(모달)
		$("#addCart").submit(function(event) {
			$('#modalAlert').modal();
		});

		$(document).ready(function() {
			var quantitiy = 0;
			// 수량 + 버튼
			$('.quantity-right-plus').click(function(e) {
				// 버튼 동작 Stop
				e.preventDefault();
				// input-number의 값
				var quantity = parseInt($('.input-number').val());
				$('.input-number').val(quantity + 1);
			});

			// 수량 - 버튼
			$('.quantity-left-minus').click(function(e) {
				e.preventDefault();
				var quantity = parseInt($('.input-number').val());
				if (quantity > 0) {
					$('.input-number').val(quantity - 1);
				}
			});
			
			// 장바구니 버튼 클릭시 로그인 되어있지 않으면 경고창
			$('.cart').click(function(){
				var id = $('input[name=user_id]').val();
				console.log(id);
		        if (id == '') {
		            alert("로그인이 필요합니다.");
		            return false;
		        } 
			});
		});
	});
</script>
</head>
<body class="goto-here">
	<!-- 상품 페이지 START  -->
	<section class="ftco-section">
		<form action="insertCart" id="addCart" name="addCart" method="post">
			<input type="hidden" name="pro_no" value="${prod.pro_no}">
			<input type="hidden" name="user_id" value="${user_id}">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 mb-5 ftco-animate">
						<!-- 이미지 -->
						<a href="resources/main/images/${prod.pro_filename}" class="image-popup">
							<img src="resources/main/images/${prod.pro_filename}" class="img-fluid" alt="Colorlib Template">
						</a>
					</div>
					<div class="col-lg-6 product-details pl-md-5 ftco-animate">
						<!-- 상품 이름 -->
						<h3>${prod.pro_name}</h3>
						<p class="text-left mr-4">
							<a class="mr-2" style="color: #000;">
								판매자 <span style="color: #bbb;">${prod.user_id}</span>
							</a>
							<!-- ★문의하기 url 넣기★ -->
							<a href="#" class="mr-2">문의하기</a>
						<div class="rating d-flex">
							<p class="text-left mr-4">
								<a class="mr-2" style="color: #000;">
									카테고리 <span style="color: #bbb;">${prod.pro_category}</span>
								</a>
							</p>
							<p class="text-left">
								<a class="mr-2" style="color: #000;">
									재고 <span style="color: #bbb;">${prod.pro_quantity}개</span>
								</a>
							</p>
						</div>
						<!-- 가격 -->
						<p class="price">
							<c:set var="price" value="${prod.pro_price}" />
							<span>￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" /></span>
						</p>
						<p>
							<span style="color: #000;">배송사 :</span> ${prod.pro_dcompany}
						</p>
						<p>
							<span style="color: #000;">배송비 :</span> ￦ 2,500
						</p>
						<!-- 내용 -->
						<p>${prod.pro_content}</p>
						<div class="row mt-4">
							<div class="input-group col-md-6 d-flex mb-3">
								<span class="input-group-btn ml-2">
									<button type="button" class="quantity-left-minus btn" data-type="minus" data-field="">
										<i class="ion-ios-remove"></i>
									</button>
								</span>
								<input type="text" name="cart_count" class="form-control input-number" value="1" min="1" max="100">
								<span class="input-group-btn mr-2">
									<button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
										<i class="ion-ios-add"></i>
									</button>
								</span>
							</div>
						</div>
						<p>
							<!-- 본인 판매 상품일시 장바구니 버튼 X 관리페이지 이동 버튼 O -->
							<c:if test="${prod.user_id eq user_id}">
								<a href="prodManage?user_id=${user_id}" class="btn btn-success py-3 px-5">상품수정</a>
							</c:if>
							<c:if test="${prod.user_id ne user_id}">
								<a href="#modalAlert" class="cart btn btn-primary py-3 px-5" data-toggle="modal">장바구니 담기</a>
							</c:if>
						</p>
					</div>
				</div>
			</div>
		</form>
		<!-- 장바구니 모달 START -->
		<div id="modalAlert" class="modal fade">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<form action="shop">
						<div class="modal-body">
							<p>해당 상품을 장바구니에 담으시겠습니까?</p>
						</div>
						<div class="modal-footer">
							<a href="javascript:addCart.submit();" type="button" class="btn btn-primary">확인</a>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- 장바구니 모달 END -->
	</section>
	<!-- 상품 페이지 END -->
</body>
</html>