<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	text-align: center;
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
					<div class="card-body">
						<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
							<li class="nav-item">
								<a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">Home</a>
							</li>
						</ul>
						<c:forEach items="${list }" var="fd">
						<div class="tab-content" id="pills-tabContent">
							<div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
							<div> <!-- 반복시작 -->
							<button class="accordion" align="center">
								<h3 class="mb-4 billing-heading">${fd.fday }</h3>
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
														<input type="text" class="form-control" value="${fd.sampm }" readonly="readonly"> 
													</div>
													<div class="form-group col-md-2">
														<input type="text" class="form-control" value="${fd.ssi }" readonly="readonly">
														
													</div>
													<div class="form-group col-md-1">
														<br>시
													</div>
													<div class="form-group col-md-2">
														<input type="text" class="form-control" value="${fd.sbun }" readonly="readonly">
														
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
														<input type="text" class="form-control" value="${fd.eampm }" readonly="readonly">
													</div>
													<div class="form-group col-md-2">
														<input type="text" class="form-control" value="${fd.esi }" readonly="readonly">
													</div>
													<div class="form-group col-md-1">
														<br>시
													</div>
													<div class="form-group col-md-2">
														<input type="text" class="form-control" value="${fd.ebun }" readonly="readonly">
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
												<input type="text" class="form-control" value="${fd.fdiary_worker }" readonly="readonly">
											</div>
											<div class="form-group">
												<label><h5>날씨</h5></label> <input type="text" class="form-control"
													value="${fd.fdiary_weather }" readonly="readonly">
											</div>
										</form>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="exampleFormControlTextarea1"><h5>파일첨부</h5></label>
												<div class="card-body">
													<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
														<div class="carousel-inner">
															<div class="carousel-item active">
																	<img class="img-fluid d-block w-100" src="assets/images/slider/img-slide-4.jpg" alt="First slide">
															</div>
															<div class="carousel-item">
																	<img class="img-fluid d-block w-100" src="assets/images/slider/img-slide-3.jpg" alt="Second slide">
								</div>
							</div>
							<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev"><span class="carousel-control-prev-icon" aria-hidden="true"></span><span class="sr-only">Previous</span></a>
							<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next"><span class="carousel-control-next-icon" aria-hidden="true"></span><span class="sr-only">Next</span></a>
						</div>
					</div>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="exampleFormControlTextarea1"><h5>내용</h5></label>
											<textarea class="form-control"id="exampleFormControlTextarea1" rows="3" readonly="readonly">
											${fd.fdiary_content }</textarea>
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
							</c:forEach>
						
					</div>
					</div>
					</div>
				</div>
				<!-- 오른쪽 -->
				<div class="col-lg-3 col-md-12">
					<div class="card table-card review-card">
						<div class="card-header borderless ">
							<h5>달력</h5>
						<div class="col-md-12" align="center">	
									<button type="button" class="btn  btn-outline-success">등록</button>
									
						</div>
						</div>
					</div>
				</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- Required Js -->
	<script src="resources/admin/js/vendor-all.min.js"></script>
	<script src="resources/admin/js/plugins/bootstrap.min.js"></script>
	<script src="resources/admin/js/ripple.js"></script>
	<script src="resources/admin/js/pcoded.min.js"></script>

	<!-- Apex Chart -->
	<script src="resources/admin/js/plugins/apexcharts.min.js"></script>


	<!-- custom-chart js -->
	<script src="resources/admin/js/pages/dashboard-main.js"></script>

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