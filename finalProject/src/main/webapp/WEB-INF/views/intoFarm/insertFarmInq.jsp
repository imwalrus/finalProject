<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="card-header" align="center">
	<h2>농촌속으로 문의 작성</h2>
</div>					
<form action="insertFarmInq" method="post">
  <fieldset>
    <div class="form-group row">
      <div class="col-sm-10">
      	<input type="hidden" name="user_id" value="${user_id }">
      	<input type="hidden" name="into_no" value="${intoTheFarmVO.into_no }"> 
      </div>
    </div>
    <div class="form-group">
      <label for="exampleInputEmail1">제목</label>
      <input type="text" class="form-control" name="into_inq_title" placeholder="제목을 작성하세요." required="required">
    </div>
    <div class="form-group">
      <label for="exampleInputEmail1">농촌속으로 체험명</label>
      <input type="text" class="form-control" value="${intoTheFarmVO.into_title }" readonly="readonly"> 
    </div>
    <div class="form-group">
      <label for="exampleTextarea">문의내용</label>
      <textarea class="form-control" name="into_inq_content" rows="7" placeholder="문의 사항을 작성하세요." required="required"></textarea>
    </div>
    <fieldset class="form-group">
      <legend>비밀 여부</legend>
      <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="into_inq_check" value="0" >사용안함  
        </label>
      </div>
      <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="into_inq_check" value="1" checked> 사용함
        </label>
      </div>
    </fieldset>
		<div class="form-group row">
			<button type="submit" class="btn  btn-outline-success">등록</button>
			<button type="reset" class="btn  btn-outline-danger">취소</button>
		</div>
  </fieldset>
</form>
