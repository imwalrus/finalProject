<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/main/css/style.css">

<style>
.table th{
background-color: #c3e6cb;
font-weight: bold;
}
h2{
font-weight: bold;
}
h4{
font-weight: bold;
}
</style>
<form action="updatepuchasInq" enctype="multipart/form-data" method="post">
<div class="row" align="center">
			
				<!-- 숨겨진 유저 ID -->
						<input type="hidden" name="pur_inq_no" value="${pupdate.pur_inq_no }">
				<!-- 숨겨진 유저 ID -->
			
				<table class="table">
						<tr>
							<th class="table-success">제목</th>
							<td colspan="2">
								<input type="text" class="form-control" name="pur_inq_title" value="${pupdate.pur_inq_title }">
							</td>
						</tr>
						<tr>
							<th class="table-success">작성일</th>
							<td>${pupdate.pur_inq_date }</td>
							<th class="table-success">비밀글</th>
							<td>
							<c:if test="${pupdate.pur_inq_check eq '1'}">
								<input type="hidden" value="${pupdate.pur_inq_check}">
								<input class="form-check-input" type="radio" name="pur_inq_check" value="1" checked="checked" onclick="return(false);">사용
								<br>
								<input class="form-check-input" type="radio" name="pur_inq_check" value="0" onclick="return(false);">사용안함
							</c:if>
							<c:if test="${pupdate.pur_inq_check eq '0'}">
								<input type="hidden" value="${pupdate.pur_inq_check}">
								<input class="form-check-input" type="radio" name="pur_inq_check" value="1" onclick="return(false);">사용
								<br>
								<input class="form-check-input" type="radio" name="pur_inq_check" value="0"  checked="checked" onclick="return(false);">사용안함
							</c:if>
							</td>
							<th class="table-success">작성자</th>
							<th>${pupdate.user_id}</th>
						</tr>
						<tr>
							<th class="table-success">파일첨부</th>
							<td colspan="7">
								<input multiple="multiple" type="file" class="form-control" name="inqfile" value="${pupdate.pur_inq_filename}">
								<input type="hidden" name="pur_inq_filename" value="${pupdate.pur_inq_filename}">	
							</td>
						</tr>
						<tr>
							<th class="table-success">내용</th>
							<td colspan="7">
								<textarea class="form-control" id="pur_inq_content" name="pur_inq_content" rows="10">${pupdate.pur_inq_content}</textarea>
								
							</td>
						</tr>
						<tr>
							<td colspan="8">
								<button type="submit" class="btn  btn-outline-success">등록</button>
							<td>
						</tr>
					</table>			
		</div>	

</form>
<!-- 모달바디 끝 -->

