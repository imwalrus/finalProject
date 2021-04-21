<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/main/css/style.css">

<style>
.table {
    width: 100%;
  }

.table th{
background-color: #c3e6cb;
font-weight: bold;
}
.modal-body {
    padding: 0px 0px!important;
}
.form-control:disabled, .form-control[readonly] {
    background-color: #FFFFFF !important;
}
</style>

	<!-- 모달바디 시작 -->
	<div class="modal-body">
	<img class="img-fluid card-img-top" src="./resources/images/mypage/${farm.farm_filename}" alt="Card image cap">

			<div class="card-body">
					<table class="table">
							<tr class="table-success">
								<th colspan="2" id="name"><h4>${farm.farm_name}</h4></th>								
								
							</tr>
							<tr>
								<th class="table-success">주소</th>
								<td id="adr">${farm.farm_adr}
								</td>								
							</tr>
							<tr>
								<th class="table-success">면적(㎡)</th>
								<td id="area">${farm.farm_area}</td>								
							</tr>
							<tr>
								<th class="table-success">내용</th>
								<td >	
									<textarea class="form-control" id="content" name="farm_content" rows="5" readonly="readonly">${farm.farm_content}</textarea>
								</td>							
							</tr>
							<tr>
								<td colspan="2">
									<button class="btn  btn-outline-warning" onclick="fnfarmUpdate('${farm.farm_no}')">수정</button>
									<button type="button" class="btn  btn-outline-danger" onclick="deleteAlert('${farm.farm_no }')">삭제</button>
								</td>
							</tr>												
						</table>

			</div>
		<!-- 수정모달시작 -->
			<div class="modal fade" id="farmUpdate" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header"><h3>농지수정</h3>
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
		<script src="resources/admin/js/pcoded.min.js"></script>
	<script type="text/javascript">
	
	//수정
		function fnfarmUpdate(str) {
		$('#farmUpdate .modal-body').load("updateFarms?farm_no=" + str);
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