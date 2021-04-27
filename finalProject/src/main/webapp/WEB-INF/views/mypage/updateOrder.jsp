<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="resources/main/css/style.css">
<style>
.table th{
background-color: #c3e6cb;
font-weight: bold;
}
h4 {
	font-weight: bold;
}

h2 {
	font-weight: bold;
}
</style>

<form action="updateOrder" method="post">
	<div class="row" align="center">
		<h4>송장 번호 입력</h4>
		<!-- 숨겨진 유저 ID -->
					<input type="hidden" id="orderlist_no" name="orderlist_no" value="${orderVO.orderlist_no }">
		<!-- 숨겨진 유저 ID -->
		<table class="table">
		<tr>
				<th>주문상태 선택</th>
				<td><label> <select name="orderlist_condition" value="${orderVO.orderlist_condition }" style="width:151px; height:32px;"> 
								<option value="결제완료">결제완료</option>
								<option value="배송중">배송중</option>
								<option value="배송완료">배송완료</option>
							</select>
				</label>
				<td>
			</tr>
			<tr>
				<th>송장번호 입력</th>
				<td><input type="text" id="orderlist_invoice" name="orderlist_invoice" value="${orderVO.orderlist_invoice }"></td>
			</tr>
			
		</table>
	</div>
	<div align="center">
		<button type="submit" class="btn  btn-outline-warning">등록</button>
	</div>
</form>



