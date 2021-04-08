<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="updateOrder" method="post">
	<div class="row" align="center">
		<h4>구매 문의 내용</h4>
		<table class="table">
			<tr>
				<th class="table-success">제목</th>
				<td colspan="5">${plist.pur_inq_title }</td>
			</tr>
			<tr>
				<th class="table-success">작성일</th>
				<td>${plist.pur_inq_date }</td>
				<td class="table-success">비밀글</td>
				<td>${plist.pur_inq_check}</td>
				<th class="table-success">작성자</th>
				<th>${plist.user_id}</th>
			</tr>
			<tr>
				<td colspan="7"><img class="img-fluid card-img-top"
					alt="Card image cap">${plist.pur_inq_filename}</td>
			</tr>
			<tr>
				<th class="table-success">내용</th>
				<td colspan="7">${pupdate.pur_inq_content}</td>
			</tr>
		</table>
	</div>
	<div align="center">
		<button type="submit" class="btn  btn-outline-warning">등록</button>
	</div>
</form>