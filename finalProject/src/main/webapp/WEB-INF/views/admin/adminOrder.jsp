<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>관리자</title>
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="" />
<meta name="keywords" content="">
<meta name="author" content="Phoenixcoded" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		// 툴팁 활성화
		$('[data-toggle="tooltip"]').tooltip();
		// 화면 전환 후 select box 고정
		$("#select-sort").val('${param.orderlist_condition}');
	});

	// 페이징
	function goPage(p) {
		//	location.href="adminOrder?page="+p;
		searchFrm.page.value = p;
		searchFrm.submit();
	}
</script>
</head>
<body>
	<!-- 판매 현황 START -->
	<section class="pcoded-main-container">
		<div class="pcoded-main-container">
			<div class="pcoded-content">
				<div class="page-header">
					<div class="page-block">
						<div class="row align-items-center">
							<div class="col-md-12"></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10">
						<div class="card">
							<div class="card-body" align="center">
								<div class="col-md-9">
									<h2>판매 현황</h2>
									<!-- 카테고리 : 전체·결제완료·배송중·배송완료 -->
									<div class="form-group float-right">
										<select class="custom-select" id="select-sort" onchange="location.href='adminOrder?orderlist_condition=' + (this.value);">
											<option value="">전체</option>
											<option value="결제완료">결제완료</option>
											<option value="배송중">배송중</option>
											<option value="배송완료">배송완료</option>
										</select>
									</div>
									<div class="table-responsive">
										<!-- 테이블 START -->
										<table class="table">
											<thead>
												<tr class="table-success">
													<th>No.</th>
													<th>상품명</th>
													<th>주문일자</th>
													<th>결제수단</th>
													<th>금액</th>
													<th>상태</th>
													<th>판매자</th>
													<th>구매자</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${order}" var="order">
													<tr>
														<td>${order.order_no}</td>
														<td>${order.pro_name}</td>
														<td>${order.order_date}</td>
														<td>${order.order_payment}</td>
														<td>${order.pro_price}원</td>
														<td>${order.orderlist_condition}</td>
														<td>${order.seller}</td>
														<td>${order.buyer}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<!-- 테이블 END -->
										<!-- 페이징 START -->
										<form action="adminOrder" name="searchFrm">
											<input type="hidden" name="page" value="1">
											<my:paging paging="${paging}" jsFunc="goPage" />
										</form>
										<!-- 페이징 END -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 단건 보기 Modal 이동 START -->
			<div class="modal" id="modal" tabindex="-1" role="dialog" aria-labelledby="historyModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content"></div>
				</div>
			</div>
			<!-- 단건 보기 Modal 이동 END -->
		</div>
	</section>
	<!-- 판매 현황 END -->
</body>
</html>