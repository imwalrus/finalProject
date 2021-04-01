<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- histoty Modal-->
<form action="insertProduct" enctype="multipart/form-data" method="post">
	<div class="modal-header">
		<h4 class="modal-title" id="myModalLabel">
			<i class="text-muted fa fa-shopping-cart"></i> <strong>상품 등록</strong>
		</h4>
	</div>
	<div class="modal-body">
		<div class="col"></div>
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
							<input type="text" class="form-control-sm" name="user_id" size="33">
						</td>
					</tr>
					<tr>
						<td class="h6">
							<strong>종류</strong>
						</td>
						<td></td>
						<td class="h6">
							<input list="menu" class="form-control-sm" name="pro_category" size="33" autocomplete="off">
							<datalist id="menu">
								<option value="작물">작물</option>	
								<option value="야채">야채</option>
								<option value="과일">과일</option>
						</datalist>
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
							<strong>배송사</strong>
						</td>
						<td></td>
						<td class="h6">
							<input type="text" class="form-control-sm" name="pro_dcompany" size="33">
						</td>
					</tr>
					<tr>
						<td class="h6">
							<strong>배송비</strong>
						</td>
						<td></td>
						<td class="h6">
							<input type="text" class="form-control-sm" name="pro_dcost" size="33">
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
							<strong>상태</strong>
						</td>
						<td></td>
						<td class="h6">
							<input type="text" class="form-control-sm" name="pro_condition" size="33">
						</td>
					</tr>
					<tr>
						<td class="h6">
							<strong>이미지</strong>
						</td>
						<td></td>
						<td class="h6">
							<input type="file" class="form-control-sm" name="uploadFile">
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