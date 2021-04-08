<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="applyfrm" method="post" action="getSearchFarm" >
<table class="table table-hover">
	<thead class="text-center">
		
		<tr class="content">
			<th class="text-left">체험 이름 : ${getlist.into_title}
			<input type="hidden" value="${getlist.into_no}" name="into_no">
			</th>
		</tr>
		<tr class="content">
			<th class="text-left">모집 인원 수 : ${getlist.into_entry}</th>
		</tr>
		<tr class="content">
			<th class="text-left">체험 내용  ${getlist.into_info}</th>
		</tr>
		<tr class="content">
			<th class="text-left">문의 전화번호 :  ${getlist.into_phone}</th>
		</tr>
	</thead>
	
</table>
<div class="modal-footer">
	<button class="btn btn-primary" type="button" data-dismiss="modal">취소</button>
	<button class="btn btn-primary" type="button" data-bs-target="#myUpdate" data-bs-toggle="modal" data-bs-dismiss="modal"  onclick="fnUpdate('${getlist.into_no}')">수정</button>
	<button class="btn btn-primary" type="button" onclick="fnDelete('${getlist.into_no}')">삭제</button>
</div>	
</form>