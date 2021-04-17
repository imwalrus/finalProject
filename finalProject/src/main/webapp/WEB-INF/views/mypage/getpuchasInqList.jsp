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
										<h2>구매 문의</h2>
									</div>
									<div class="card-body table-border-style">
										<div class="table-responsive">
											<table class="table">
												<tr class="table-success">
													<th>번호</th>
													<th>제목</th>
													<th>작성자</th>
													<th>비밀</th>
												</tr>
												
												<tbody>
													<c:if test="${fn:length(list) >=1 }">
													<c:forEach items="${list }" var="list">
														<tr  onclick="pQNAview('${list.pur_inq_no}')">
															<td>${list.pur_inq_no }</td>
															<td>${list.pur_inq_title }</td>
															<td>${list.user_id }</td>
															<td>${list.pur_inq_check }</td>
														</tr>
													</c:forEach>
													</c:if>
													<c:if test="${fn:length(list) == 0 }">
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
							<!-- [ Contextual-table ] end -->
						</div>
						<div align="center">
							<button type="button" class="btn  btn-outline-success" onclick="location.href='insertpuchasInq'">등록</button>
						</div>
					</div>
					<!-- [ vertically-modal ] end -->
				</div>


			</div>

			<!-- 상세모달시작 -->
			<div class="modal fade bd-example-modal-lg" id="pQNAview"
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
			<div class="modal fade bd-example-modal-lg" id="pQNAupdate"
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
	
		function pQNAview(str) {
			$('#pQNAview .modal-body').load("getpuchasInq?pur_inq_no=" + str);
			$('#pQNAview').modal('show');
			$('#pQNAupdate').modal('hide'); //수정모달 숨김

		}

		function pQNAupdate(strr) {
			$('#pQNAview').remove();
			$('#pQNAupdate .modal-body').load("updatepuchasInq?pur_inq_no=" + strr);
			$('#pQNAupdate').modal('show');
			$('#pQNAview').modal('hide');
		}
</script>
</body>
