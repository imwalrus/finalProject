<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.accordion {
	background-color: #eee;
	color: #444;
	cursor: pointer;
	padding: 18px;
	width: 100%;
	border: none;
	text-align: left;
	outline: none;
	font-size: 15px;
	transition: 0.4s;
}

.active, .accordion:hover {
	background-color: #ccc;
}

.panel {
	padding: 0 18px;
	display: none;
	background-color: white;
	overflow: hidden;
}

.left-box {
	float: left;
	width: 80%;
}

.right-box {
	float: right;
	width: 20%;
}

.ftitle {
	font-weight: 300;
	border: transparent !important;
	border: 1px solid rgba(0, 0, 0, 0.1) !important;
	height: 58px !important;
	padding-left: 15px;
	padding-right: 15px;
	background: transparent !important;
	color: rgba(0, 0, 0, 0.4) !important;
	font-size: 14px;
	text-align: left;
	border-radius: 0px;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
	width: 67%;
	border-right: none !important;
	border-left: none !important;
	border-top: none !important;
	border-bottom: none !important;
}

.ftime {
	font-weight: 300;
	border: transparent !important;
	border: 1px solid rgba(0, 0, 0, 0.1) !important;
	height: 58px !important;
	padding-left: 15px;
	padding-right: 15px;
	background: transparent !important;
	color: rgba(0, 0, 0, 0.4) !important;
	font-size: 12px;
	text-align: right;
	border-radius: 0px;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
	width: 25%;
	border-right: none !important;
	border-left: none !important;
	border-top: none !important;
	border-bottom: none !important;
}

.fpeople {
	font-weight: 300;
	border: transparent !important;
	border: 1px solid rgba(0, 0, 0, 0.1) !important;
	height: 58px !important;
	padding-left: 15px;
	padding-right: 15px;
	background: transparent !important;
	color: rgba(0, 0, 0, 0.4) !important;
	font-size: 14px;
	text-align: right;
	border-radius: 0px;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
	width: 50% !important;
	border-right: none !important;
	border-left: none !important;
	border-top: none !important;
	border-bottom: none !important;
}

.fweather {
	font-weight: 300;
	border: transparent !important;
	border: 1px solid rgba(0, 0, 0, 0.1) !important;
	height: 58px !important;
	padding-left: 15px;
	padding-right: 15px;
	background: transparent !important;
	color: rgba(0, 0, 0, 0.4) !important;
	font-size: 14px;
	text-align: right;
	border-radius: 0px;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
	width: 100%;
	border-right: none !important;
	border-left: none !important;
	border-top: none !important;
	border-bottom: none !important;
}

.fcontent {
	font-weight: 300;
	border: transparent !important;
	border: 1px solid rgba(0, 0, 0, 0.1) !important;
	height: 300px !important;
	padding-left: 15px;
	padding-right: 15px;
	background: transparent !important;
	color: rgba(0, 0, 0, 0.4) !important;
	font-size: 14px;
	border-radius: 0px;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
	width: 100% !important;
	border-right: none !important;
	border-left: none !important;
	border-top: none !important;
	border-bottom: none !important;
}
</style>
</head>
<body>
	<div class="pcoded-main-container">
		<div class="pcoded-content">
			<!-- [ breadcrumb ] start -->


			<!-- Latest Customers start -->
			<div class="row">
				<div class="col-lg-9 col-md-12">
					<!-- 왼쪽 -->

					<div class="card table-card review-card">
						<div class="card-header borderless ">

							<button class="accordion" align="center">
								<h3 class="mb-4 billing-heading">날짜</h3>
							</button>
							<div class="panel">
								<p>
									<!-- 상세보기 시작 -->
								<div class="row">
									<div class="col-md-6">
										<form>
											<div class="form-group">
												<label for="exampleInputEmail1"><h5>시작시간</h5></label>
												<div class="form-row">
													<div class="form-group col-md-2">
														<select id="inputState" class="form-control">
															<option selected>오전</option>
															<option>오후</option>
														</select>
													</div>
													<div class="form-group col-md-2">
														<input type="text" class="form-control" id="inputCity">
													</div>
													<div class="form-group col-md-1">
														<br>시
													</div>
													<div class="form-group col-md-2">
														<input type="text" class="form-control" id="inputZip">
													</div>
													<div class="form-group col-md-1">
														<br>분
													</div>
												</div>
											</div>
											<div class="form-group">
												<label for="exampleInputEmail1"><h5>종료시간</h5></label>
												<div class="form-row">
													<div class="form-group col-md-2">
														<select id="inputState" class="form-control">
															<option selected>오전</option>
															<option>오후</option>
														</select>
													</div>
													<div class="form-group col-md-2">
														<input type="text" class="form-control" id="inputCity">
													</div>
													<div class="form-group col-md-1">
														<br>시
													</div>
													<div class="form-group col-md-2">
														<input type="text" class="form-control" id="inputZip">
													</div>
													<div class="form-group col-md-1">
														<br>분
													</div>
												</div>
											</div>
										</form>
									</div>
									<div class="col-md-6">
										<form>
											<div class="form-group">
												<label><h5>작업인력</h5></label> 
												<input type="text" class="form-control" placeholder="작업인원을 입력하세요">
											</div>
											<div class="form-group">
												<label><h5>날씨</h5></label> <input type="text" class="form-control"
													placeholder="날씨를 입력하세요">
											</div>
										<label><h5>파일첨부</label><p><p>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<span class="input-group-text">Upload</span>
												</div>
												<div class="custom-file">
													<input type="file" class="custom-file-input"
														id="inputGroupFile01"> 
														<label class="custom-file-label" for="inputGroupFile01">Choose file</label>
												</div>
											</div>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<span class="input-group-text">Upload</span>
												</div>
												<div class="custom-file">
													<input type="file" class="custom-file-input"
														id="inputGroupFile01"> 
														<label class="custom-file-label" for="inputGroupFile01">Choose file</label>
												</div>
											</div>
										</form>
									</div>

									<div class="col-md-12">
										<div class="form-group">
											<label for="exampleFormControlTextarea1"><h5>내용</h5></label>
											<textarea class="form-control"
												id="exampleFormControlTextarea1" rows="3"></textarea>
										</div>
									</div>
								<div class="col-md-12" align="center">	
									<button type="button" class="btn  btn-outline-success">등록</button>
									<button type="button" class="btn  btn-outline-danger">취소</button>
								</div>

								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 오른쪽 -->
				<div class="col-lg-3 col-md-12">
					<div class="card table-card review-card">
						<div class="card-header borderless ">
							<h5>달력</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- Required Js -->
	<script src="assets/js/vendor-all.min.js"></script>
	<script src="assets/js/plugins/bootstrap.min.js"></script>
	<script src="assets/js/ripple.js"></script>
	<script src="assets/js/pcoded.min.js"></script>

	<!-- Apex Chart -->
	<script src="assets/js/plugins/apexcharts.min.js"></script>


	<!-- custom-chart js -->
	<script src="assets/js/pages/dashboard-main.js"></script>

	<script>
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.display === "block") {
					panel.style.display = "none";
				} else {
					panel.style.display = "block";
				}
			});
		}
	</script>

</body>
</html>