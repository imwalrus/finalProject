<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Favicon icon -->
<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
<!-- vendor css -->
<link rel="stylesheet" href="resources/admin/css/style.css">
</head>


<body>

	<!-- 모달바디 시작 -->
	<div class="modal-body">
			<img class="img-fluid card-img-top"
				src="resources/admin/images/slider/img-slide-1.jpg" alt="Card image cap">
			<div class="card-body">
					<table class="table">
							<tr class="table-success">
								<td colspan="2" id="name"><h4>${farm.farm_name}</h4></td>								
								
							</tr>
							<tr>
								<th class="table-success">농장번호</th>
								<td id="no">${farm.farm_no}</td>								
								
							</tr>
							<tr>
								<th class="table-success">주소</th>
								<td id="adr">${farm.farm_adr}</td>								
							</tr>
							<tr>
								<th class="table-success">면적</th>
								<td id="area">${farm.farm_area}</td>								
							</tr>
							<tr>
								<th class="table-success">내용</th>
								<td id="content">${farm.farm_content}</td>								
							</tr>													
						</table>

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