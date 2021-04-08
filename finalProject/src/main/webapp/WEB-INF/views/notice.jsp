<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>청년농장</title>
<script>
$(document).ready(function() {
	$("#notice_title").on('keyup', function() {
		$("#notice_content").val($(this).val())
	});
});
</script>

<script>
function categoryChange() {
	notice_sch.submit();
    }
</script>

<style type="text/css">
#notice_title {  width:170px; 
                 height:40px !important; }
#notice_category {  width:120px; 
                    text-align: center;
                    margin:0px;
                    padding: 5px;
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
     <form action="getNotices" name="notice_sch">
      <input type="hidden" name="page" value="1">
      <input type="hidden" id="notice_content" name="notice_content" value="${noticePagingVO.notice_content}">
		<div class="area" align="center" style="margin-left:400px; margin-right:400px;">
		<div id="title">
			<h1>공지사항</h1>
		</div><br/>
		<div class="form-group" style="margin-left:980px">
		<select class="form-control" id="notice_category" name="notice_category" onchange="categoryChange()">
		<option value="">분류</option>
        <option value="관련기사"
        <c:if test ="${noticePagingVO.notice_category == '관련기사'}">
	             selected </c:if>>관련기사</option>
	    <option value="관련공문"
	    <c:if test ="${noticePagingVO.notice_category == '관련공문'}">
	             selected </c:if>>관련공문</option>
        <option value="농산물가격"
        <c:if test ="${noticePagingVO.notice_category == '농산물가격'}">
	             selected </c:if>>농산물가격</option>
        <option value="축제,박람회"
        <c:if test ="${noticePagingVO.notice_category == '축제,박람회'}">
	             selected </c:if>>축제,박람회</option>
        </select>
		</div>
		<div align="center">
		<table class="table table-hover">
		 <thead>
				<tr>
					<td align="center" width="100">글번호</td>
					<td align="center" width="300">제 목</td>
					<td align="center" width="150">분류</td>
					<td align="center" width="200">작성일자</td>
					<td align="center" width="150">조회수</td>
				</tr>
		<c:forEach items="${list}" var="ntc">
		<tr onclick="location.href='getSearchNotices?notice_no=${ntc.notice_no}&page=${paging.page}'">
         <td align="center">${ntc.notice_no}</td>
         <td>&nbsp; ${ntc.notice_title}</td>
         <td align="center">${ntc.notice_category}</td>
         <td align="center">${ntc.notice_date}</td>
         <td align="center">${ntc.notice_hit}</td>
        </tr>
        </c:forEach>
        </thead>
        </table><br/>
        </div>
        </div>
    
    <div class="row justify-content-around" style="margin-left:400px; margin-right:400px;">
    <div class="col-auto mr-auto">
    <c:if test="${user_auth == 'admin' }">  
    <button type="button" class="btn btn-primary disabled" onclick="location.href='insertNotices'">글쓰기</button>
    </c:if>
    </div>
    
    <div class="col-auto">
    <input class="form-control" type="text" placeholder="Search..." id="notice_title" name="notice_title"
    value="${noticePagingVO.notice_title}" onclick="this.select()">
    </div>
    </div>
    
    <my:paging paging="${paging}" jsFunc="goPage" />
    <script>
    function goPage(p) {
    //location.href="getNotices?page=" +p;
    notice_sch.page.value= p;
    notice_sch.submit();
    }
    </script>
    </form>
    </section>
</body>
</html>
