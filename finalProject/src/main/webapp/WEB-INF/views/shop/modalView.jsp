<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<body>
	<div class="modal-header">
		<h4 class="modal-title" id="myModalLabel">
			<i class="text-muted fa fa-shopping-cart"></i> <strong>No.${modal.pro_no}</strong> - ${modal.pro_name}
		</h4>
	</div>
	<div class="modal-body">
		<div class="col">
			<img src="resources/images/shop/${modal.pro_filename}" alt="teste" class="img-thumbnail">
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
						<td class="h6">&nbsp;&nbsp;&nbsp;${modal.user_id}</td>
					</tr>
					<tr>
						<td class="h5">
							<strong>종류</strong>
						</td>
						<td></td>
						<td class="h6">&nbsp;&nbsp;&nbsp;${modal.pro_category}</td>
					</tr>
					<tr>
						<td class="h5">
							<strong>상품명</strong>
						</td>
						<td></td>
						<td class="h6">&nbsp;&nbsp;&nbsp;${modal.pro_name}</td>
					</tr>
					<tr>
						<td class="h5">
							<strong>가격</strong>
						</td>
						<td></td>
						<c:set var="price" value="${modal.pro_price}" />
						<td class="h6">
							&nbsp;&nbsp;&nbsp;
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" />원
						</td>
					</tr>
					<tr>
						<td class="h5">
							<strong>배송사</strong>
						</td>
						<td></td>
						<td class="h6">&nbsp;&nbsp;&nbsp;${modal.pro_dcompany}</td>
					</tr>
					<tr>
						<td class="h5">
							<strong>수량</strong>
						</td>
						<td></td>
						<td class="h6">&nbsp;&nbsp;&nbsp;${modal.pro_quantity}</td>
					</tr>
					<tr>
						<td class="h5">
							<strong>상태</strong>
						</td>
						<td></td>
						<td class="h6">&nbsp;&nbsp;&nbsp;${modal.pro_condition}</td>
					</tr>
					<tr>
						<td class="h5">
							<strong>내용</strong>
						</td>
					</tr>
				</tbody>
			</table>
			<p>${modal.pro_content}</p>
		</div>
	</div>
	<div class="modal-footer">
		<input type="button" class="btn btn-info" data-dismiss="modal" value="닫기">
	</div>
</body>