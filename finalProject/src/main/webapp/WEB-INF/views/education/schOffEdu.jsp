<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>    
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
.select_img img { margin: 20px 0 !important;}
#form-control1 { 
                 height:30px !important;
                 width:330px !important; 
                }

#edu_check {     height:29px !important;
                 width:100px !important;
                 padding:2px !important;
                 align:center !important;
                  }
#gdsImg { border:none !important; }
</style>
    <form id="edu_update" name="edu_update"> 
    <input type="hidden" name="edu_no" value="${edu.edu_no}">
    <div align="center">
    <table class="table table-bordered" style="width:800px;">
    <thead>
    <tr>
    <th class="table-active" width="15%" align="center">주제</th>
    <td width="35%"align="center"><span class="before">${edu.edu_title}</span>
    <input class="form-control after" id="form-control1" type="text" id="edu_title" name="edu_title" value="${edu.edu_title}"></td>
    <th class="table-active" width="15%" align="center">강의일자</th>
    <td width="35%"align="center"><span class="before">${edu.edu_date}</span>
    <input class="form-control after" id="form-control1" type="text" id="edu_date" name="edu_date" value="${edu.edu_date}"></td>
    </tr>
    <tr>
    <th class="table-active" width="15%" align="center">교육시간</th>
    <td width="35%" align="center"><span class="before">${edu.edu_time}</span>
    <input class="form-control after" id="form-control1" type="text" id="edu_time" name="edu_time" value="${edu.edu_time}">
    </td>
    <th class="table-active" width="15%" align="center">교육기관</th>
    <td width="35%" align="center"><span class="before">${edu.edu_organ}</span>
    <input class="form-control after" id="form-control1" type="text" id="edu_organ" name="edu_organ" value="${edu.edu_organ}"></td>
    </tr>
    <tr>
    <td class="table-active" width="100" align="center">장소</td>
    <td align="center"><span class="before">${edu.edu_adr}</span>
    <input class="form-control after" id="form-control1" type="text" id="edu_adr" name="edu_adr" value="${edu.edu_adr}"></td>
    <td class="table-active" width="100" align="center">신청여부</td>
    <td align="center"><span class="before">${edu.edu_check}</span>
    <select class="form-control after" name="edu_check" id="edu_check">
	<option value="신청가능" 
	<c:if test ="${edu.edu_check == '신청가능'}">
	             selected </c:if>>신청가능</option>
	<option value="신청마감"
	<c:if test ="${edu.edu_check == '신청마감'}">
	             selected </c:if>>신청마감</option>
	</select></td>
    </tr>
    <tr>
    <td class="table-active" width="100" align="center">담당자 이름</td>
    <td align="center"><span class="before">${edu.edu_person}</span>
    <input class="form-control after" id="form-control1" type="text" id="edu_person" name="edu_person" value="${edu.edu_person}"></td>
    <td class="table-active" width="100" align="center">담당자 연락처</td>
    <td align="center"><span class="before">${edu.edu_phone}</span>
    <input class="form-control after" id="form-control1" type="text" id="edu_phone" name="edu_phone" value="${edu.edu_phone}"></td>
    </tr>
    <tr>
    <td class="table-active" align="center" colspan="4">교육이미지</td>
    </tr>
    <tr>
    <td align="center" style="height:400px;" colspan="4">
    <input type="file" class="form-control after" id="gdsImg" name="uploadFile" style="width:400px; padding-left:120px; padding-top:10px" >
	<input type="hidden" name="edu_filename">
	<div class="select_img"><img id="beforeImg" width="900px" src="resources/main/images/${edu.edu_filename}"></div>
    </td>
    </tr>
    <tr>
    <td class="table-active" align="center" colspan="4">교육소개</td>
    </tr>
    <tr>
    <td align="center" style="height:400px;" colspan="4" align="center"><span class="before">${edu.edu_content}</span>
    <textarea class="form-control after" rows="15" cols="133" id="edu_content" name="edu_content">${edu.edu_content}</textarea></td>
    </tr>
    </thead>
    </table>
    </div>
    </form>