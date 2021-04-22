<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/main/css/style.css">

<style>
.table th {
	background-color: #c3e6cb;
	font-weight: bold;
}

h4 {
	font-weight: bold;
}

h2 {
	font-weight: bold;
}
</style>
<form action="updateintoFarmInq" method="post">
<div class="row">
			
				<!-- 숨겨진 유저 ID -->
						<input type="hidden" name="into_inq_no" value="${ulist.into_inq_no }">
				<!-- 숨겨진 유저 ID -->
			
				<table class="table">
						<tr>
							<th class="table-success">제목</th>
							<td colspan="2">
								<input type="text" class="form-control" name="into_inq_title" value="${ulist.into_inq_title }" required="required">
							</td>
						</tr>
						<tr>
							<th class="table-success">작성일</th>
							<td>${ulist.into_inq_date }</td>
							<th class="table-success">비밀글</th>
							<td>
							<c:if test="${ulist.into_inq_check eq '1'}">
								<input type="hidden" value="${ulist.into_inq_check}">
								<input class="form-check-input" type="radio" name="into_inq_check" value="1" checked="checked" onclick="return(false);">사용
								<br>
								<input class="form-check-input" type="radio" name="into_inq_check" value="0" onclick="return(false);">사용안함
							</c:if>
							<c:if test="${ulist.into_inq_check eq '0'}">
								<input type="hidden" value="${ulist.into_inq_check}">
								<input class="form-check-input" type="radio" name="into_inq_check" value="1" onclick="return(false);">사용
								<br>
								<input class="form-check-input" type="radio" name="into_inq_check" value="0"  checked="checked" onclick="return(false);">사용안함
							</c:if>
							</td>
							<th class="table-success">작성자</th>
							<th>${ulist.user_id}</th>
						</tr>
						<tr>
							<th class="table-success">내용</th>
							<td colspan="7">
								<textarea class="form-control" id="into_inq_content" name="into_inq_content" rows="10"  value="${ulist.into_inq_content}" required="required"></textarea>
								
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

<!-- Required Js -->
<script src="resources/admin/js/vendor-all.min.js"></script>
<script src="resources/admin/js/plugins/bootstrap.min.js"></script>
<script src="resources/admin/js/ripple.js"></script>
<script src="resources/admin/js/pcoded.min.js"></script>
