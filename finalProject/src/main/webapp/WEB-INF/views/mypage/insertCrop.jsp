<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="insertCrop" method="post">
	<div class="row" align="center">
		<h4>작물 등록</h4>
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