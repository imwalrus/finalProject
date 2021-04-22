<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<body>
	<div class="modal-header">
		<h4 class="modal-title">${intoFarm.into_no}</h4>
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	</div>
	<div class="modal-body">
		<div class="col">
		<c:forEach items="${images}" var="image" end="0">
			<img src="resources/images/intofarm/${image}" alt="teste" class="img-thumbnail">
		</c:forEach>
		</div>
		<div class="clearfix"></div>
		<div class="form-group row">
			<div class="col-md-6">
				<strong>지역</strong>
				<input type="text" class="form-control" value="${intoFarm.into_city}" readonly="readonly">
			</div>
			<div class="col-md-6">
				<strong>연락처</strong>
				<input type="text" class="form-control" value="${intoFarm.into_phone}" readonly="readonly">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-md-6">
				<strong>이름</strong>
				<input type="text" class="form-control" value="${intoFarm.into_title}" readonly="readonly">
			</div>
			<div class="col-md-6">
				<strong>모집인원수</strong>
				<input type="text" class="form-control" value="${intoFarm.into_entry}" readonly="readonly">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-md-6">
				<strong>종류</strong>
				<input type="text" class="form-control" value="${intoFarm.into_product}" readonly="readonly">
			</div>
			<div class="col-md-6">
				<strong>일정</strong>
				<input type="text" class="form-control" value="${intoFarm.into_date}" readonly="readonly">
			</div>
		</div>
		<strong>내용</strong>
		<p>${intoFarm.into_info}</p>
	</div>
	<div class="modal-footer">
		<input type="button" class="btn btn-info" data-dismiss="modal" value="닫기">
	</div>
</body>