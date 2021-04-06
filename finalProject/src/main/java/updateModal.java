<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table class="table table-hover">
	<thead class="text-center">
		<tr class="content">
			<th class="text-left">체험 이름 : ${upFarm.into_title} </th>
		</tr>
		<tr class="content">
			<th class="text-left">모집 인원 수 : ${upFarm.into_entry}</th>
		</tr>
		<tr class="content">
			<th class="text-left">체험 내용  ${upFarm.into_info}</th>
		</tr>
		<tr class="content">
			<th class="text-left">문의 전화번호 :  ${upFarm.into_phone}</th>
		</tr>
	</thead>
	
</table>