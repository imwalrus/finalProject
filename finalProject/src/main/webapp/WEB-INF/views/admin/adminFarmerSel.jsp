<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<body>
	<div class="modal-header">
		<h4 class="modal-title"></h4>
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	</div>
	<div class="modal-body">
		<div class="form-group">
			<label>ID</label>
			<input type="text" class="form-control" value="${farmer.user_id}" readonly="readonly">
		</div>
		<div class="form-group">
			<label>이름</label>
			<input type="text" class="form-control" value="${farmer.user_name}" readonly="readonly">
		</div>
		<div class="form-group">
			<label>신청 날짜</label>
			<input type="text" class="form-control" value="${farmer.farmer_date}" readonly="readonly">
		</div>
		<!-- ★파일 다운 추가하기★ -->
		<div class="form-group">
			<label>파일</label>
			<input type="text" class="form-control" value="${farmer.farmer_filename}" readonly="readonly">
		</div>
	</div>
	<div class="modal-footer">
		<input type="button" class="btn btn-info" data-dismiss="modal" value="닫기">
	</div>
</body>