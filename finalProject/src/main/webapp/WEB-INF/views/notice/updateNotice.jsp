<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>청년농장</title>
<style type="text/css">
#faq_title {  padding:5px;
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
			<h1>공지사항 수정하기</h1>
		</div><br/>
		<form id="frm" name="frm" action="updateNotices" method="post">
		<input type="hidden" name="notice_no" value="${Notice.notice_no}">
		<input type="hidden" name="page" value="${noticePagingVO.page}">
		<div>
			<table class="table table-hover" style ="table-layout: auto; width: 80%; table-layout: fixed;">
				<thead>
				<tr>
					<td align="center" width="70">글번호</td>
					<td align="center" width="50">${Notice.notice_no}</td>
					<td align="center" width="70">분류</td>
					<td align="center" width="80">
					<select id="notice_category" name="notice_category">
			        <option value="관련기사"
			        <c:if test ="${Notice.notice_category == '관련기사'}">
				             selected </c:if>>관련기사</option>
				    <option value="관련공문"
				    <c:if test ="${Notice.notice_category == '관련공문'}">
				             selected </c:if>>관련공문</option>
			        <option value="농산물가격"
			        <c:if test ="${Notice.notice_category == '농산물가격'}">
				             selected </c:if>>농산물가격</option>
			        <option value="축제,박람회"
			        <c:if test ="${Notice.notice_category == '축제,박람회'}">
				             selected </c:if>>축제,박람회</option>
			        </select></td>
					<td align="center" width="80">작성일자</td>
					<td align="center" width="150">${Notice.notice_date}</td>
				</tr>
				<tr>
					<td width="80">제 목</td>
					<td align="left" colspan="5">
					<input class="form-control" type="text" id="notice_title" name="notice_title" value="${Notice.notice_title}"></td>
				</tr>
				<tr>
					<td width="70">내용</td>
					<td align="left" colspan="5" height="300px">
					<textarea class="form-control" id="notice_content" name="notice_content">${Notice.notice_content}</textarea></td>
				</tr>
				</thead>
			</table>
		</div><br/><br/>
		<div style="margin-left:550px;">
		<button type="button" class="btn btn-outline-primary" onclick="location.href='getNotices?page=${noticePagingVO.page}'" style="float:left;">목록보기</button>
		</div>
	
		<div style="margin-left:228px; float:left;">
		<input type="submit"  class="btn btn-outline-primary" value="글 저장">
		&nbsp;&nbsp;
		<input type="reset"  class="btn btn-outline-primary" value="reset">
		</div>
	</form>
	</div><br/>
    </section>
</body>
</html>