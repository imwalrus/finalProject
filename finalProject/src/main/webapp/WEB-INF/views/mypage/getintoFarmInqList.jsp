<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="resources/main/css/style.css">

<style>
.table thead th {
	background-color: #c3e6cb;
	font-weight: bold;
}

h4 {
	font-weight: bold;
}

h2 {
	font-weight: bold;
}
</style>
<body>
	<section class="pcoded-main-container">
		<div class="pcoded-main-container">
			<div class="pcoded-content">
				<div class="row">
					<div class="col-md-10">
						<div class="card">
							<div class="card-body" align="center">
								<div class="col-md-12">
									<div class="card-header">
										<h2>농촌속으로 문의</h2>
									</div>

									<table class="table table-hover">
										<colgroup>
													<col width="75%">
													<col width="5%">
													<col width="10%">
													<col width="10%">
										</colgroup>
										<thead>
											<tr>
												<th>제목</th>
												<th>작성자</th>
												<th>작성일자</th>
												<th>비밀여부</th>
											</tr>
										</thead>

										<tbody>
											<c:if test="${fn:length(list) >=1}">
												<c:forEach items="${list }" var="list">
													<tr onclick="iQNAview('${list.into_inq_no}')">
														<td style="text-align: left; max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${list.into_inq_title }</td>
														<td>${list.user_id}</td>
														<td>${list.into_inq_date}</td>
														<c:if test="${list.into_inq_check eq '1'}">
															<td style="width: 20%"><img src="resources/images/mypage/secrete.JPG" width="20" height="30"></td>
														</c:if>
														<c:if test="${list.into_inq_check eq '0'}">
															<td style="width: 20%"><img src="resources/images/mypage/nosecrete.JPG" width="20" height="30"></td>
														</c:if>
													</tr>
												</c:forEach>
											</c:if>
											<c:if test="${fn:length(list) == 0}">
												<tr>
													<td colspan="4">문의하신 내용이 없습니다.</td>
												</tr>
											</c:if>
										</tbody>
									</table>

								</div>
							</div>
						</div>
					</div>
				</div>


			</div>

			<!-- 상세모달시작 -->
			<div class="modal fade bd-example-modal-lg" id="iQNAview"
				tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
				aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header"><h4>문의 상세 내용</h4>
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

			<!-- 수정모달시작 -->
			<div class="modal fade bd-example-modal-lg" id="iQNAupdate"
				tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
				aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header"><h4>문의 내용 수정</h4>
						</div>
						<div class="modal-body"></div>
					</div>
				</div>
			</div>
			<!-- 모달끝 -->

		</div>
	</section>
	<script type="text/javascript">
		function iQNAview(str) {
			$('#iQNAview .modal-body')
					.load("getintoFarmInq?into_inq_no=" + str);
			$('#iQNAview').modal('show');
			$('#iQNAupdate').modal('hide'); //수정모달 숨김

		}

		function iQNAupdate(strr) {
			$('#iQNAview').remove();
			$('#iQNAupdate .modal-body').load(
					"updateintoFarmInq?into_inq_no=" + strr);
			$('#iQNAupdate').modal('show');
			$('#iQNAview').modal('hide');
		}
	</script>
</body>
</html>