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
	<form action="insertProduct" enctype="multipart/form-data" method="post">
		<div class="modal-header">
			<h4 class="modal-title" id="myModalLabel">
				<i class="text-muted fa fa-shopping-cart"></i> <strong>상품 등록</strong>
			</h4>
		</div>
		<div class="modal-body">
			<div class="col">
				<img id="imagePriview" src="resources/images/shop/noimage.jpg" alt="teste" class="img-thumbnail">
			</div>
			<div class="clearfix"></div>
			<div class="col">
				<table>
					<tbody>
						<tr>
							<td class="h6">
								<strong>판매자</strong>
							</td>
							<td></td>
							<td class="h6">
								<input type="text" class="form-control-sm" name="user_id" size="33" value="${user_id}" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td class="h6">
								<strong>상태</strong>
							</td>
							<td></td>
							<td class="h6">
								<select class="form-control-sm" name="pro_condition" style="width:260px;">
									<option value="준비중">준비중</option>
									<option value="판매중">판매중</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="h6">
								<strong>종류</strong>
							</td>
							<td></td>
							<td class="h6">
								<select class="form-control-sm" name="pro_category" style="width:260px;">
									<option value="작물">작물</option>
									<option value="야채">야채</option>
									<option value="과일">과일</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="h6">
								<strong>상품명</strong>
							</td>
							<td></td>
							<td class="h6">
								<input type="text" class="form-control-sm" name="pro_name" size="33">
							</td>
						</tr>
						<tr>
							<td class="h6">
								<strong>가격</strong>
							</td>
							<td></td>
							<td class="h6">
								<input type="text" class="form-control-sm" name="pro_price" size="33">
							</td>
						</tr>
						<tr>
							<td class="h6">
								<strong>수량</strong>
							</td>
							<td></td>
							<td class="h6">
								<input type="text" class="form-control-sm" name="pro_quantity" size="33">
							</td>
						</tr>
						<tr>
							<td class="h6">
								<strong>이미지</strong>
							</td>
							<td></td>
							<td class="h6">
								<input type="file" class="form-control-sm" id="uploadFile" name="uploadFile">
								<input type="hidden" name="pro_filename">
							</td>
						</tr>
						<tr>
							<td class="h6">
								<strong>내용</strong>
							</td>
							<td></td>
						</tr>
					</tbody>
				</table>
				<p>
					<textarea class="form-control" name="pro_content"></textarea>
				</p>
			</div>
		</div>
		<div class="modal-footer">
			<input type="submit" class="btn btn-success" value="등록">
			<input type="button" class="btn btn-info" data-dismiss="modal" value="닫기">
		</div>
	</form>
</body>