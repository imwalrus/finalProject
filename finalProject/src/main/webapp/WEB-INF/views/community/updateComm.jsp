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

<script>
$(document).ready(function(){
	$('input[type="text"]').keypress(function() {
		  if (event.keyCode == 13) {
		    event.preventDefault();
		  };
	});
})
</script>

<style type="text/css">
#comm_title {  width:836px;
                 padding:5px;
                 height:32px !important; }
#title > h1 {
       font-size: 35px;
       color: #00cc99;
       } 
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
			<h1>커뮤니티 수정하기</h1>
		</div><br/>
		<form id="frm" name="frm" action="updateComm" method="post">
		<input type="hidden" name="comm_no" value="${communityVO.comm_no}">
		<input type="hidden" name="page" value="${commPagingVO.page}">
		<div>
			<table class="table table-hover" style ="table-layout: auto; width: 80%; table-layout: fixed;">
				<thead>
				<tr> 
					<td align="center" width="70">작성자</td>
					<td align="center" width="100">${communityVO.user_id}</td>
					<td align="center" width="80">지역</td>
					<td align="center" width="100">
					<select name="comm_adr" id="comm_adr">
					<option value="서울/경기/인천"
                    <c:if test ="${communityVO.comm_adr eq '서울/경기/인천'}">
	                selected </c:if>>서울/경기/인천</option>
	                <option value="대전/세종/충청"
	                <c:if test ="${communityVO.comm_adr eq '대전/세종/충청'}">
	                selected </c:if>>대전/세종/충청</option>
                    <option value="강원"
                    <c:if test ="${communityVO.comm_adr eq '강원'}">
	                selected </c:if>>강원</option>
                    <option value="광주/전라"
                    <c:if test ="${communityVO.comm_adr eq '광주/전라'}">
	                selected </c:if>>광주/전라</option>
	                <option value="대구/경북"
                    <c:if test ="${communityVO.comm_adr eq '대구/경북'}">
	                selected </c:if>>대구/경북</option>
	                <option value="부산/울산/경남"
                    <c:if test ="${communityVO.comm_adr eq '부산/울산/경남'}">
	                selected </c:if>>부산/울산/경남</option>
	                <option value="제주 "
                    <c:if test ="${communityVO.comm_adr eq '제주 '}">
	                selected </c:if>>제주 </option>
					</select></td>
					<td align="center" width="70">말머리</td>
					<td align="center" width="80">
					<select name="comm_subject" id="comm_subject">
					<option value="정보공유"
                    <c:if test ="${communityVO.comm_subject eq '정보공유'}">
	                selected </c:if>>정보공유</option>
	                <option value="질문"
	                <c:if test ="${communityVO.comm_subject eq '질문'}">
	                selected </c:if>>질문</option>
                    <option value="일상"
                    <c:if test ="${communityVO.comm_subject eq '일상'}">
	                selected </c:if>>일상</option>
                    <option value="고민"
                    <c:if test ="${communityVO.comm_subject eq '고민'}">
	                selected </c:if>>고민</option>
					</select></td>
				</tr>
				<tr>
				   <td align="center" width="70">작성일자</td>
				   <td align="center" colspan="2">${communityVO.comm_date}</td>
				   <td align="center" width="70">조회수</td>
				   <td align="center" colspan="2">${communityVO.comm_hit}</td>
				</tr>
				<tr>
					<td align="center" width="80">제 목</td>
					<td colspan="5" ><input class="form-control" type="text" id="comm_title" name="comm_title" value="${communityVO.comm_title}" size=97></td>   
				</tr>
				<tr>
					<td align="center" width="70">내용</td>
					<td colspan="5" align="left"><textarea class="form-control" rows="7" cols="115" id="summernote" name="comm_content">${communityVO.comm_content}</textarea></td>
				</tr>
				</thead>
			</table>
		</div><br /><br/>
	    <div style="margin-left:550px;">
		<button type="button" class="btn btn-outline-primary" onclick="location.href='getComm?page=${commPagingVO.page}'" style="float:left;">목록보기</button>
		</div>
		<c:if test="${user_auth == 'admin' }">
		<div style="margin-left:272px; float:left;">
	   <button class="btn btn-outline-primary" type="submit">저장</button>&nbsp;&nbsp;
       <button class="btn btn-outline-primary" type="reset">취소</button>
		</div>
		</c:if>
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
	</div>
    </section>
</body>
</html>