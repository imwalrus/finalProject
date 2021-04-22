<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>청년농장</title>

<!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<!-- include summernote-ko-KR -->
<script src="./resources/gotoFarm/js/summernote-ko-KR.js"></script>

<style type="text/css">
#comm_title {  padding:5px;
                 height:32px !important; }
#title > h1 {
       font-size: 35px;
       color: #00cc99;
            } 
[name='user_id'] {border:none !important;}
</style>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body class="goto-here">
    <div class="hero-wrap hero-bread" style="background-image: url('resources/main/images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>About us</span></p>
            <h1 class="mb-0 bread">About us</h1>
          </div>
        </div>
      </div>
    </div>
     <section class="ftco-section testimony-section">
    <div align="center" style="margin-left:400px; margin-right:400px;">
		<div id="title" style="margin-left:100px;">
			<h1 style="font-weight: bolder;">커뮤니티 글 작성하기</h1>
		</div><br/>
		<div>
			<form id="frm" name="frm" action="insertComm" method="post">
				<table class="table table-hover" style ="table-layout: auto; width: 80%; table-layout: fixed;">
                <thead>
				<tr>
				    <td align="center" width="70">작성자</td>
					<td align="center" width="100">
					<input name="user_id" value="${user_id}" readonly></td>
					<td align="center" width="80">지역</td>
					<td align="center" width="100">
					<select name="comm_adr" id="comm_adr">
					<option value="서울/경기/인천">서울/경기/인천</option>
	                <option value="대전/세종/충청">대전/세종/충청</option>
                    <option value="강원">강원</option>
                    <option value="광주/전라">광주/전라</option>
	                <option value="대구/경북">대구/경북</option>
	                <option value="부산/울산/경남">부산/울산/경남</option>
	                <option value="제주 ">제주 </option>
					</select></td>
					<td align="center" width="70">말머리</td>
					<td align="center" width="80">
					<select name="comm_subject" id="comm_subject">
					<option value="정보공유">정보공유</option>
	                <option value="질문">질문</option>
                    <option value="일상">일상</option>
                    <option value="고민">고민</option>
					</select></td>
				</tr>
				<tr>
					<td align="center" width="15%">제목</td>
					<td colspan="5" align="left" width="55%"><input class="form-control" type="text" id="comm_title" name="comm_title"></td>
				</tr>
				<tr>
					<td align="center" width="70">내용</td>
					<td colspan="5" align="left"><textarea class="form-control" rows="7" cols="115" id="summernote" name="comm_content"></textarea></td>
				</tr>
				<thead>
			</table><br/>
				
			<div style="margin-left:100px;">
			<button class="btn btn-outline-primary" type="submit">저장하기</button> &nbsp;&nbsp;
			<button class="btn btn-outline-primary" type="reset">취소</button> &nbsp;&nbsp;
		    </div>
		    
		    <script>
	        $('#summernote')
	        .summernote({
				placeholder : '상호 존중하지 않는 게시글과 댓글은 삭제 될 수 있습니다.',
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
				fontSizes : [ '8', '9', '10', '11', '12', '14','16', '18', '20', '22', '24', '28', '30','36', '50', '72' ],
				callbacks : {
					onImageUpload : function(files, editor, welEditable) {
						for (var i = files.length - 1; i >= 0; i--) {
							sendFile(files[i], this);
						}
					}
				}

			});

	function sendFile(file, el) {
		var form_data = new FormData();
		form_data.append('uploadFile', file);
		$.ajax({
			data : form_data,
			type : "POST",
			url : "uploadImg",
		cache : false,
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(img_name) {
			$(el).summernote('editor.insertImage', img_name);
		}
	});
}
</script>	
	</form>
	</div><br/>	
	</div>
    </section>
</body>
</html>