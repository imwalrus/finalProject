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
<title>체험등록</title>

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
	var yn = confirm("등록하시겠습니까?")
	if(yn) {
		frm.action = "cartDelete.do";
		frm.submit();
	}
}	
</script>
</head>
<body>
<h2 style="text-align: center;">체험 등록</h2><br><br><br>

<div style="width: 60%; margin: auto;">
	<form id="frm" method="post" action="insertFarm">
		<select name="ecity" id="city-select">
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

		<input type="text" name="ename" style="width: 40%; margin-top: 1%;" placeholder="체험이름"/><br>
		<input type="text" name="etype" style="width: 40%; margin-top: 1%;" placeholder="농작물 종류"/><br>
		<input type="text" name="ephone" style="width: 40%; margin-top: 1%;" placeholder="연락처"/><br>
		<!--체험일정 calendar 넣기  -->
		<input type="text" name="eqty" style="width: 40%; margin-top: 1%;" placeholder="참여 가능 인원 수 "/><br>
		<!--신청기간 calendar 넣기  -->
		<br><br> 
		<textarea id="summernote" name="content" placeholder="체험 프로그램 소개(소개,일정,준비물안내,오시는길,담당자이름,담당자 전화번호)"></textarea>
		<button type="button" onclick="insertFarm()">등록</button>
		<button type="button" onclick="insertFarm(${vo.cartNumber})">취소</button>
	</form>
</div>

</body>
</html>