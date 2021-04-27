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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.1.min.js" type="application/javascript"></script>
<script type="text/javascript">
	// 주소 찾기
	function execPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var addr = '';
						var extraAddr = '';
						if (data.userSelectedType === 'R') {
							addr = data.roadAddress;
						} else {
							addr = data.jibunAddress;
						}
						if (data.userSelectedType === 'R') {
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							document.getElementById("sample6_detailAddress").value = extraAddr;
						} else {
							document.getElementById("sample6_detailAddress").value = '';
						}
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						document.getElementById("sample6_detailAddress").focus();
					}
				}).open();
	}
</script>
</head>
<body class="goto-here">
	<!-- 결제 페이지 START  -->
	<section class="ftco-section">
		<div class="container">
			<form action="insertOrder" class="billing-form" method="post" name="orderForm">
				<div class="row justify-content-center">
					<div class="col-xl-7 ftco-animate">
						<h3 class="mb-4 billing-heading">상세 주문</h3>
						<div class="row align-items-end">
							<div class="col-md-6">
								<div class="form-group">
									<label for="ID">ID</label>
									<input type="text" class="form-control" name="user_id" value="${user.user_id}" readonly="readonly">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="name">이름</label>
									<input type="text" class="form-control" name="order_name" value="${user.user_name}">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="phone">연락처</label>
									<input type="text" class="form-control" name="order_phone" value="${user.user_phone}">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="emailaddress">이메일</label>
									<input type="text" class="form-control" value="${user.user_email}">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="zipcode">우편번호</label>
									<input type="text" class="form-control" id="sample6_postcode" name="order_zip" value="${user.user_zip}">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="zipcodeSearch">
										<button type="button" class="btn btn-primary" onclick="execPostcode()">우편번호 찾기</button>
									</label>
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="address">주소</label>
									<input type="text" class="form-control" id="sample6_address" name="order_adr" value="${user.user_adr}">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="detailAddress">상세 주소</label>
									<input type="text" class="form-control" id="sample6_detailAddress" name="order_detailadr" value="${user.user_detailadr}">
								</div>
							</div>
							<div class="w-100"></div>
						</div>
						<!-- END -->
					</div>
					<div class="col-xl-5">
						<div class="row mt-5 pt-3">
							<div class="col-md-12 d-flex mb-5">
								<div class="cart-detail cart-total p-3 p-md-4">
									<h3 class="billing-heading mb-4">장바구니</h3>
									<c:set var="price" value="0" />
									<c:forEach items="${order}" var="order">
										<input type="hidden" name="pro_no" value="${order.pro_no}">
										<input type="hidden" name="cart_count" value="${order.cart_count}">
										<p class="d-flex">
											<c:set var="name" value="${order.pro_name}" />
											<c:set var="com" value="${order.cart_price}" />
											<span>${order.pro_name}</span> <span>￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${com}" /></span>
										</p>
										<c:set var="price" value="${price + order.cart_price}" />
									</c:forEach>
									<p class="d-flex">
										<span>배송비</span> <span>￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="2500" /></span>
									</p>
									<hr>
									<p class="d-flex total-price">
										<c:set var="com" value="${price + 2500}" />
										<span>결제금액</span> <span>￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${com}" /></span>
									</p>
									<input type="hidden" name="order_totalprice" value="${com}">
								</div>
							</div>
							<div class="col-md-12">
								<div class="cart-detail p-3 p-md-4">
									<h3 class="billing-heading mb-4">결제수단</h3>
									<div class="form-group">
										<div class="col-md-12">
											<div class="radio">
												<label><input type="radio" name="order_payment" class="mr-2" checked="checked" value="Bootpay"> Bootpay</label>
											</div>
										</div>
									</div>
									<p>
										<a href="#" class="btn btn-primary py-3 px-4" onclick="payment()">결제하기</a>
										<!-- <button type="submit" class="btn btn-primary py-3 px-4">결제하기</button> -->
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
	<!-- 결제 페이지 END -->
</body>
<script>
	function payment() {
		BootPay.request({
			price : '${com}',
			application_id : "606d42a45b2948001d07adb1",
			name : '${name}',
			pg : 'inicis',
			method : '',
			show_agree_window : 0,
			user_info : {
				username : '${user.user_name}',
				email : '${user.user_email}',
				phone : '${user.user_phone}'
			},
			order_id : 'order_id_1234',
		}).error(function(data) {
			console.log(data);
		}).cancel(function(data) {
			console.log(data);
		}).close(function(data) {
			console.log(data);
		}).done(function(data) {
			orderForm.submit();
			alert('결제완료!');
			console.log(data);
		});
	}
</script>
</html>