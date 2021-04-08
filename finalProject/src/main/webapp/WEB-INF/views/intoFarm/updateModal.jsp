<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
 input{
 	border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;  /* 테두리 없애기 */
 }
</style>

<form id="updatefrm" method="post" action="updateFarm" >
<table class="table table-hover" id="updatetbl">
	<thead class="text-center">
		<tr class="content">
			<th class="text-left">아이디 : <input type="text" value="${upFarm.user_id}" readonly="readonly">
			<input type="hidden" name="into_no" value="${upFarm.into_no}">
			</th>
		</tr>
		<tr class="content">
			<th class="text-left">체험 이름 : <input type="text" name="into_title" value="${upFarm.into_title}"></th>
		</tr>
		<tr class="content">
			<th class="text-left">
				지역 :
				<select name="into_city" id="city-select" style="margin-top: 1%;">
					<option value="">${upFarm.into_city}</option>
					<option value="광주">광주</option>
					<option value="대구">대구</option>
					<option value="대전">대전</option>
					<option value="독도">독도</option>
					<option value="부산">부산</option>
					<option value="서울">서울</option>
					<option value="울릉도">울릉도</option>
					<option value="울산">울산</option>
					<option value="인천">인천</option>
					<option value="제주도">제주도</option>
				</select><br> 
			</th>
		</tr>
		<tr class="content">
			<th class="text-left">농작물 종류 : <input type="text" name="into_product" value="${upFarm.into_product}"></th>
		</tr>
		<tr class="content">
			<th class="text-left">체험 일정 : <input type="date" name="into_date" value = '<fmt:formatDate pattern = "yyyy/MM/dd" value="${upFarm.into_date}"/>'> </th>
		</tr>
		<tr class="content">
			<th class="text-left">모집 인원 수 : <input type="text" name="into_entry" value="${upFarm.into_entry}"></th>
		</tr>
		<tr class="content">
			<th class="text-left">체험 내용  <textarea id="summernote" name="into_info" >${upFarm.into_info}</textarea></th>
		</tr>
		<tr class="content">
			<th class="text-left">문의 전화번호 :  <input type="text" name="into_phone" value="${upFarm.into_phone}"></th>
		</tr>
		<!--파일 가져오기 > 다시 지우고 올리는것! -->
		<tr class="content">
			<th class="text-left">파일 :  <input multiple="multiple" name="into_filename" type="file" accept="image/png, image/jpeg, image/jpg"></th>
		</tr>
	</thead>
	
</table>
<div class="modal-footer">
					<button class="btn btn-primary" type="button" data-dismiss="modal">취소</button>
					<!--농업인& 관리자 수정-->
					<button class="btn btn-primary" type="button" data-dismiss="modal" onclick="goupdate('${upFarm.into_no}')">저장</button>
				</div>
</form>
