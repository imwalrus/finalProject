<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
							<div class="card-body" align="center">

								<!-- [ Contextual-table ] start -->
								<div class="col-md-9">
									<div class="card-header">
										<h2>농촌속으로 문의 관리</h2>
									</div>
									<div class="card-body table-border-style">
										<div class="table-responsive">
											<table class="table">
												<tr class="table-success">
													<th>No</th>
													<th>Title</th>
													<th>Secrete</th>
												</tr>

												<tbody>
													<c:if test="${fn:length(list) >=1}">
													<c:forEach items="${list }" var="list">
														<tr  onclick="iQNAview('${list.into_inq_no}')">
															<td>${list.into_inq_no }</td>
															<td>${list.into_inq_title }</td>
															<td>${list.into_inq_check }</td>
														</tr>
													</c:forEach>
													</c:if>
													<c:if test="${fn:length(list) >=0}">
														<tr>
															<td colspan="3"> 문의하신 내용이 없습니다. </td>
														</tr>
													</c:if>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<!-- [ Contextual-table ] end -->
						</div>
						<div align="center">
							<button type="button" class="btn  btn-outline-success" onclick="location.href='insertintoFarmInq'">등록</button>
						</div>
					</div>
					<!-- [ vertically-modal ] end -->
				</div>


			</div>

			<!-- 상세모달시작 -->
			<div class="modal fade bd-example-modal-lg" id="iQNAview"
				tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
				aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
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
						<div class="modal-header">
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
	<script type="text/javascript">
	
		function iQNAview(str) {
			$('#iQNAview .modal-body').load("getintoFarmInq?into_inq_no=" + str);
			$('#iQNAview').modal('show');
			$('#iQNAupdate').modal('hide'); //수정모달 숨김

		}

		function iQNAupdate(strr) {
			$('#iQNAview').remove();
			$('#iQNAupdate .modal-body').load("updateintoFarmInq?into_inq_no=" + strr);
			$('#iQNAupdate').modal('show');
			$('#iQNAview').modal('hide');
		}
	</script>
</body>
</html>