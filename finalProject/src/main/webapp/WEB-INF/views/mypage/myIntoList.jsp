<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <title>회원 탈퇴</title>
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
                                    <h2>농촌속으로<br>(나의 신청 목록)</h2>
                                </div>
                                <div class="table-responsive">							       
									<table class="table" id="mylist">
										<tr class="table-success">
											<th>신청번호</th>
											<th>체험이름</th>
											<th>체험일자</th>
											<th>신청인원</th>
											<th>보상</th>
											<th>담당자연락처</th>										
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
</div>
</section>

	<!-- Required Js -->
	<script src="resources/admin/js/vendor-all.min.js"></script>
	<script src="resources/admin/js/plugins/bootstrap.min.js"></script>
	<script src="resources/admin/js/ripple.js"></script>
	<script src="resources/admin/js/pcoded.min.js"></script>
	<script type="text/javascript">
		$.ajax ({
			url:"ajaxmyIntoList",
			data: "user_id=" + '${user_id}',
			dataType:"json",
			success: function(data){
				
				for(i=0; i<data.length; i++) {
					$("#mysale").append(		
					"<tr><td>" + data[i].INTO_REQ_NO + "</td><td>"
					+ data[i].INTO_TITLE + "</td><td>"
					+ data[i].INTO_REQ_DATES + "</td><td>"
					+ data[i].INTO_REQ_ENTRY + "</td><td>"
					+ data[i].INTO_REQ_REWARD + "</td><td>"
					+ data[i].INTO_PHONE + "</td></tr>"
					
					);
				}
			
				
			}
			
			
			
		});
	
	</script>
</body>
</html>