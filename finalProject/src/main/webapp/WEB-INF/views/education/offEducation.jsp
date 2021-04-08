<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>청년농장</title>
<script src="resources/main/js/jquery.min.js"></script>
<script>
//모달 팝업 띄울 시 발생하는 이벤트 (이벤트명 : show.bs.modal)
   function fnModuleInfo(str) {
	   $('#offEduModal .modal-body').load("getSchOffEdu?edu_no="+str); //한칸 띄워야함
	   $('#offEduModal').modal();
	}
	function deleteAlert() {
		var yn = confirm("정말 삭제할까요?");
		if (yn) {
			edu_sch.action = "deleteEdu?edu_no=${educationVO.edu_no}&page=${eduPagingVO.page}"
			edu_sch.submit();
		}
	}
</script>
<script>
$(document).ready(function() {
	$('#edu_title').val() == $('#edu_content').val();

//검색창 한개일 때는 자동으로 엔터 이벤트 걸리지만 두개일 땐 두개 다 엔터 이벤트 걸어줘야 한다.
$('#edu_title').keypress(function(event){
	 var keycode = (event.keyCode ? event.keyCode : event.which);
     if(keycode == '13'){
    	 edu_sch.submit();
  }
event.stopPropagation();
      });
$('#edu_adr').keypress(function(event){
	 var keycode = (event.keyCode ? event.keyCode : event.which);
    if(keycode == '13'){
   	 edu_sch.submit();
 }
event.stopPropagation();
      });
});
</script>
<style type="text/css">
#edu_title {  width:170px; 
              height:35px !important; }
#edu_adr   {  width:170px; 
              height:35px !important; }              
#title > h1 {
       font-size: 35px;
       color: #00cc99;
       } 
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

    <section class="ftco-section testimony-section">
    <form action="getOffEdu" name="edu_sch">
    <input type="hidden" name="page" value="1">
    <input type="hidden" id="edu_content" name="edu_content" >
    <div align="center" style="margin-left:400px; margin-right:400px;">
    <div id="title">
			<h1>오프라인 교육</h1>
		</div><br/>
    <div class="container box_1170" style="padding:1px;">
        <div class="form-inline form-group" style="margin-left:860px;">
        <label for="edu_title">주제</label>
        <div class="col-sm-10">
        <input class="form-control" type="text" id="edu_title" name="edu_title" value="${eduPagingVO.edu_title}" onclick="this.select()">
        </div>
        </div>
        </div>
        
        <div class="container box_1170" style="padding:1px;">
        <div class="form-inline form-group" style="margin-left:859px;">
        <label for="edu_adr">지역</label>
        <div class="col-sm-10">
        <input class="form-control" type="text" id="edu_adr" name="edu_adr" value="${eduPagingVO.edu_adr}" onclick="this.select()">
        </div>
        </div>
        </div>
     
     <hr style="margin:8px;"><br/>
    <table class="table table-hover" >
         <thead>
                <tr>
					<td align="center" width="150">번호</td>
					<td align="center" width="150">지역</td>
					<td align="center" width="500">주제</td>
					<td align="center" width="400">교육기간</td>
					<td align="center" width="250">교육시간</td>
					<td align="center" width="150">신청현황</td>
					<td align="center" width="150">상세보기</td>
				</tr>
		<c:forEach items="${list}" var="edu">
		<tr>
         <td align="center">${edu.edu_no}</td>
         <td>&nbsp; ${edu.edu_adr}</td>
         <td align="center">${edu.edu_title}</td>
         <td align="center">${edu.edu_date}</td>
         <td align="center">${edu.edu_time}</td>
         <td align="center">${edu.edu_check}</td>
         <td>
         <button 
         type="button" 
         class="btn btn-primary disabled" 
         style="padding: 1px"
         onclick="fnModuleInfo('${edu.edu_no}')">상세보기</button>
         </td>
        </tr>
        </c:forEach>
        </thead>
    </table><br>
    <div style="margin-left:992px">
        <button type="button" class="btn btn-primary disabled" onclick="location.href='insertEdu'">새교육 등록</button>
    </div>
<!-- 모달팝업 -->
<div class="modal" id="offEduModal" tabindex="-1" role="dialog" aria-labelledby="offEduModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="offEduModalLabel">과정상세정보</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" align="center">
     
      </div>
        <div class="modal-footer"> 
        <button type="button" class="btn btn-primary disabled" id="update" onclick="updateFnc()">수정</button>
        <button type="button" class="btn btn-primary disabled" id="delete" onclick="deleteAlert()">삭제</button>
        <button type="button" class="btn btn-primary disabled" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
        
        <my:paging paging="${paging}" jsFunc="goPage" />
        <script>
        function goPage(p) {
    	//location.href="getOffEdu?page=" +p;
    	edu_sch.page.value= p;
    	edu_sch.submit();
        }
        </script>
        </div>
        
    </form>
    </section>
</body>
</html>