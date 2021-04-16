<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
										<h2>농업인 권한 신청</h2>
									</div>
									<div class="alert alert-success mb-0" role="alert">
										<div class="col-md-9">
											<h5>
												영농인 권한을 부여받을시 아래와 같은 기능들이 추가됩니다. 
												<br> 
												<br>1. 영농일지 작성 
												<br>2. 소개페이지 (농지 및 농작물 등록) 
												<br>3. 농작물 판매 
												<br>4. 영농일지 작성 
												<br>5. 커뮤니티 게시판 사용
											</h5>
											<br>
										</div>
									</div>
									<br>
									<div align="center">
										<div class="col-md-9">
										<form  action="insertFarmer" method="post" enctype="multipart/form-data" class="was-validated">
											<div class="form-group row">
												<label for="inputEmail3" class="col-sm-4 col-form-label">
													<h6>ID</h6>
												</label>
												<div class="col-sm-8">
													<input type="text" class="form-control" id="user_id" name="user_id">
												</div>
											</div>
											<div class="form-group row">
												<label for="inputEmail3" class="col-sm-4 col-form-label">
													<h6>파일첨부</h6>
												</label>

												<div class="col-sm-8">
													
														<input multiple="multiple" type="file" name="uploadFile" required> 
														<input type="hidden" name="farmer_filename">
														<div class="invalid-feedback">사업자등록증 (pdf, jpeg,jpg) 첨부 필요</div>
													
												</div>

											</div>
											<div class="form-group row">
												<div class="col-sm-10">
													<button type="submit" class="btn  btn-outline-success">신청</button>
												</div>
											</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- [ static-layout ] end -->
				</div>
			</div>
		</div>
	</section>


	<script>
		function farmAlert(str) {
			var yn = confirm("신청완료 되었습니다. 승인에는 1~3일간의 기간이 소요 될 수 있습니다.");
			location.href = "insertFarmer?user_id";
		}
	</script>
</body>
