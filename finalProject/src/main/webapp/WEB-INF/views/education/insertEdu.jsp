<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>청년농장</title>
<script>
$(function() {
	 $("#gdsImg").change(function(){
		   if(this.files && this.files[0]) {
		    var reader = new FileReader;
		    reader.onload = function(data) {
		     $(".select_img img").attr("src", data.target.result).width(900).height(500);        
		    }
		    reader.readAsDataURL(this.files[0]);
		  }
     });
})
</script>

<style type="text/css">
#form-control1 { height:30px !important;
                 width:330px !important; 
                 border:none !important;  }
#date { height:30px!important;
        width:157px !important;
        display:inblock !important; }
#title > h1 {
       font-size: 35px;
       color: #00cc99;
            } 
.select_img img { margin: 20px 0 !important;}
</style>

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
   
    <section class="ftco-section contact-section">
       <div align="center" style="margin-left:400px; margin-right:400px;">
		<div id="title" style="margin-left:33px;">
			<h1>오프라인 교육 등록하기</h1>
		</div><br/>
		<div>
	<form id="frm" name="frm" action="insertEdu" method="post" enctype="multipart/form-data">
    <table class="table table-bordered" style="width:800px;">
    <thead>
    <tr>
    <th class="table-active" width="15%" align="center">주제</th>
    <td width="35%"align="left">
    <input class="form-control" id="form-control1" type="text" id="edu_title" name="edu_title">
    </td>
    <th class="table-active" width="15%" align="center">강의일자</th>
    <td width="35%"align="left">
    <input class="after" id="date" type="date" name="edu_startdate">
    -
    <input class="after" id="date" type="date" name="edu_enddate">
    </td>
    </tr>
    <tr>
    <th class="table-active" width="15%" align="center">교육시간</th>
    <td width="35%"align="left">
    <input class="form-control" id="form-control1" type="text" id="edu_time" name="edu_time" placeholder="　　　　　　ex)10:00 - 15:00">
    </td>
    <th class="table-active" width="15%" align="center">교육기관</th>
    <td width="35%"align="left">
    <input class="form-control" id="form-control1" type="text" id="edu_organ" name="edu_organ">
    </td>
    </tr>
    <tr>
    <td class="table-active" width="100" align="center">지역</td>
    <td width="35%"align="center">
    <select name="edu_adr" id="edu_adr">
	<option value="서울/경기/인천">서울/경기/인천</option>
	<option value="대전/세종/충청">대전/세종/충청</option>
    <option value="강원">강원</option>
    <option value="광주/전라">광주/전라</option>
	<option value="대구/경북">대구/경북</option>
	<option value="부산/울산/경남">부산/울산/경남</option>
	 <option value="제주 ">제주 </option>
	</select>				
    </td>
    <td class="table-active" width="100" align="center">신청여부</td>
    <td width="35%"align="center">
    <select name="edu_check" id="edu_check">
	<option value="신청가능">신청가능</option>
	<option value="신청마감">신청마감</option>
	</select>
    </td>
    </tr>
    <tr>
    <td class="table-active" width="100" align="center">교육 장소</td>
    <td colspan="3" align="left">
    <input class="form-control" id="form-control1" type="text" id="edu_place" name="edu_place">
    </td>
    </tr>
    <tr>
    <td class="table-active" width="100" align="center">담당자 이름</td>
    <td width="35%"align="left">
    <input class="form-control" id="form-control1" type="text" id="edu_person" name="edu_person">
    </td>
    <td class="table-active" width="100" align="center">담당자 연락처</td>
    <td width="35%"align="left">
    <input class="form-control" id="form-control1" type="text" id="edu_phone" name="edu_phone">
    </td>
    </tr>
    <tr>
    <td class="table-active" align="center" colspan="4">교육이미지</td>
    </tr>
    <tr>
    <td align="center" style="height:400px;" colspan="4" align="center">
    <input type="file" class="form-control-sm" id="gdsImg" name="uploadFile">
	<input type="hidden" name="edu_filename">
	<div class="select_img"><img src=""></div>
    </td>
    </tr>
    <tr>
    <td class="table-active" align="center" colspan="4">교육소개</td>
    </tr>
    <tr>
    <td align="center" style="height:400px;" colspan="4">
    <textarea class="form-control" rows="15" cols="133" id="edu_content" name="edu_content"></textarea>
    </td>
    </tr>
    </thead>
    </table><br/>
				
			<div style="margin-left:20px;">
			<button class="btn btn-outline-primary" type="submit">저장하기</button> &nbsp;&nbsp;
			<button class="btn btn-outline-primary" type="reset">취소</button> &nbsp;&nbsp;
		    </div>
	</form>
	</div><br/>
	</div>
    </section>
</body>
</html>