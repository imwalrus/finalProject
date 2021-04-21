<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">

<head>

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
<style>

.table {
    width: 100%;
    border: 1px solid #444444;
  }
.table td, .table th {
    border-top: 0px;
    white-space: nowrap;
    padding: 1.05rem 0.75rem;
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
							<div class="card-header">
									<label  style="float: left">
												<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												날짜선택</h5></label>
									<!-- <input type="date" id="fdiary_day" name="fdiary_day" class="col-sm-2" style="float: left"> -->
                                   <button type="button" name="add" class="btn btn-warning" style="float: right">일지추가</button>                                            
							</div>
							<div class="card-body" align="center">
								<div class="col-md-10">
									<form action="insertFdiary" enctype="multipart/form-data" method="post">
										<div class="row" id="addTable">
											<table class="table">
												<tr>												
													<th><input type="hidden" name="user_id" value="${user_id}">농작물</th>
													<td>													
														<input type="select" class="form-control" name="crop_no">
														<input type="date" id="fdiary_day" name="fdiary_day">	
													</td>
													<th>시작시간</th>
													<td><input type="time" class="form-control"
														name="fdiary_stime"></td>
													<th>종료시간</th>
													<td><input type="time" class="form-control"
														name="fdiary_etime"></td>
												</tr>
												<tr>
													<th>인력</th>
													<td><input type="text" class="form-control"
														name="fdiary_worker"></td>
													<th>날씨</th>
													<td><input type="text" class="form-control"
														name="fdiary_weather"></td>
													<th>사진첨부</th>
													<td><input multiple="multiple" type="file"
														name="uploadFile"> <input type="hidden"
														name="fdiary_filename"></td>
												</tr>
												<tr>
													<th>내용</th>
													<td colspan="5"><textarea class="form-control"
															rows="3" name="fdiary_content"></textarea></td>
												</tr>
											</table>
											<hr>
										</div>
										<div class="col-md-12" align="center">
												<button type="submit" class="btn  btn-outline-success">등록</button>
												<button type="reset" class="btn  btn-outline-danger">입력취소</button>
										</div>
									</form>
								</div>

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
	<script type="text/javascript">
	
	//일지 추가
		$(document).ready(function() {
			$(document).on("click", "button[name='add']", function() {
				$("#addTable").append(
					"<table class='table'><tr><th><input type='hidden' name='user_id' value='${user_id}'>농작물</th><td>"
					+"<input type='date' class='form-control' name='crop_no'><input type='date' id='fdiary_day' name='fdiary_day'></td>"
					+"<th>시작시간</th><td>"
					+"<input type='time' class='form-control' name='fdiary_stime'></td>"
					+"<th>종료시간</th><td>"
					+"<input type='time' class='form-control' name='fdiary_etime'></td></tr>"
					+"<tr><th>인력</th><td>"
					+"<input type='text' class='form-control' name='fdiary_worker'></td>"
					+"<th>날씨</th><td>"	
					+"<input type='text' class='form-control' name='fdiary_weather'></td>"
					+"<th>사진첨부</th><td>"
					+"<input multiple='multiple' type='file' name='uploadFile'><input type='hidden' name='fdiary_filename'></td></tr>"
					+"<tr><th>내용</th>"
					+"<td colspan='5'><textarea class='form-control' rows='3' name='fdiary_content'></textarea></td></tr>"
					+"</table>"
				
				
				);
			});//end addTable
			
		});
		

	</script>
</body>
</html>