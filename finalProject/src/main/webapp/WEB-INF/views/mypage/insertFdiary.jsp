<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/main/css/style.css">
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
				<div class="row">
					<div class="col-md-10">
						<form name="frm" action="insertFdiary" enctype="multipart/form-data" method="post" onsubmit="return check_submit()">
							<div class="card">
								<div class="card-header">
									<h3>영농일지 등록</h3>
								</div>
								<div class="card-body">
										<div class="row" id="addTable">
											<table class="table" align="center">
												<tr>
													<th colspan="6">작업일자&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="date" id="fdiary_day" name="fdiary_day" required="required">
													</th>											
												</tr>
												<tr text-align="center">
													<th><input type="hidden" name="user_id" value="${user_id}"><!-- 아이디값 hidden --> 
														농작물
									<!-- 작물추가 --><br>	<button type="button" class="btn btn-warning" onclick="openCrop()">+</button>
													</th>
													<td>
														<select class="form-control" id="crop_no" name="crop_no">
															<option value="none">===== 선택 =====</option>
															<c:forEach var="i" items="${croplist}" >
																<option value="${i.crop_no}">${i.crop_name}</options>
															</c:forEach>
														</select> 
														
														<br>
													</td>
													<th>시작시간</th>
														<td><input type="time" class="form-control" name="fdiary_stime"></td>
													<th>종료시간</th>
														<td><input type="time" class="form-control" name="fdiary_etime"></td>
												</tr>
												<tr>
													<th>인력(명)</th>
														<td><input type="number" class="form-control" name="fdiary_worker"></td>
													<th>날씨</th>
														<td><input type="text" class="form-control" name="fdiary_weather"></td>
													<th>사진첨부</th>
														<td><input multiple="multiple" type="file" name="uploadFile"> 
														<input type="hidden" name="fdiary_filename"></td>
												</tr>
												<tr>
													<th>내용</th>
													<td colspan="5"><textarea class="form-control" rows="3" name="fdiary_content"></textarea></td>
												</tr>
											</table>
										</div>
										<div class="col-md-12" align="center">
											<button type="submit" class="btn  btn-outline-success">등록</button>
											<button type="reset" class="btn  btn-outline-danger">입력취소</button>
										</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- 작물 추가 모달시작 -->
			<div class="modal fade" id="insertCrop"
				tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h4>작물 등록</h4>
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
	<!-- Required Js -->
	<script src="resources/admin/js/vendor-all.min.js"></script>
	<script src="resources/admin/js/plugins/bootstrap.min.js"></script>
	<script src="resources/admin/js/ripple.js"></script>
	<script src="resources/admin/js/pcoded.min.js"></script>
	<script type="text/javascript">
	//작물 추가 모달	
	function openCrop() {
		$('#insertCrop .modal-body').load( "insertCrop");
		$('#insertCrop').modal('show');

	}
	
	//오늘 날짜로 기본셋팅
	  	document.getElementById('fdiary_day').value = new Date().toISOString().substring(0, 10);;
	</script>

</body>
</html>