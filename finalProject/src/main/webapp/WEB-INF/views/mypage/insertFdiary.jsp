<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="insertFdiary" enctype="multipart/form-data" method="post">
	<div class="card-body">

		<div class="row">

			<div class="col-md-6">
				<input type="text" name="crop_no">
				<div class="form-group">
					<div class="form-row">
						<div class="form-group col-md-4">
							<label for="exampleInputEmail1"><h5>날짜</h5></label>
						</div>
						<div class="form-group col-md-8">
						<input type="date" id="datepicker" class="form-control" name="fdiary_day">
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="form-row">
						<div class="form-group col-md-4">
							<label for="exampleInputEmail1"><h5>시작시간</h5></label>
						</div>
						<div class="form-group col-md-8">
							<input type="time" class="form-control" name="fdiary_stime">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="form-row">
						<div class="form-group col-md-4">
							<label for="exampleInputEmail1"><h5>종료시간</h5></label>
						</div>
						<div class="form-group col-md-8">
							 <input type="time" class="form-control" name="fdiary_etime">
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<div class="form-row">
						<div class="form-group col-md-3" >
							<label for="exampleInputEmail1"><h5>작업인력</h5></label>
						</div>
						<div class="form-group col-md-8">
							<input type="text" class="form-control" name="fdiary_worker">
						</div>
						<div class="form-group col-md-1" name="fdiary_worker">
							<label for="exampleInputEmail1"><h5>명</h5></label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="form-row">
						<label><h5>날씨</h5></label> 
						<input type="text" class="form-control" name="fdiary_weather">
					</div>
				</div>
				<div class="form-group">
					<div class="form-row">
						<label><h5>파일첨부</h5></label>
						<input multiple="multiple" type="file" name="uploadFile">
						<input type="hidden" name="fdiary_filename">
					</div>
				</div>
			</div>

			<div class="col-md-12">
				<div class="form-group">
					<label for="exampleFormControlTextarea1"><h5>내용</h5></label>
					<textarea class="form-control" rows="3" name="fdiary_content"></textarea>
				</div>
			</div>
			<input type="hidden" name="user_id" value="${user_id }">
		</div>
	</div>
		 <div class="col-md-12" align="center">
			<button type="submit" class="btn  btn-outline-success">등록</button> 
			<button type="reset" class="btn  btn-outline-danger">취소</button>
		</div>
</form>

<script>
 document.fdiary_day.date.value.split("-").join("");

</script>