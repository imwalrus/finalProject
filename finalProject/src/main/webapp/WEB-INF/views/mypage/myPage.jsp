<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Ablepro v8.0 bootstrap admin template by Phoenixcoded</title>
    <!-- Meta -->
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="description" content="" />
	<meta name="keywords" content="">
	<meta name="author" content="Phoenixcoded" />
<style>
.table{
	text-align: center;
}
.table thead th {
    border-bottom: 1px solid #e2e5e8;
    font-size: 13px;
    color: #37474f;
    background: #e3f1d4 !important;
    text-transform: uppercase;
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
							<div class="col-md-12">
							</div>
						</div>
					</div>
				</div>
				<!-- [ breadcrumb ] end -->
				<!-- [ Main Content ] start -->
				<div class="row">
					<!-- [ vertically-modal ] start -->
					<div class="col-md-10">
						<div class="card" >
							<div class="card-body" align="center">

								<!-- [ Contextual-table ] start -->
								<div class="col-md-9">
									<div class="card-header">
										<h2>나의 농지 List</h2>
									</div>
									<div class="table-responsive">
										<table class="table">
											<thead>
												<tr class="table-success">
													<th>No</th>
													<th>농장이름</th>
													<th>주소</th>
													<th>면적</th>
													<th>상세보기</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${farmlist }" var="fa">
													<tr>
														<th>${fa.farm_no }</th>
														<th>${fa.farm_name }</th>
														<th>${fa.farm_adr }</th>
														<th>${fa.farm_area }</th>
														<th><button type="button" id="btnFarm"
																class="btn  btn-outline-success"
																onclick="fnfarmView('${fa.farm_no}')">보기</button>
															<button class="btn  btn-outline-warning" 
															onclick="fnfarmUpdate('${fa.farm_no}')">수정</button>
															<button type="button" class="btn  btn-outline-danger"
																onclick="deleteAlert('${fa.farm_no }')">삭제</button>
														</th>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<div class="col-md-10" align="center">
										<button type="submit" class="btn  btn-outline-success"
											onclick="location.href='insertFarm'">등록</button>
									</div>
								</div>
								<!-- [ Contextual-table ] end -->
							</div>
						</div>
						<!-- [ vertically-modal ] end -->
					</div>


				</div>



			</div>

			<!-- 모달시작 -->
			<div class="modal fade" id="farmCenter" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content"></div>
				</div>
			</div>
			<!-- 끝 -->
		</div>
	</section>



	<!-- Required Js -->
	<script src="resources/admin/js/vendor-all.min.js"></script>
	<script src="resources/admin/js/plugins/bootstrap.min.js"></script>
	<script src="resources/admin/js/ripple.js"></script>
	<script src="resources/admin/js/pcoded.min.js"></script>

	<script type="text/javascript">
		function deleteAlert(str) {
			var yn = confirm("정말 삭제할까요?");
			if (yn) {
				location.href = "deleteFarm?farm_no=" + str;
			} else {
				alert("삭제하지 못하였습니다.  ");
			}
		}

		function fnfarmView(str) {
			$('#farmCenter .modal-content').load("getFarm?farm_no=" + str);
			$('#farmCenter').modal();

		}
		
		function fnfarmUpdate(str) {
			$('#farmCenter .modal-content').load("updateFarm?farm_no=" + str);
			$('#farmCenter').modal();

		}
	</script>


</body>
</html>
