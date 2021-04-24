<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<body>
	<script>
		$('.btn btn-outline-success').submit(function(){
			var id = $('input[name=user_id]').val();
			if (id == '') {
				alert('로그인이 필요합니다');
				return false;
			}
		});
	</script>
	<section class="pcoded-main-container">
		<div class="pcoded-main-container">
			<div class="pcoded-content">
				<div class="row">
					<div class="col">
						<div class="card">
							<div class="card-body">
								<div class="card-header" align="center">
									<h2>구매 관련 문의</h2>
								</div>
								<form action="insertInq" enctype="multipart/form-data" method="post">
									<div class="row">
										<div class="col-md-6">
											<br>
											<input type="hidden" name="user_id" value="${user_id}"><!-- 사용자 이름 자동으로 들어오게 숨기기 -->
											<div class="form-group row">
												<label for="inputTitle" class="col-sm-3 col-form-label"><strong>제목</strong></label>
												<div class="col-sm-9">
													<input type="text" class="form-control" name="pur_inq_title" maxlength="50" placeholder="제목을 입력하세요" required>
												</div>
											</div>
											<br>
											<div class="form-group row">
												<label for="inputEmail3" class="col-sm-3 col-form-label"><strong>문의 할 제품</strong></label>
												<div class="col-sm-9">
													<input type="hidden" class="form-control" name="pro_no" value="${modal.pro_no}">
													<input type="text" class="form-control" value="${modal.pro_name}">
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword3" class="col-sm-3 col-form-label"><strong>파일첨부</strong></label>
												<div class="col-sm-9">
													<input multiple="multiple" type="file" class="form-control" name="inqfile">
													<input type="hidden" name="pur_inq_filename">	
												</div>
											</div>
											<br>
											<br>
											<div class="form-group row">
												<div class="col-sm-3"><strong>비밀여부</strong></div>
												<div class="col-sm-9">
													<div class="form-check">
														<input class="form-check-input" type="radio" name="pur_inq_check" value="1" checked="checked">사용
														<br>
														<input class="form-check-input" type="radio" name="pur_inq_check" value="0">사용안함
													</div>
												</div>
											</div>
											<br>
										</div>
										<div class="col-md-6">
											<br>
											<div class="form-group">
												<label for="exampleFormControlTextarea1"><strong>내용</strong></label>
												<textarea class="form-control" name="pur_inq_content" rows="10" required></textarea>
											</div>
										</div>

									</div>
									<div class="form-group row" align="center">
										<div class="col-sm-10">
											<button type="submit" class="btn btn-outline-success">등록</button>
											<button type="reset" class="btn btn-outline-danger">취소</button>
										</div>
									</div>
								</form>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>