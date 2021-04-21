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
				<div class="row">
					<div class="col-md-10">
						<form action="updateFdiary" enctype="multipart/form-data" method="post">
							<div class="card">
								<div class="card-header">
									<h3>영농일지 수정</h3>
								</div>
								<div class="card-body" align="center">
									<div class="col-md-10">
															
										<div class="row" id="addTable">
												<table class="table">
												<tr>
													<th id="day" colspan="6">
														<input type="hidden" name="fdiary_day" value="${list.fdiary_day}">
													</th>												
												</tr>
												<tr>
													<th><input type="hidden" name="user_id" value="${user_id}"><!-- 아이디값 hidden --> 
														<input type="hidden" name="fdiary_no" value="${list.fdiary_no}">
														농작물
													</th>
													<td>
														<input type="text" class="form-control" value="${list.crop_name}" readonly="readonly">

													</td>
													<th>시작시간</th>
														<td><input type="time" class="form-control" name="fdiary_stime" value="${list.fdiary_stime }"></td>
													<th>종료시간</th>
														<td><input type="time" class="form-control" name="fdiary_etime"  value="${list.fdiary_etime }"></td>
												</tr>
												<tr>
													<th>인력</th>
														<td><input type="text" class="form-control" name="fdiary_worker" value="${list.fdiary_worker }"></td>
													<th>날씨</th>
														<td><input type="text" class="form-control" name="fdiary_weather" value="${list.fdiary_weather }"></td>
													<th>사진첨부</th>
														<td><input multiple="multiple" type="file" name="uploadFile"><br>${list.fdiary_filename }
														<input type="hidden" id="fdiary_filename" name="fdiary_filename"></td>
												</tr>
												<tr>
													<th>내용</th>
													<td colspan="5">
															<textarea class="form-control" rows="3" id="fdiary_content" name="fdiary_content" style="float: left">
																${list.fdiary_content }
															</textarea>
													</td>
												</tr>
											</table>
										</div>
										<div class="col-md-12" align="center">
											<button type="submit" class="btn  btn-outline-success">등록</button>
											<button type="reset" class="btn  btn-outline-danger">입력취소</button>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
		<script type="text/javascript">
		
		var str = '${list.fdiary_day}';
		$('#day').append( 
				
				"<h5>" +	str.substring(0,10) + "</h5>"
	);
		
	</script>
</body>
</html>