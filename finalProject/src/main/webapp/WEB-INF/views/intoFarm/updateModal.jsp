<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<!-- include summernote-ko-KR -->
<script src="./resources/gotoFarm/js/summernote-ko-KR.js"></script>

<style>
 input{
 	border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;  /* 테두리 없애기 */
 }
</style>

<table class="table table-hover">
	<thead class="text-center">
		<tr class="content">
			<th class="text-left">아이디 : <input type="text" value="${upFarm.user_id}" readonly="readonly">
			<input type="hidden" name="into_no" value="${upFarm.into_no}">
			</th>
		</tr>
		<tr class="content">
			<th class="text-left">체험 이름 : <input type="text" value="${upFarm.into_title}"></th>
		</tr>
		<tr class="content">
			<th class="text-left">지역 : <input type="text" value="${upFarm.into_city}"></th>
		</tr>
		<tr class="content">
			<th class="text-left">농작물 종류 : <input type="text" value="${upFarm.into_product}"></th>
		</tr>
		<tr class="content">
			<th class="text-left">체험 일정 : <input type="date" value="${upFarm.into_date}"></th>
		</tr>
		<tr class="content">
			<th class="text-left">모집 인원 수 : <input type="text" value="${upFarm.into_entry}"></th>
		</tr>
		<tr class="content">
			<th class="text-left">체험 내용  <textarea id="summernote">${upFarm.into_info}</textarea></th>
		</tr>
		<tr class="content">
			<th class="text-left">문의 전화번호 :  <input type="text" value="${upFarm.into_phone}"></th>
		</tr>
		<!--파일 가져오기 > 다시 지우고 올리는것! -->
		<tr class="content">
			<th class="text-left">파일 :  <input multiple="multiple" type="file" accept="image/png, image/jpeg, image/jpg"></th>
		</tr>
	</thead>
	
</table>

<script>
		$('#summernote')
				.summernote(
						{
							height : 300,
							minHeight : null,
							maxHeight : null,
							/* focus: true,  */
							lang : 'ko-KR',
							toolbar : [
									// [groupName, [list of button]]
									[ 'fontname', [ 'fontname' ] ],
									[ 'fontsize', [ 'fontsize' ] ],
									[ 'style',[ 'bold', 'italic', 'underline','strikethrough', 'clear' ] ],
									[ 'color', [ 'forecolor', 'color' ] ],
									[ 'table', [ 'table' ] ],
									[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
									[ 'height', [ 'height' ] ],
									[ 'insert', [ 'picture', 'link', 'video' ] ],
									[ 'view', [ 'fullscreen', 'help' ] ] ],
							fontNames : [ 'Arial', 'Arial Black','Comic Sans MS', 'Courier New', '맑은 고딕','궁서', '굴림체', '굴림', '돋움체', '바탕체' ],
							fontSizes : [ '8', '9', '10', '11', '12', '14','16', '18', '20', '22', '24', '28', '30','36', '50', '72' ]
						});
	</script>  