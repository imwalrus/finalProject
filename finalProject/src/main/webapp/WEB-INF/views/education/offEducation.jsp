<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>청년농장</title>
<script>
//모달 팝업 띄울 시 발생하는 이벤트 (이벤트명 : show.bs.modal)
$('#offEduModal').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget);
})
</script>
<style>
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
    <div align="center" style="margin-left:400px; margin-right:400px;">
    <div id="title">
			<h1>오프라인 교육</h1>
		</div><br/>
    <table class="table table-hover">
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
         data-toggle="modal" 
         data-target="#offEduModal">상세보기</button>
         </td>
        </tr>
        </c:forEach>
        </thead>
    </table><br>
<!-- 모달팝업 -->
<div class="modal" id="offEduModal" tabindex="-1" role="dialog" aria-labelledby="offEduModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
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
        <button type="button" class="btn btn-primary disabled" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
        <div align="center">
        <my:paging paging="${paging}" jsFunc="goPage" />
        <script>
        function goPage(p) {
    	location.href="getOffEdu?page=" +p;
    	//edu_sch.page.value= p;
    	//edu_sch.submit();
        }
        </script>
        </div></div>
    </form>
    </section>
</body>
</html>