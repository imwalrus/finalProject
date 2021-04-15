<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="updateOrder" method="post">
	<div class="row" align="center">
		<h4>송장 번호 입력</h4>
		<!-- 숨겨진 유저 ID -->
					<input type="hidden" id="orderlist_no" name="orderlist_no" value="${orderVO.orderlist_no }">
		<!-- 숨겨진 유저 ID -->
		<table class="table">
			<tr>
				<th>송장번호 입력 ${list }</th>
				<td><input type="text" id="orderlist_invoice" name="orderlist_invoice"></td>
			</tr>
			<tr>
				<th>주문상태 선택</th>
				<td><label> <input type="text" list="orderlist_condition"
						name="orderlist_condition"> <datalist id="orderlist_condition">
							<option value="결제완료"></option>
							<option value="배송중"></option>
							<option value="배송완료"></option>
						</datalist>
				</label>
				<td>
			</tr>
		</table>
	</div>
	<div align="center">
		<button type="submit" class="btn  btn-outline-warning">등록</button>
	</div>
</form>



