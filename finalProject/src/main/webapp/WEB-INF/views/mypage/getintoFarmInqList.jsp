<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 
<!DOCTYPE html>
<html lang="ko">

<head>
<title>회원 탈퇴</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="" />
<meta name="keywords" content="">
<meta name="author" content="Phoenixcoded" />
Favicon icon
<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">

vendor css
<link rel="stylesheet" href="resources/admin/css/style.css">
</head> -->
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
										<h2>농촌속으로 문의</h2>
									</div>
									<div class="card-body table-border-style">
										<div class="table-responsive">
											<table class="table">
												<tr class="table-success">
													<th>번호</th>
													<th>제목</th>
													<th>작성자</th>
													<th>비밀여부</th>
												</tr>
											<c:if test="${ilist.user_id eq user_id}">
												<tbody>
													<c:if test="${fn:length(list) >=1}">
													<c:forEach items="${list }" var="list">
														<tr  onclick="iQNAview('${list.into_inq_no}')">
															<td>${list.into_inq_no }</td>
															<td>${list.into_inq_title }</td>
															<td>${list.user_id }</td>
														<c:if test="${list.into_inq_check eq '1'}">
       														<td>
       															<img src="resources/img/secrete.jpg">
       														</td>
       													</c:if>		
       														<c:if test="${list.into_inq_check eq '0'}">
       															<td>
       																<img src="resources/img/nosecrete.jpg">
       															</td>
       														</c:if>	
														</tr>
													</c:forEach>
													</c:if>
													<c:if test="${fn:length(list) >=0}">
														<tr>
															<td colspan="3"> 문의하신 내용이 없습니다. </td>
														</tr>
													</c:if>
												</tbody>
											</c:if>
									<c:if test="${ilist.user_id ne user_id}">
										<tbody>
											<tr>
												<th colspan="4">
													작성된 문의글이 없습니다.
												</th>
											</tr>
										</tbody>
									</c:if>
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