<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>

<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<title>체험등록/</title>

<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});
	
function insertFarm() {
	var into_city = frm.into_city.value;
	var into_title = frm.into_title.value;
	var into_product = frm.into_product.value;
	var into_phone = frm.into_phone.value;
	var into_date = frm.into_date.value;
	var into_entry = frm.into_entry.value;
	var into_info = frm.into_info.value;
	
	if (into_city.trim() == ''){
		alert("지역을 선택해주세요");
		return false;
	}
	if (into_title.trim() == ''){
		alert("체험이름을 입력해주세요");
		return false;
	}
	if (into_product.trim() == ''){
		alert("농작물 종류를 선택해주세요");
		return false;
	}
	if (into_phone.trim() == ''){
		alert("연락처를 입력해주세요");
		return false;
	}
	if (into_date.trim() == ''){
		alert("일정을 선택해주세요");
		return false;
	}
	if (into_entry.trim() == ''){
		alert("참여가능 인원 수를 입력해주세요");
		return false;
	}
	if (into_info.trim() == ''){
		alert("내용을 입력해주세요");
		return false;
	}
	var yn = confirm("등록하시겠습니까?")
	
	if(yn) {
		frm.action = "insertFarm";
		frm.submit();
	}
}	
</script>
</head>
<body>
<h2 style="text-align: center;">체험 등록</h2><br><br><br>

<div style="width: 60%; margin: auto;">
	<form id="frm" method="post" action="insertFarm">
		<input type="text" name="user_id" style="width: 40%; margin-top: 1%; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" value="${intoTheFarm.user_id}"/><br>
		<select name="into_city" id="city-select" style="margin-top:1%;">
		    <option value="">--지역을 선택 하여 주십시오--</option>
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

		<input type="text" name="into_title" style="width: 40%; margin-top: 1%;" placeholder="체험이름"/><br>
		<input type="text" name="into_product" style="width: 40%; margin-top: 1%;" placeholder="농작물 종류"/><br>
		<input type="text" name="into_phone" style="width: 40%; margin-top: 1%;" placeholder="연락처"/><br>
		<!--체험일정 calendar 넣기  -->
		<input type="date" name="into_date" style="width: 40%; margin-top: 1%;" placeholder="체험일정"/><br>
		<input type="text" name="into_entry" style="width: 40%; margin-top: 1%;" placeholder="참여 가능 인원 수 "/><br>
		
		<br><br> 
		<textarea id="summernote" name="into_info" placeholder="체험 프로그램 소개(소개,일정,준비물안내,오시는길,담당자이름,담당자 전화번호)"></textarea>
		<button type="button" onclick="insertFarm()">등록</button>
		<button type="reset" onclick="getSearchFarm">취소</button>
	</form>
</div>

</body>
</html>