<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/main/css/style.css">
<link rel="stylesheet" href="resources/main/css/style.css">

<style>
.table th{
background-color: #c3e6cb;
font-weight: bold;
}
h2 {
	font-weight: bold;
}
h3{
	font-weight: bold;
}
</style>
	<div class="modal-body">
			<img class="img-fluid card-img-top" src="./resources/images/mypage/${ufarm.farm_filename}" alt="Card image cap">
			<div class="card-body">
			<form id="frm" name="frm" action="updateFarms" method="post">
			
				<!-- 숨겨진 유저 ID -->
				<input type="hidden" name="userId" value="${ufarm.user_id } ">
				<!-- 숨겨진 유저 ID -->
					
					<table class="table">
							<tr>
								<th>농장명</th>
								<td colspan="1">   
                                        <input type="text" class="form-control" id="farm_name" name="farm_name" value="${ufarm.farm_name}"placeholder="${ufarm.farm_name}" maxlength="30">							
										<input type="hidden" id="farm_no" name="farm_no" value="${ufarm.farm_no }">
								</td>																
							</tr>
							<tr>
								<th>주소</th>
								<td>
									<div class="form-group">     
                                        <input type="text" class="form-control" id="farm_adr" name="farm_adr" value="${ufarm.farm_adr }" placeholder="${ufarm.farm_adr }" maxlength="24">
                                    </div>
								</td>								
							</tr>
							<tr>
								<th>면적</th>
								<td>
									<div class="form-group">     
                                        <input type="text" class="form-control" id="farm_area" name="farm_area" value="${ufarm.farm_area }" placeholder="${ufarm.farm_area }" maxlength="5">
                                    </div>
								</td>								
							</tr>
							<tr>
								<th>내용</th>
								<td>
									<div class="form-group">
										<textarea class="form-control" id="farm_content" name="farm_content" rows="5">${ufarm.farm_content }</textarea> 
                                    </div>
								</td>								
							</tr>												
						</table>
							<div align="center">
									<button type="submit" class="btn  btn-outline-success">등록</button>
							</div>
			</form>
			</div>
		
	</div>