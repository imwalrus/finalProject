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
			frm.action = "deleteNotices?notice_no=${NoticeVO.notice_no}&page=${noticePagingVO.page}"
			frm.submit();
		}
	}
</script>
<style type="text/css">
#notice_title {  width:836px;
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
			<h1>공지사항 상세보기</h1>
		</div><br/>
		<form id="frm" name="frm" action="updateNotices" method="post">
		<input type="hidden" name="notice_no" value="${NoticeVO.notice_no}">
		<input type="hidden" name="page" value="${noticePagingVO.page}">
		<div>
			<table class="table table-hover" style ="table-layout: auto; width: 80%; table-layout: fixed;">
				<thead>
				<tr>
					<td align="center" width="70">글번호</td>
					<td align="center" width="50">${NoticeVO.notice_no}</td>
					<td align="center" width="70">분류</td>
					<td align="center" width="80">
					<select name="notice_category" id="notice_category">
					<option value="관련기사"
                    <c:if test ="${NoticeVO.notice_category eq '관련기사'}">
	                selected </c:if>>관련기사</option>
	                <option value="관련공문"
	                <c:if test ="${NoticeVO.notice_category eq '관련공문'}">
	                selected </c:if>>관련공문</option>
                    <option value="농산물가격"
                    <c:if test ="${NoticeVO.notice_category eq '농산물가격'}">
	                selected </c:if>>농산물가격</option>
                    <option value="축제,박람회"
                    <c:if test ="${NoticeVO.notice_category eq '축제,박람회'}">
	                selected </c:if>>축제,박람회</option>
					</select></td>
					<td align="center" width="80">작성일자</td>
					<td align="center" width="150">${NoticeVO.notice_date}</td>
				</tr>
				<tr>
					<td align="center" width="80">제 목</td>
					<td colspan="5" ><input class="form-control" type="text" id="notice_title" name="notice_title" value="${NoticeVO.notice_title}" size=97></td>
				</tr>
				<tr>
					<td align="center" width="70">내용</td>
					<td colspan="5"><textarea class="form-control" rows="7" cols="100" id="notice_content" name="notice_content">${NoticeVO.notice_content}</textarea></td>
				</tr>
				</thead>
			</table>
		</div><br /><br/>
		<div style="margin-left:100px;">
		<button type="button" class="btn btn-outline-primary" onclick="location.href='getNotices?page=${noticePagingVO.page}'">목록보기</button>
		&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-outline-primary" onclick="deleteAlert()">글 삭제</button>
		&nbsp;&nbsp;&nbsp;
		<input type="submit"  class="btn btn-outline-primary" value="글 수정">
		</div>
		</form>
	</div>
    </section>
</body>
</html>