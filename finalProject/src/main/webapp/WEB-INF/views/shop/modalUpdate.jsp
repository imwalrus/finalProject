<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<body>
	<script>
		//이미지 불러오기
		function readInputFile(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#imagePriview').attr("src", e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

		// 이미지 불러오기
		$('#uploadFile').change(function() {
			readInputFile(this);
		});
	</script>
	<form action="updateProduct" enctype="multipart/form-data" method="post">
		<input type="hidden" name="pro_no" value="${modal.pro_no}">
		<div class="modal-header">
			<h4 class="modal-title" id="myModalLabel">
				<i class="text-muted fa fa-shopping-cart"></i> <strong>No.${modal.pro_no}</strong> - ${modal.pro_name}
			</h4>
		</div>
		<div class="modal-body">
			<div class="col">
				<img id="imagePriview" src="resources/images/shop/${modal.pro_filename}" alt="teste" class="img-thumbnail">
			</div>
			<div class="clearfix"></div>
			<div class="col">
				<table>
					<tbody>
						<tr>
							<td class="h5">
								<strong>판매자</strong>
							</td>
							<td></td>
							<td class="h6">
								<input type="text" class="form-control-sm" name="user_id" value="${modal.user_id}" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td class="h5">
								<strong>상태</strong>
							</td>
							<td></td>
							<td class="h6">
								<select class="form-control-sm" name="pro_condition" style="width:170px;">
									<option <c:if test='${modal.pro_condition eq "준비중"}'>selected</c:if>>준비중</option>
									<option <c:if test='${modal.pro_condition eq "판매중"}'>selected</c:if>>판매중</option>
									<option <c:if test='${modal.pro_condition eq "품절"}'>selected</c:if>>품절</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="h5">
								<strong>종류</strong>
							</td>
							<td></td>
							<td class="h6">
								<select class="form-control-sm" name="pro_category" style="width:170px;">
									<option value="작물" <c:if test='${modal.pro_category eq "작물"}'>selected</c:if>>작물</option>
									<option value="채소" <c:if test='${modal.pro_category eq "채소"}'>selected</c:if>>채소</option>
									<option value="과일" <c:if test='${modal.pro_category eq "과일"}'>selected</c:if>>과일</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="h5">
								<strong>상품명</strong>
							</td>
							<td></td>
							<td class="h6">
								<input type="text" class="form-control-sm" name="pro_name" value="${modal.pro_name}">
							</td>
						</tr>
						<tr>
							<td class="h5">
								<strong>가격</strong>
							</td>
							<td></td>
							<td class="h6">
								<input type="text" class="form-control-sm" name="pro_price" value="${modal.pro_price}">
							</td>
						</tr>
						<tr>
							<td class="h5">
								<strong>배송사</strong>
							</td>
							<td></td>
							<td class="h6">
								<input type="text" class="form-control-sm" name="pro_dcompany" value="${modal.pro_dcompany}">
							</td>
						</tr>
						<tr>
							<td class="h5">
								<strong>수량</strong>
							</td>
							<td></td>
							<td class="h6">
								<input type="text" class="form-control-sm" name="pro_quantity" value="${modal.pro_quantity}">
							</td>
						</tr>
						<tr>
							<td class="h5">
								<strong>이미지</strong>
							</td>
							<td></td>
							<td class="h6">
								<div class="file_input_div">
									<input type="file" class="form-control-sm" id="uploadFile" name="uploadFile" onchange="javascript: document.getElementById('fileName').value = this.value" />
								</div>
								<input type="text" id="fileName" class="form-control-sm" readonly="readonly" value="${modal.pro_filename}">
							</td>
						</tr>
						<tr>
							<td class="h5">
								<strong>내용</strong>
							</td>
						</tr>
					</tbody>
				</table>
				<p>
					<textarea class="form-control" name="pro_content" cols="20" rows="10">${modal.pro_content}</textarea>
				</p>
			</div>
		</div>
		<div class="modal-footer">
			<input type="submit" class="btn btn-success" value="수정">
			<input type="button" class="btn btn-info" data-dismiss="modal" value="닫기">
		</div>
	</form>
</body>