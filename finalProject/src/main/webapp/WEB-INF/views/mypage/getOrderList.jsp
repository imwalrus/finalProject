<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="resources/main/css/style.css">
<style>
.table thead th {
	background-color: #c3e6cb;
	font-weight: bold;
}

h2 {
	font-weight: bold;
}
</style>

<body>
	<section class="pcoded-main-container">
		<div class="pcoded-main-container">
			<div class="pcoded-content">
				<div class="row">
					<div class="col-md-10">
						<div class="card">
							<div class="card-body">
								<div class="col-md-12">
									<div class="card-header" align="center">
										<h2>구매 내역</h2>
									</div>
									<div class="card-body table-border-style">
										<div class="table-responsive">
											<table class="table" id="order" align="center">
												<colgroup>
													<col width="25%">
													<col width="25%">
													<col width="25%">
													<col width="25%">
												</colgroup>
												<thead>
													<tr class="table-success">
														<th>주문번호</th>
														<th>결제수단</th>
														<th>총 금액(원)</th>
														<th>주문일자</th>
													</tr>
												</thead>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>



				</div>
			</div>
			<!-- 상세모달시작 -->
			<div class="modal fade bd-example-modal-lg" id="getOrder"
				tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
				aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button class="close" type="button" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">x</span>
							</button>
						</div>
						<div class="modal-body"></div>
					</div>
				</div>
			</div>
			<!-- 모달끝 -->
		</div>
	</section>

	<script type="text/javascript">
		/* 모달불러오기 */
		function getOrder(str) {
			$('#getOrder .modal-body').load("getOrder?order_no=" + str);
			$('#getOrder').modal('show');
		}

		$
				.ajax({
					url : "ajaxgetOrderList",
					data : "user_id=" + '${user_id}',
					dataType : "json",
					success : function(data) {
						if (data.length == "0") {
							$("#order").append(
									"<tr><td colspan='4'>구매하신 내역이 없습니다. </td></tr>"

							);

						} else {
							for (i = 0; i < data.length; i++) {
								$("#order")
										.append(
												"<tr><td>"
														+ "<button type='button' class='btn btn-success btn-sm' onclick='getOrder("
														+ data[i].order_no
														+ ")'>"
														+ data[i].order_no
														+ "</button>"
														+ "</td><td>"
														+ data[i].order_payment
														+ "</td><td style='font-weight: bold'>"
														+ data[i].order_totalprice
														+ "원</td><td>"
														+ data[i].order_date
														+ "</td></tr>");

							}
						}
						console.log("=====" + data.length + "======")
					}

				});
	</script>