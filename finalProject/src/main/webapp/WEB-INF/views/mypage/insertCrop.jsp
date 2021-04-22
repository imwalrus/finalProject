<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/main/css/style.css">
<style>

.table th {
    font-weight: bolder;
}

</style>
<form action="insertCrop" method="post">
	<div class="row" align="center">
		<!-- 숨겨진 유저 ID -->
					<input type="hidden" id="orderlist_no" name="user_id" value="${user_id }">
		<!-- 숨겨진 유저 ID -->
		<table class="table">
			<tr>
				<th>작물명 입력</th>
				<td><input type="text" id="orderlist_invoice" name="crop_name" required></td>
			</tr>
		</table>
	</div>
	<div align="center">
		<button type="submit" class="btn  btn-outline-warning">등록</button>
	</div>
</form>