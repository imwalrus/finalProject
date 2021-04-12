<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<body>
	<div class="modal-header">
		<h4 class="modal-title">ID : ${user.user_id}</h4>
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	</div>
	<div class="modal-body">
		<div class="form-group row">
			<div class="col-md-6">
				<strong>이름</strong>
				<input type="text" class="form-control" value="${user.user_name}" readonly="readonly">
			</div>
			<div class="col-md-6">
				<strong>생년월일</strong>
				<input type="text" class="form-control" value="${user.user_birth}" readonly="readonly">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-md-6">
				<strong>연락처</strong>
				<input type="text" class="form-control" value="${user.user_phone}" readonly="readonly">
			</div>
			<div class="col-md-6">
				<strong>이메일</strong>
				<input type="text" class="form-control" value="${user.user_email}" readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<strong>우편번호</strong>
			<input type="text" class="form-control" value="${user.user_zip}" readonly="readonly">
		</div>
		<div class="form-group">
			<strong>주소</strong>
			<input type="text" class="form-control" value="${user.user_adr}" readonly="readonly">
		</div>
		<div class="form-group">
			<strong>상세주소</strong>
			<input type="text" class="form-control" value="${user.user_detailadr}" readonly="readonly">
		</div>
		<div class="form-group">
			<strong>농업인</strong>
			<c:choose>
				<c:when test="${user.user_auth eq 'farmer'}">
					<input type="text" class="form-control" value="O" readonly="readonly">
				</c:when>
				<c:when test="${user.user_auth ne 'farmer'}">
					<input type="text" class="form-control" value="X" readonly="readonly">
				</c:when>
			</c:choose>
		</div>
	</div>
	<div class="modal-footer">
		<input type="button" class="btn btn-info" data-dismiss="modal" value="닫기">
	</div>
</body>