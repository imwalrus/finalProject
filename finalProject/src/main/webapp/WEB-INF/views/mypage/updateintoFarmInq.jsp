<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 모달바디 시작 -->
<form action="updateintoFarmInq" method="post">
<div class="row">
			
				<!-- 숨겨진 유저 ID -->
						<input type="hidden" name="into_inq_no" value="${ulist.into_inq_no }">
				<!-- 숨겨진 유저 ID -->
			
				<table class="table">
						<tr>
							<th class="table-success">제목</th>
							<td colspan="2">
								<input type="text" class="form-control" name="into_inq_title" placeholder="${ulist.into_inq_title }">
							</td>
						</tr>
						<tr>
							<th class="table-success">작성일</th>
							<td>${ulist.into_inq_date }</td>
							<th class="table-success">비밀글</th>
							<td><input class="form-check-input" type="radio" name="into_inq_check" value="${ulist.into_inq_check}">사용</td>
							<th class="table-success">작성자</th>
							<th>${ulist.user_id}</th>
						</tr>
						<tr>
							<th class="table-success">내용</th>
							<td colspan="7">
								<textarea class="form-control" id="into_inq_content" name="into_inq_content" rows="10" placeholder="${ulist.into_inq_content}"></textarea>
								
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
