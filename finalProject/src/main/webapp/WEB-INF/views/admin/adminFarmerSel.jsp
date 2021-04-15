<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<body>
	<div class="modal-header">
		<h4 class="modal-title">${farmer.farmer_no}</h4>
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	</div>
	<div class="modal-body">
		<div class="form-group">
			<strong>ID</strong>
			<input type="text" class="form-control" value="${farmer.user_id}" readonly="readonly">
		</div>
		<div class="form-group">
			<strong>이름</strong>
			<input type="text" class="form-control" value="${farmer.user_name}" readonly="readonly">
		</div>
		<div class="form-group">
			<strong>신청 날짜</strong>
			<input type="text" class="form-control" value="${farmer.farmer_date}" readonly="readonly">
		</div>
		<!-- 파일 다운 -->
		<div class="form-group">
			<strong>업로드 파일 : </strong>
			<a href="resources/main/files/${farmer.farmer_filename}">${farmer.farmer_filename}</a>
		</div>
	</div>
	<div class="modal-footer">
		<input type="button" class="btn btn-info" data-dismiss="modal" value="닫기">
	</div>
</body>