<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>청년농장</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<script>
	// 툴팁 활성화
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
	});

	// modal-단건 보기 불러오기
	function modalView(str) {
		$('#modal .modal-content').load("modalView?pro_no=" + str);
		$('#modal').modal();
	}

	// modal-등록 폼 불러오기
	function modalInsert() {
		$('#modal .modal-content').load("modalInsert");
		$('#modal').modal();
	}

	// modal-수정 폼 불러오기
	function modalUpdate(str) {
		$('#modal .modal-content').load("modalUpdate?pro_no=" + str);
		$('#modal').modal();
	}

	// 번호 값 삭제 모달로 넘기기
	function delFunc(e) {
		var tds = $(e.target).closest("tr").children()
		console.log(tds.eq(0).html());
		$('#pro_no').val(tds.eq(0).html());
	}

	// 페이징
	function goPage(p) {
		//	location.href="prodManage?page="+p;
		searchFrm.page.value = p;
		searchFrm.submit();
	}
</script>
</head>
<body class="goto-here">
	<!-- 관리 페이지 START  -->
	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-auto mr-auto">
					<h2>
						<b>판매 관리</b>
					</h2>
				</div>
				<!-- 등록, 판매 리스트 이동 버튼 -->
				<div class="col-auto">
					<a href="javascript:;" class="btn btn-success" onclick="modalInsert()">
						<span>상품 등록</span>
					</a>
					<a href="shop" class="btn btn-primary">
						<span>판매 리스트</span>
					</a>
				</div>
				<table class="table table-hover">
					<thead>
						<tr class="table-primary">
							<th scope="col">No.</th>
							<th scope="col">이름</th>
							<th scope="col">가격</th>
							<th scope="col">수량</th>
							<th scope="col">상태</th>
							<th scope="col">이미지</th>
							<th scope="col" align="center">카테고리</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<!-- 등록한 상품이 없을 경우 -->
						<c:if test="${empty manage}">
							<td colspan="8">판매 상품이 존재하지 않습니다.</td>
						</c:if>
						<!-- 등록한 상품이 있을 경우 -->
						<!-- c:forEach START -->
						<c:forEach items="${manage}" var="manage">
							<tr>
								<td scope="row">${manage.pro_no}</td>
								<td>${manage.pro_name}</td>
								<td>${manage.pro_price}원</td>
								<td>${manage.pro_quantity}</td>
								<td>${manage.pro_condition}</td>
								<td>${manage.pro_filename}</td>
								<td>${manage.pro_category}</td>
								<td>
									<!-- 단건 보기 Modal -->
									<a href="javascript:;" class="view" onclick="modalView('${manage.pro_no}')">
										<i class="material-icons" data-toggle="tooltip" title="보기">&#xe8f4;</i>
									</a>
									<!-- 수정 Modal -->
									<a href="javascript:;" class="edit" onclick="modalUpdate('${manage.pro_no}')">
										<i class="material-icons btn-outline-warning" data-toggle="tooltip" title="수정">&#xE254;</i>
									</a>
									<!-- 삭제 Modal -->
									<a href="#delProdModal" class="delete" data-toggle="modal" onclick="delFunc(event)">
										<i class="material-icons btn-outline-danger" data-toggle="tooltip" title="삭제">&#xE872;</i>
									</a>
								</td>
							</tr>
						</c:forEach>
						<!-- c:forEach END -->
					</tbody>
				</table>
			</div>
			<!-- 페이징 -->
			<form action="prodManage" name="searchFrm">
				<input type="hidden" name="page" value="1">
				<input type="hidden" name="user_id" value="${user_id}">
				<my:paging paging="${paging}" jsFunc="goPage" />
			</form>
		</div>
		<!-- 단건 보기 · 등록 · 수정 Modal -->
		<div class="modal" id="modal" tabindex="-1" role="dialog" aria-labelledby="historyModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content"></div>
			</div>
		</div>
		<!-- 상품 삭제 Modal -->
		<div id="delProdModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="deleteProduct" method="post">
						<input type="hidden" id="pro_no" name="pro_no">
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
	</section>
	<!-- 관리 페이지 END -->
</body>
</html>