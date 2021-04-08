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
	$("#faq_title").on('keyup', function() {
		$("#faq_content").val($(this).val())
	});
});
</script>

<script>
function categoryChange() {
	faq_sch.submit();
    }
</script>

<style type="text/css">
#faq_title    {     width:170px; 
                    height:40px !important; }
#faq_category {     width:120px; 
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
     <form action="getFaq" name="faq_sch">
      <input type="hidden" name="page" value="1">
      <input type="hidden" id="faq_content" name="faq_content" value="${faqPagingVO.faq_content}">
		<div align="center" style="margin-left:400px; margin-right:400px;">
		<div id="title">
			<h1>FAQ</h1>
		</div><br/>
		<div class="form-group" style="margin-left:980px">
		<select class="form-control" id="faq_category" name="faq_category" onchange="categoryChange()">
		<option value="">분류</option>
        <option value="농업지식"
        <c:if test ="${faqPagingVO.faq_category == '농업지식'}">
	             selected </c:if>>농업지식</option>
	    <option value="교육/기타"
	    <c:if test ="${faqPagingVO.faq_category == '교육/기타'}">
	             selected </c:if>>교육/기타</option>
        <option value="정책/금융"
        <c:if test ="${faqPagingVO.faq_category == '정책/금융'}">
	             selected </c:if>>정책/금융</option>
        <option value="주택"
        <c:if test ="${faqPagingVO.faq_category == '주택'}">
	             selected </c:if>>주택</option>
	    <option value="농지"
        <c:if test ="${faqPagingVO.faq_category == '농지'}">
	             selected </c:if>>농지</option>          
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
				</tr>
		<c:forEach items="${list}" var="faq">
		<tr onclick="location.href='getSearchFaq?faq_no=${faq.faq_no}&page=${paging.page}'">
         <td align="center">${faq.faq_no}</td>
         <td>&nbsp; ${faq.faq_title}</td>
         <td align="center">${faq.faq_category}</td>
         <td align="center">${faq.faq_date}</td>
        </tr>
        </c:forEach>
        </thead>
        </table><br/>
        </div>
        </div>
   
    <div class="row justify-content-around" style="margin-left:400px; margin-right:400px;">
    <div class="col-auto mr-auto">
    <c:if test="${user_auth == 'admin' }">  
    <button type="button" class="btn btn-primary disabled" onclick="location.href='insertFaq'">글쓰기</button>
    </c:if>
    </div>
    
    <div class="col-auto">
    <input class="form-control" type="text" placeholder="Search..." id="faq_title" name="faq_title"
    value="${faqPagingVO.faq_title}" onclick="this.select()">
    </div>
    </div>
    
    <my:paging paging="${paging}" jsFunc="goPage" />
    <script>
    function goPage(p) {
    //location.href="getNotices?page=" +p;
    faq_sch.page.value= p;
    faq_sch.submit();
    }
    </script>
    </form>
    </section>
</body>
</html>