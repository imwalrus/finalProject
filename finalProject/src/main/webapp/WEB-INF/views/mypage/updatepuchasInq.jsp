<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 모달바디 시작 -->
<form action="updatepuchasInq" enctype="multipart/form-data" method="post">
<div class="row">
			
				<!-- 숨겨진 유저 ID -->
						<input type="hidden" name="pur_inq_no" value="${pupdate.pur_inq_no }">
				<!-- 숨겨진 유저 ID -->
			
				<table class="table">
						<tr>
							<th class="table-success">제목</th>
							<td colspan="2">
								<input type="text" class="form-control" name="pur_inq_title" placeholder="${pupdate.pur_inq_title }">
							</td>
						</tr>
						<tr>
							<th class="table-success">작성일</th>
							<td>${pupdate.pur_inq_date }</td>
							<th class="table-success">비밀글</th>
							<td>${pupdate.pur_inq_check}</td>
							<th class="table-success">작성자</th>
							<th>${pupdate.user_id}</th>
						</tr>
						<tr>
							<th class="table-success">파일첨부</th>
							<td colspan="7">
								<input multiple="multiple" type="file" class="form-control" name="inqfile" placeholder="${pupdate.pur_inq_filename}">
								<input type="hidden" name="pur_inq_filename">	
							</td>
						</tr>
						<tr>
							<th class="table-success">내용</th>
							<td colspan="7">
								<textarea class="form-control" id="pur_inq_content" name="pur_inq_content" rows="10" placeholder="${pupdate.pur_inq_content}"></textarea>
								
							</td>
						</tr>
					</table>
				<div align="center">
					<button type="submit" class="btn  btn-outline-success">등록</button>
					<button type="reset" class="btn  btn-outline-success">취소</button>
				</div>
			
		</div>	

</form>
<!-- 모달바디 끝 -->

<!-- Required Js -->
<script src="resources/admin/js/vendor-all.min.js"></script>
<script src="resources/admin/js/plugins/bootstrap.min.js"></script>
<script src="resources/admin/js/ripple.js"></script>
<script src="resources/admin/js/pcoded.min.js"></script>
