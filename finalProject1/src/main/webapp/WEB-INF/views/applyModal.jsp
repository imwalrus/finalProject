<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table class="table table-hover">
	<thead class="text-center">
		<tr class="content">
			<th class="text-center">체험 이름</th>
			<th class="text-center">${list.into_title}</th>
		</tr>
		<tr class="content">
			<th class="text-center">모집 인원 수</th>
			<th class="text-center">${list.into_entry}</th>
		</tr>
	</thead>
	<tbody class="text-center">
		<tr class="content" style="font-size: 12px;">
			<td class="text-center">체험 내용</td>
			<td class="text-center">${list.into_info }</td>
		</tr>
	</tbody>
</table>
