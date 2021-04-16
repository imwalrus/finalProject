<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>관리자</title>
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="" />
<meta name="keywords" content="">
<meta name="author" content="Phoenixcoded" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		// 툴팁 활성화
		$('[data-toggle="tooltip"]').tooltip();
	});

	}
</script>
</head>
<body>
	<!-- 배너 관리 START -->
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
						<div class="card">
							<div class="card-body" align="center">
								<div class="col-md-9">
									<h2>배너 관리</h2>
									<div class="table-responsive">
										<!-- 테이블 START -->
										<table class="table" style="table-layout: fixed">
											<thead>
												<tr class="table-success">
													<th width="10%">제목</th>
													<th width="45%">링크</th>
													<th width="35%">이미지</th>
													<th width="10%">여부</th>
													<th width="5%"></th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${applicationScope.banner}" var="banner">
												
										<form action="adminBannerUpt" name="bannerUpt">
													<tr>
															<input type="text" name="banner_no" value="${banner.banner_no}">
														<td width="10%">${banner.banner_title}</td>
														<td width="45%" class="text-truncate">
															<input type="text" name="banner_link" size="40" value="${banner.banner_link}">
														</td>
														<td width="35%" class="text-truncate">
															<img src="resources/images/banner/${banner.banner_filename}">
															<div class="file_input_div">
																<input type="file" class="form-control-sm" name="uploadFile" onchange="javascript: document.getElementById('fileName').value = this.value" />
															</div>
															<input type="hidden" id="fileName" name="banner_fileName" class="form-control-sm" readonly="readonly" value="${banner.banner_filename}">
														</td>
														<td width="10%">${banner.banner_check}</td>
														<td width="5%">
															<!-- 보기 Modal -->
															<button class="material-icons btn-outline-warning" data-toggle="tooltip" title="수정">&#xE254;</button>
														</td>
													</tr>
										</form>
												</c:forEach>
											</tbody>
										</table>
										<!-- 테이블 END -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 배너 관리 END -->
</body>
</html>