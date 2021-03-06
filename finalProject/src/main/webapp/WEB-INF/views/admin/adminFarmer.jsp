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
		$("#select-sort").val('${param.farmer_check}');
	});

	// modal-단건 보기 불러오기
	function adminFarmerSel(str) {
		$('#modal .modal-content').load("adminFarmerSel?user_id=" + str);
		$('#modal').modal();
	}
	
	// 승인 모달로 넘기기
	function chkFunc(e) {
		var tds = $(e.target).closest("tr").children()
		$('#user_id1').val(tds.eq(1).html());
	}

	// 취소 모달로 넘기기
	function canFunc(e) {
		var tds = $(e.target).closest("tr").children()
		$('#user_id2').val(tds.eq(1).html());
	}

	// 페이징
	function goPage(p) {
		//	location.href="adminFarmer?page="+p;
		searchFrm.page.value = p;
		searchFrm.submit();
	}
</script>
</head>
<body>
	<!-- 신청 현황 START -->
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
									<h2>농업인 권한 신청 현황</h2>
									<!-- 카테고리 : 전체·진행중·승인·취소 -->
									<div class="form-group float-right">
										<select class="custom-select" id="select-sort" onchange="location.href='adminFarmer?farmer_check=' + (this.value);">
											<option value="">전체</option>
											<option value="0">진행중</option>
											<option value="1">승인</option>
											<option value="2">취소</option>
										</select>
									</div>
									<div class="table-responsive">
										<table class="table" style="table-layout: fixed">
											<thead>
												<tr class="table-success">
													<th width="10%">No.</th>
													<th width="15%">ID</th>
													<th width="15%">이름</th>
													<th width="20%">날짜</th>
													<th width="15%">결과</th>
													<th></th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${empty farmer}">
													<td colspan="6">내용이 존재하지 않습니다.</td>
												</c:if>
												<c:forEach items="${farmer}" var="farmer">
													<tr>
														<td width="10%">${farmer.farmer_no}</td>
														<td width="15%">${farmer.user_id}</td>
														<td width="15%">${farmer.user_name}</td>
														<td width="20%">${farmer.farmer_date}</td>
														<c:choose>
															<c:when test="${farmer.farmer_check eq 0}"><td width="15%">진행중</td></c:when>
															<c:when test="${farmer.farmer_check eq 1}"><td width="15%">승인</td></c:when>
															<c:when test="${farmer.farmer_check eq 2}"><td width="15%">취소</td></c:when>
														</c:choose>
														<td>
															<!-- 보기 Modal -->
															<a href="javascript:;" class="view" onclick="adminFarmerSel('${farmer.user_id}')">
																<i class="material-icons" data-toggle="tooltip" title="보기">&#xe8f4;</i>
															</a>
															<c:if test="${farmer.farmer_check eq 0}">
															<!-- 승인 Modal -->
															<a href="#chkFarmerModal" class="check" data-toggle="modal" onclick="chkFunc(event)">
																<i class="material-icons btn-outline-success" data-toggle="tooltip" title="승인">&#xe5ca;</i>
															</a>
															<!-- 취소 Modal -->
															<a href="#canFarmerModal" class="cancel" data-toggle="modal" onclick="canFunc(event)">
																<i class="material-icons btn-outline-danger" data-toggle="tooltip" title="취소">&#xe5cd;</i>
															</a>
															</c:if>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<form action="adminFarmer" name="searchFrm">
											<input type="hidden" name="farmer_check" value="${userVO.farmer_check}">
											<input type="hidden" name="page" value="1">
											<my:paging paging="${paging}" jsFunc="goPage" />
										</form>
									</div>
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
			<!-- 승인 Modal START -->
			<div id="chkFarmerModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<form action="adminFarmerUpt" method="post">
							<input type="hidden" id="user_id1" name="user_id">
							<input type="hidden" name="user_auth" value="farmer">
							<input type="hidden" name="farmer_check" value="1">
							<div class="modal-body">
								<p>신청을 승인하시겠습니까?</p>
							</div>
							<div class="modal-footer">
								<input type="submit" class="btn btn-success" value="확인">
								<input type="button" class="btn btn-info" data-dismiss="modal" value="닫기">
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- 승인 Modal END -->
			<!-- 취소 Modal START -->
			<div id="canFarmerModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<form action="adminFarmerUpt" method="post">
							<input type="hidden" id="user_id2" name="user_id">
							<input type="hidden" name="user_auth" value="user">
							<input type="hidden" name="farmer_check" value="2">
							<div class="modal-body">
								<p>신청을 취소하시겠습니까?</p>
							</div>
							<div class="modal-footer">
								<input type="submit" class="btn btn-success" value="확인">
								<input type="button" class="btn btn-info" data-dismiss="modal" value="닫기">
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- 취소 Modal END -->
		</div>
	</section>
	<!-- 신청 현황 END -->
</body>
</html>