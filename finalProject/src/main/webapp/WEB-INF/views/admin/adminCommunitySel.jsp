<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<body>
	<div class="modal-header">
		<h4 class="modal-title">제목 : ${community.comm_title}</h4>
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	</div>
	<div class="modal-body">
		<div class="form-group row">
			<div class="col-md-6">
				<strong>말머리</strong>
				<input type="text" class="form-control" value="${community.comm_subject}" readonly="readonly">
			</div>
			<div class="col-md-6">
				<strong>작성일자</strong>
				<input type="text" class="form-control" value="${community.comm_date}" readonly="readonly">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-md-6">
				<strong>작성자</strong>
				<input type="text" class="form-control" value="${community.user_id}" readonly="readonly">
			</div>
			<div class="col-md-6">
				<strong>지역</strong>
				<input type="text" class="form-control" value="${community.comm_adr}" readonly="readonly">
			</div>
		</div>
		<strong>내용</strong>
		<p>${community.comm_content}</p>
	</div>
	<div class="modal-footer">
		<input type="button" class="btn btn-info" data-dismiss="modal" value="닫기">
	</div>
</body>