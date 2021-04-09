<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<title>회원 탈퇴</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="" />
<meta name="keywords" content="">
<meta name="author" content="Phoenixcoded" />
<!-- Favicon icon -->
<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">

<!-- vendor css -->
<link rel="stylesheet" href="resources/admin/css/style.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>

<style type="text/css">
table {
	text-align: center;
}

.hide {
	display: none;
}

.show {
	display: table-row;
}

.item td {
	cursor: pointer;
}
</style>
</head>
<body>
	<section class="pcoded-main-container">
		<!-- [ Main Content ] start -->
		<div class="pcoded-main-container">
			<div class="pcoded-content">
				<!-- [ breadcrumb ] start -->
				<div class="page-header">
					<div class="page-block">
						<div class="row align-items-center">
							<div class="col-md-12"></div>
						</div>
					</div>
				</div>
				<!-- [ breadcrumb ] end -->
				<!-- [ Main Content ] start -->
				<div class="row">
					<!-- [ vertically-modal ] start -->
					<div class="col-md-10">
						<div class="card">
							<div class="card-body" align="center">

								<!-- [ Contextual-table ] start -->
								<div class="col-md-9">
									<div class="card-header">
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
														<th>총금액</th>
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
		
	$.ajax({
			url:"ajaxgetOrderList",
			data: "user_id=" + '${user_id}',
			dataType: "json",
			success: function (data) {
			 	for(i=0; i<data.length; i++){ 
					$("#order").append(
						"<tr><td>"  
						+ "<button type='button' onclick='getOrder("+data[i].order_no+")'>" + data[i].order_no + "</button>" + "</td><td>"
						+ data[i].order_payment + "</td><td>"
						+ data[i].order_totalprice + "</td><td>"
						+ data[i].order_date + "</td></tr>"
				); 
			} 
			
		
		
	}
 			
	});
	
	</script>
</body>
</html>
