<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/main/css/style.css">

<style>
.table thead th{
background-color: #c3e6cb;
font-weight: bold;
}
h2{
	font-weight: bold;
}
h3{
	font-weight: bold;
}
</style>
	<section class="pcoded-main-container">
		<div class="pcoded-main-container">
			<div class="pcoded-content">
				<div class="row">
					<div class="col-md-10">
						<div class="card" >
							<div class="card-body" align="center">

								<div class="col-md-12">
									<div class="card-header">
										<h2>나의 농지</h2>
									</div>
										<table class="table table-hover">
											<thead>
												<tr>
													<th>No</th>
													<th>농장이름</th>
													<th>주소</th>
													<th>면적(㎡)</th>
													<th></th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${farmlist }" var="fa">
													<tr onclick="fnfarmView('${fa.farm_no}')">
														<td>${fa.farm_no }</td>
														<td>${fa.farm_name }</td>
														<td>${fa.farm_adr }</td>
														<td>${fa.farm_area }</td>
														<td>

														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									<div class="col-md-10" align="center">
										<button type="submit" class="btn  btn-outline-success"
											onclick='fnfarmInsert()'>농장등록</button>
									</div>
								</div>
							</div>
						</div>
					</div>


				</div>



			</div>

			<!-- 상세보기 모달시작 -->
			<div class="modal fade" id="farmCenter" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header"><h3>농지상세정보</h3>
							<button class="close" type="button" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">x</span>
							</button>
						</div>
						<div class="modal-body"></div>
					
					
					</div>
				</div>
			</div>
			<!-- 끝 -->
			
		<!-- 등록보기 모달시작 -->
			<div class="modal fade bd-example-modal-lg" id="farmInsert" tabindex="-1" role="dialog"
				aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg"" role="document">
					<div class="modal-content">
					<div class="modal-header"><h3>농지등록</h3>
							<button class="close" type="button" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">x</span>
							</button>
						</div>
						<div class="modal-body"></div>
					</div>
				</div>
			</div>
			<!-- 끝 -->
		</div>
	</section>


	<script type="text/javascript">
	//상세조회
		function fnfarmView(str) {
			$('#farmCenter .modal-body').load("getFarms?farm_no=" + str);
			$('#farmCenter').modal('show');
			$('#farmUpdate').modal('hide');

		}
	//입력	
		function fnfarmInsert() {
			$('#farmInsert .modal-body').load("insertFarms");
			$('#farmInsert').modal('show');


		}
	
	//수정
		function fnfarmUpdate(str1) {
		$('#farmUpdate .modal-body').load("updateFarms?farm_no=" + str1);
		$('#farmCenter').modal('hide');		
		$('#farmUpdate').modal('show');
		


		}

	//삭제
		function deleteAlert(str) {
		var yn = confirm("정말 삭제할까요?");
		if (yn) {
			location.href = "deleteFarms?farm_no=" + str;
		} else {
			alert("삭제하지 못하였습니다.  ");
		}
			}
	</script>
