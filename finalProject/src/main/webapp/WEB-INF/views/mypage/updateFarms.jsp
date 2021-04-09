<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Favicon icon -->
<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
<!-- vendor css -->
<link rel="stylesheet" href="resources/admin/css/style.css">
</head>


<body>

	<!-- 모달헤드 끝 -->
	
	<!-- 모달바디 시작 -->
	<div class="modal-body">
			<img class="img-fluid card-img-top"
				src="resources/admin/images/slider/img-slide-1.jpg" alt="Card image cap">
			<div class="card-body">
			<form id="frm" name="frm" action="updateFarms" method="post">
			
				<!-- 숨겨진 유저 ID -->
				<input type="hidden" name="userId" value="${ufarm.user_id } ">
				<!-- 숨겨진 유저 ID -->
			
					<table class="table">
							<tr class="table-success">
								<td colspan="2">
								   <div class="form-group">     
                                        <input type="text" class="form-control" id="farm_name" name="farm_name" value="${ufarm.farm_name}"placeholder="${ufarm.farm_name}">
                                    </div>								
								</td>																
							</tr>
							<tr>
								<th class="table-success">농장번호</th>
								<td>
								<input type="hidden" id="farm_no" name="farm_no" value="${ufarm.farm_no }">
								${ufarm.farm_no }
								</td>								
								
							</tr>
							<tr>
								<th class="table-success">주소</th>
								<td>
									<div class="form-group">     
                                        <input type="text" class="form-control" id="farm_adr" name="farm_adr" value="${ufarm.farm_adr }" placeholder="${ufarm.farm_adr }">
                                    </div>
								</td>								
							</tr>
							<tr>
								<th class="table-success">면적</th>
								<td>
									<div class="form-group">     
                                        <input type="text" class="form-control" id="farm_area" name="farm_area" value="${ufarm.farm_area }" placeholder="${ufarm.farm_area }">
                                    </div>
								</td>								
							</tr>
							<tr>
								<th class="table-success">내용</th>
								<td>
									<div class="form-group">
										<textarea class="form-control" id="farm_content" name="farm_content" rows="3" 
													value="${ufarm.farm_content }" placeholder="${ufarm.farm_content }">
										</textarea> 
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
	<!-- 모달바디 끝 -->
	
	<!-- Required Js -->
	<script src="resources/admin/js/vendor-all.min.js"></script>
	<script src="resources/admin/js/plugins/bootstrap.min.js"></script>
	<script src="resources/admin/js/ripple.js"></script>
	<script src="resources/admin/js/pcoded.min.js"></script>
</body>
</html>