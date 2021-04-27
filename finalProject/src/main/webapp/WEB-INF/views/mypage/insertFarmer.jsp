<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/main/css/style.css">

<body>
	<section class="pcoded-main-container">
		<div class="pcoded-main-container">
			<div class="pcoded-content">
				<div class="row">
					<div class="col-md-10">
					
						<div class="card">
							<!-- 농업인 권한 신청 안한 user가 보이는 화면 -->
							<div class="card-body" align="center" id="userView">
								<div class="col-md-9">
									<div class="card-header">
										<h2>농업인 권한 신청</h2>
									</div>
									<div class="alert alert-success mb-0" role="alert">
										<div class="col-md-12">
											<h4>영농인 권한을 부여받을시 아래와 같은 기능들이 추가됩니다.</h4>
										</div>
										<div class="col-md-4" style="text-align: left">
											<h5>
												<br>1. 영농일지 작성 <br>2. 소개페이지 <br> (농지 및 농작물
												등록) <br>3. 농작물 판매 <br>4. 영농일지 작성 <br>5. 커뮤니티
												게시판 사용
											</h5>
										</div>
									</div>
									<br>
									<div align="center">
										<div class="col-md-9">
											<form action="insertFarmer" method="post"
												enctype="multipart/form-data" class="was-validated">
												<div class="form-group row">
													<label for="inputEmail3" class="col-sm-4 col-form-label">
														<h6>ID</h6>
													</label>
													<div class="col-sm-5" id="userId">
														<input type="text" class="form-control" id="user_id"
															name="user_id" value="${user_id }" readonly="readonly">
														

													</div>
												</div>
												<div class="form-group row">
													<label for="inputEmail3" class="col-sm-4 col-form-label">
														<h6>파일첨부</h6>
													</label>

													<div class="col-sm-8">

														<input multiple="multiple" type="file" name="uploadFile"
															required> <input type="hidden"
															name="farmer_filename">
														<div class="invalid-feedback">사업자등록증 (pdf, jpeg,jpg)
															첨부 필요</div>

													</div>
													<div></div>

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
							<!-- 끝  -->

							<!-- 농업인 신청 후 대기화면  -->
							<div class="card-body" align="center" id="farmerWait">
								<div class="col-md-9">
									<div class="card-header">
										<h2>농업인 권한 신청</h2>
									</div>
									<div class="alert alert-success mb-0" role="alert">
										<div class="col-md-9">
											<div class="spinner-border text-success"
												style="width: 3rem; height: 3rem;" role="status"></div>
											<h2>현재 농업인 권한 신청 대기중 입니다.</h2>
											<br> <br>
											<h3>
												완료시 마이페이지 상단에 <br>농업인 표시가 확인됩니다.
											</h3>
										</div>
										<br>
									</div>
								</div>
							</div>
							<!-- 끝 -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
	
		$.ajax({
			url : 'ajaxgetFarmerlist',
			data : "user_id=" + '${user_id}',
			dataType : "json",
			success : function(data){
					//console.log(data)
					//$('input[name=farmer_check]').attr('value',data[i].farmer_check);
					if(data.length == 0){
						$('#userView').show();
						$('#farmerWait').hide();
					}else{
						$('#userView').hide();
						$('#farmerWait').show();						
					}
				}

		});

	</script>
</body>
