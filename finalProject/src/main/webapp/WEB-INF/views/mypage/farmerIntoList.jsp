<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="" />
    <meta name="keywords" content="">
    <meta name="author" content="Phoenixcoded" />
    <!-- Favicon icon -->
    <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">

    <!-- vendor css -->
    <link rel="stylesheet" href="resources/admin/css/style.css">
    
    

</head>
<body>
	<section class="pcoded-main-container">
    <!-- [ Main Content ] start -->
    <div class="pcoded-main-container">
        <div class="pcoded-content">
            <!-- [ breadcrumb ] start -->
            <div class="page-header">
                <div class="page-block">
                    <div class="row align-items-center">
                        <div class="col-md-12">
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ breadcrumb ] end -->
            <!-- [ Main Content ] start -->
            <div class="row">
                <!-- [ vertically-modal ] start -->
                <div class="col-md-10">
                    <div class="card">
                        <div class="card-body" align="center">

                            <!-- [ Contextual-table ] start -->
                            <div class="col-md-9">
                                <div class="card-header">
                                    <h2>농촌속으로 관리 List</h2>
                                </div>
                                <br>
                                 <div style="float: right">
									<button type=button class="btn  btn-success btn-sm"
											onclick="bongsaOpen()">봉사활동 양식출력</button>
							     </div>
							     <br>
                                <div class="table-responsive">							       
									<table class="table" id="list">
										<tr class="table-success">
											<th>제험번호</th>
											<th>체험명</th>
											<th>지역</th>
											<th>농작물</th>
											<th>기간</th>
											<th>신청명단</th>										
										</tr>																	
									</table>
                                </div>
                                <!-- [ Contextual-table ] end -->
                            </div>
                        </div>
                        <!-- [ vertically-modal ] end -->
                    </div>


                </div>



            </div>
        </div>
        
        <!-- 확인서모달시작 -->
			<div class="modal fade bd-example-modal-lg" id="bongsa" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
					<div class="modal-header">
							<button class="close" type="button" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">x</span>
							</button>
						</div>
						<div class="modal-body"></div>
					
					</div>
				</div>
			</div>
		<!-- 끝 -->
</div>
</section>

		 <!-- 신청명단 모달시작 -->
			<div class="modal fade bd-example-modal-lg" id="userList" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
					<div class="modal-header">
							<button class="close" type="button" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">x</span>
							</button>
						</div>
						<div class="modal-body"></div>
					</div>
				</div>
			</div>
		<!-- 끝 -->

	<!-- Required Js -->
	<script src="resources/admin/js/vendor-all.min.js"></script>
	<script src="resources/admin/js/plugins/bootstrap.min.js"></script>
	<script src="resources/admin/js/ripple.js"></script>
	<script src="resources/admin/js/pcoded.min.js"></script>
	<script type="text/javascript">
	
	function bongsaOpen() {
		$('#bongsa .modal-body').load("bongsaFile");
		$('#bongsa').modal();

	}
	
	function userListOpen(str) {
		$('#userList .modal-body').load("intoUserList?into_no=" + str);
		$('#userList').modal();

	}
	
	
	$.ajax({
		url:"ajaxfarmerIntoList",
		data: "user_id=" + '${user_id}',
		dataType: "json",
		success: function(data){
			for(i=0; i<data.length; i++){
				$("#list").append(
					"<tr><td>" + data[i].into_no + "</td><td>" 
					+ data[i].into_title + "</td><td>"
					+ data[i].into_city + "</td><td>"
					+ data[i].into_product + "</td><td>"
					+ data[i].into_dates + "</td><td>"					
					+ "<button type='button' class='btn  btn-warning btn-sm' onclick='userListOpen(" + data[i].into_no + ")'>"+ "명단보기"+ "</button>"			
					+"</td></tr>" 
					
				
				);
				
				
				
			}
			
			
		}
		
		
	});
	
	
	</script>
</body>
</html>