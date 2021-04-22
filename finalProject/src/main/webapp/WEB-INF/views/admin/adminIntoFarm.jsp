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
		// 화면 전환 후 select box 고정
		$("#select-sort").val('${param.into_progress}');
		// 검색 기능 : select태그 value값을 input태그 name으로 전달
		$('#select-search').change(function() {
			var select = $(this).find('option:selected');
			var value = select.attr('value');
			$('#search-input').attr('name', value);
		})
	});

	// modal-단건 보기 불러오기
	function adminIntoFarmSel(str) {
		$('#modal .modal-content').load("adminIntoFarmSel?into_no=" + str);
		$('#modal').modal();
	}

	// 삭제 모달로 넘기기
	function delFunc(e) {
		var tds = $(e.target).closest("tr").children()
		$('#into_no').val(tds.eq(0).html());
	}

	// 페이징
	function goPage(p) {
		//	location.href="adminIntoFarm?page="+p;
		searchFrm.page.value = p;
		searchFrm.submit();
	}
</script>
</head>
<body>
	<!-- 농촌속으로 현황 START -->
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
									<h2>농촌속으로 현황</h2>
									<!-- 카테고리 : 전체·진행중·종료 -->
									<div class="form-group float-right">
										<select class="custom-select" id="select-sort" onchange="location.href='adminIntoFarm?into_progress=' + (this.value);">
											<option value="">전체</option>
											<option value="0">진행중</option>
											<option value="1">종료</option>
										</select>
									</div>
									<div class="table-responsive">
										<!-- 테이블 START -->
										<table class="table" style="table-layout: fixed">
											<thead>
												<tr class="table-success">
													<th width="5%">No.</th>
													<th width="10%">ID</th>
													<th width="15%">체험이름</th>
													<th width="10%">지역</th>
													<th width="30%">일정</th>
													<th width="10%">모집인원수</th>
													<th width="10%">진행여부</th>
													<th></th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${empty intoFarm}">
													<td colspan="8">내용이 존재하지 않습니다.</td>
												</c:if>
												<c:forEach items="${intoFarm}" var="intoFarm">
													<tr>
														<td width="5%" class="text-truncate">${intoFarm.into_no}</td>
														<td width="10%" class="text-truncate">${intoFarm.user_id}</td>
														<td width="15%" class="text-truncate">${intoFarm.into_title}</td>
														<td width="10%" class="text-truncate">${intoFarm.into_city}</td>
														<td width="30%" class="text-truncate">${intoFarm.into_date}</td>
														<td width="10%" class="text-truncate">${intoFarm.into_entry}명</td>
														<c:choose>
															<c:when test="${intoFarm.into_progress eq 0}">
																<td width="10%">진행중</td>
															</c:when>
															<c:when test="${intoFarm.into_progress eq 1}">
																<td width="10%">종료</td>
															</c:when>
														</c:choose>
														<td>
															<!-- 보기 Modal -->
															<a href="javascript:;" class="view" onclick="adminIntoFarmSel('${intoFarm.into_no}')">
																<i class="material-icons" data-toggle="tooltip" title="보기">&#xe8f4;</i>
															</a>
															<!-- 삭제 Modal -->
															<a href="#intoFarmDelModal" class="delete" data-toggle="modal" onclick="delFunc(event)">
																<i class="material-icons btn-outline-danger" data-toggle="tooltip" title="삭제">&#xE872;</i>
															</a>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<!-- 테이블 END -->
										<!-- 페이징 START -->
										<form action="adminIntoFarm" name="searchFrm">
											<input type="hidden" name="into_progress" value="${intoTheFarmVO.into_progress}">
											<input type="hidden" name="into_title" value="${intoTheFarmVO.into_title}">
											<input type="hidden" name="into_city" value="${intoTheFarmVO.into_city}">
											<input type="hidden" name="into_product" value="${intoTheFarmVO.into_product}">
											<input type="hidden" name="page" value="1">
											<my:paging paging="${paging}" jsFunc="goPage" />
										</form>
										<!-- 페이징 END -->
									</div>
									<!-- 검색창 START -->
									<form action="adminIntoFarm" class="search-form col-md-10 row">
										<div class="col-md-3">
											<select class="custom-select" id="select-search">
												<option value="into_title" selected>체험이름</option>
												<option value="into_city">지역</option>
												<option value="into_product">종류</option>
											</select>
										</div>
										<div class="col-md-7">
											<input type="hidden" name="page" value="1">
											<div class="form-group">
												<span class="icon ion-ios-search"></span>
												<input type="text" class="form-control" id="search-input" name="into_title" placeholder="Search...">
											</div>
										</div>
										<div class="col-md-2">
											<button type="submit" class="btn btn-secondary">검색</button>
										</div>
									</form>
									<!-- 검색창 END -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 단건 보기 Modal 이동 START -->
			<div class="modal" id="modal" tabindex="-1" role="dialog" aria-labelledby="historyModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content"></div>
				</div>
			</div>
			<!-- 단건 보기 Modal 이동 END -->
			<!-- 삭제 Modal START -->
			<div id="intoFarmDelModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<form action="adminIntoFarmDel" method="post">
							<input type="hidden" id="into_no" name="into_no">
							<div class="modal-body">
								<p>정말로 삭제하시겠습니까?</p>
								<p class="text-warning">
									<small>이 작업은 되돌릴 수 없습니다.</small>
								</p>
							</div>
							<div class="modal-footer">
								<input type="submit" class="btn btn-danger" value="삭제">
								<input type="button" class="btn btn-info" data-dismiss="modal" value="닫기">
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- 삭제 Modal END -->
		</div>
	</section>
	<!-- 농촌속으로 현황 END -->
</body>
</html>