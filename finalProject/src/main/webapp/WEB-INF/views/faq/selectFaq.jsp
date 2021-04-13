<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>청년농장</title>
<script type="text/javascript">
	function deleteAlert() {
		var yn = confirm("정말 삭제할까요?");
		if (yn) {
			frm.action = "deleteFaq?faq_no=${faq.faq_no}&page=${faqPagingVO.page}"
			frm.submit();
		}
	}
</script>
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
#faq_title {  width:836px;
                 padding:5px;
                 height:32px !important; }
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
    
  <section class="ftco-section contact-section">
     <div align="center" style="margin-left:400px; margin-right:400px;">
		<div id="title" style="margin-left:100px;">
			<h1>FAQ 상세보기</h1>
		</div><br/>
		<form id="frm" name="frm" action="updateFaq" method="post">
		<input type="hidden" name="faq_no" value="${faq.faq_no}">
		<input type="hidden" name="page" value="${faqPagingVO.page}">
		<div>
			<table class="table table-hover" style ="table-layout: auto; width: 80%; table-layout: fixed;">
				<thead>
				<tr>
					<td align="center" width="70">글번호</td>
					<td align="center" width="50">${faq.faq_no}</td>
					<td align="center" width="70">분류</td>
					<td align="center" width="80">
					<select name="faq_category" id="faq_category">
					<option value="농업지식"
                    <c:if test ="${faq.faq_category == '농업지식'}">
	                         selected </c:if>>농업지식</option>
	                <option value="교육/기타"
	                <c:if test ="${faq.faq_category == '교육/기타'}">
	                         selected </c:if>>교육/기타</option>
                    <option value="정책/금융"
                    <c:if test ="${faq.faq_category == '정책/금융'}">
	                         selected </c:if>>정책/금융</option>
                    <option value="주택"
                    <c:if test ="${faq.faq_category == '주택'}">
	                         selected </c:if>>주택</option>
	                <option value="농지"
                    <c:if test ="${faq.faq_category == '농지'}">
	                         selected </c:if>>농지</option>      
					</select></td>
					<td align="center" width="80">작성일자</td>
					<td align="center" width="150">${faq.faq_date}</td>
				</tr>
				<tr>
					<td align="center" width="80">제 목</td>
					<td colspan="5" ><input class="form-control" type="text" id="faq_title" name="faq_title" value="${faq.faq_title}" size=97></td>
				</tr>
				<tr>
					<td align="center" width="70">내용</td>
					<td colspan="5"><textarea class="form-control" rows="7" cols="100" id="faq_content" name="faq_content">${faq.faq_content}</textarea></td>
				</tr>
				</thead>
			</table>
		</div><br /><br/>
		<div style="margin-left:550px;">
		<button type="button" class="btn btn-outline-primary" onclick="location.href='getFaq?page=${faqPagingVO.page}'" style="float:left;">목록보기</button>
		</div>
		<c:if test="${user_auth == 'admin' }">
		<div style="margin-left:228px; float:left;">
		<button type="button" class="btn btn-outline-primary" onclick="deleteAlert()">글 삭제</button>
		&nbsp;&nbsp;
		<input type="submit"  class="btn btn-outline-primary" value="글 수정">
		</div>
		</c:if>
		</form>
	</div>
    </section>
</body>
</html>