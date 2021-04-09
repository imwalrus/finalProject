<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>체험등록</title>

<!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<!-- include summernote-ko-KR -->
<script src="./resources/gotoFarm/js/summernote-ko-KR.js"></script>
<script>
	
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

/*이미지 실제 경로*/
/*  $("#uploadFile").change(function(){
	 if(this.files && this.files[0]){
		 var reader = new FileReader;
		 reader.onload = function(data) {
			 $(".select_img img").attr("src",data.target)
		 }
		 reader.readAsDataURL(this.files[0]);
	 }
 }); */
</script>

</head>
<body>
<div style="overflow: scroll;">
<h2 style="text-align: center;">체험 등록</h2><br><br><br>

	<div style="width: 60%; margin: auto;">
		<form id="frm" method="post" action="insertFarm"
			enctype="multipart/form-data">
			<input type="hidden" name="user_id" id="user_id" value="hw"> 
			<select name="into_city" id="city-select" style="margin-top: 1%;">
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
			<input type="text" name="into_title" style="width: 40%; margin-top: 1%;" placeholder="체험이름" /><br> 
			<input type="text" name="into_product" style="width: 40%; margin-top: 1%;" placeholder="농작물 종류" /><br> 
			<input type="text" name="into_phone" style="width: 40%; margin-top: 1%;" placeholder="연락처" /><br>
			<!--체험일정 calendar 넣기  -->
			 <input type="date" name="into_date" style="width: 40%; margin-top: 1%;" placeholder="체험일정" /><br> 
			<input type="text" name="into_entry" style="width: 40%; margin-top: 1%;" placeholder="참여 가능 인원 수 " /><br> 
			<input multiple="multiple" type="file" name="uploadFile" id="uploadFile" accept="image/png, image/jpeg, image/jpg">
			<input type="hidden" name="uploadFile"><!-- <div class="select_img"><img src=""></div> -->
			<br> 
			<br><br>
			<textarea id="summernote" name="into_info"></textarea>

			<button type="button" id="save" onclick="insertFarm()">등록</button>
			<button type="reset" onclick="getSearchFarm">취소</button>
			
		</form>

	</div>
	
	<script>
	$('#summernote')
	.summernote(
			{
				placeholder : '체험 프로그램 소개(소개,일정,준비물안내,오시는길,담당자이름,담당자 전화번호)',
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
</div>	  
</body>
</html>