<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="resources/main/css/style.css">

<style>
.table thead th{
background-color: #c3e6cb;
font-weight: bold;
}
h4{
font-weight: bold;
}
h2{
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
										<h2>판매상품 문의 관리</h2>
									</div>
									<div class="card-body table-border-style">
										<div class="table-responsive">
											<table class="table table-hover">
											<colgroup>
													<col width="5%">
													<col width="80%">
													<col width="5%">
													<col width="10%">
											</colgroup>
												<tr class="table-success">
													<th align="center">NO</th>
													<th align="center">제목</th>
													<th align="center">작성자</th>
													<th align="center">작성일자</th>
												</tr>
												
												<tbody>
													<c:if test="${fn:length(list) >=1 }">
													<c:forEach items="${list }" var="list">
														<tr  onclick="pQNAview('${list.pur_inq_no}')">
															<td>${list.pur_inq_no }</td>
															<td style="text-align: left; max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${list.pur_inq_title }</td>
															<td>${list.user_id }</td>
															<td>${list.pur_inq_date }</td>
														</tr>
													</c:forEach>
													</c:if>
													<c:if test="${fn:length(list) == 0 }">
														<tr>
															<td colspan="4">문의 내용이 없습니다.</td>
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
				</div>


			</div>

			<!-- 상세모달시작 -->
			<div class="modal fade bd-example-modal-lg" id="pQNAview"
				tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
				aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header"><h4>구매문의 상세 내용</h4>
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
						<div class="modal-header"><h4>구매문의 내용 수정</h4>
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
			$('#pQNAupdate .modal-body').load("updatepuchasInq?pur_inq_no=" + strr);
			$('#pQNAview').modal('hide');
			$('#pQNAupdate').modal('show');
			
		}
</script>
</body>
