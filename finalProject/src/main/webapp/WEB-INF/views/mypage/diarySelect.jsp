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
		<div class="pcoded-main-container">
			<div class="pcoded-content">
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
															
										<div class="row" id="addTable">${list.fdiary_no}
												
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

</body>
</html>