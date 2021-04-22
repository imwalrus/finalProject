<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

</head>
<body>
	<section class="pcoded-main-container">
		<div class="pcoded-main-container">
			<div class="pcoded-content">

				<div class="row">
					<div class="col-md-10">
						<div class="card">
							<div class="card-body">
								<div class="card-header" align="center">
									<h2>구매 관련 문의</h2>
								</div>
								<form action="insertpuchasInq" enctype="multipart/form-data" method="post">
									<div class="row">

										<div class="col-md-6">
											<br>
											<input type="text" name="user_id"><!-- 사용자 이름 자동으로 들어오게 숨기기 -->
											<div class="form-group row">
												<label for="inputEmail3" class="col-sm-3 col-form-label"><h5>제목</h5></label>
												<div class="col-sm-9">
													<input type="text" class="form-control" name="pur_inq_title" placeholder="제목을 입력하세요" required>
												</div>
											</div>
											<br>
											<div class="form-group row">
												<label for="inputEmail3" class="col-sm-3 col-form-label"><h5>문의 할 제품</h5></label>
												<div class="col-sm-9">
													<input type="text" class="form-control" name="pro_no" placeholder="제품 번호를 입력하세요">
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword3" class="col-sm-3 col-form-label"><h5>파일첨부</h5></label>
												<div class="col-sm-9">
													<input multiple="multiple" type="file" class="form-control" name="inqfile">
													<input type="hidden" name="pur_inq_filename">	
												</div>
											</div>
											<br>
											<br>
											<div class="form-group row">
												<div class="col-sm-3"><h5>비밀여부</h5></div>
												<div class="col-sm-9">
													<div class="form-check">
														<input class="form-check-input" type="radio" name="pur_inq_check" value="1">사용
														<br>
														<input class="form-check-input" type="radio" name="pur_inq_check" value="0">사용안함
													</div>
												</div>
											</div>
											<br>
										</div>
										<div class="col-md-6">
											<br>
											<div class="form-group">
												<label for="exampleFormControlTextarea1"><h5>내용</h5></label>
												<textarea class="form-control" name="pur_inq_content" rows="10" required></textarea>
											</div>
										</div>

									</div>
									<div class="form-group row" align="center">
										<div class="col-sm-10">
											<button type="submit" class="btn  btn-outline-success">등록</button>
											<button type="reset" class="btn  btn-outline-danger">취소</button>
										</div>
									</div>
								</form>
							</div>

						</div>
					</div>
				</div>


			</div>



		</div>
	</section>

	<!-- Required Js -->
	<script src="resources/admin/js/vendor-all.min.js"></script>
	<script src="resources/admin/js/plugins/bootstrap.min.js"></script>
	<script src="resources/admin/js/ripple.js"></script>
	<script src="resources/admin/js/pcoded.min.js"></script>
</body>
</html>