<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>    
<style>

.table{
min-width:100% !important;
}
.table tbody tr td {
padding: 10px 8px !important;
}

.table {
	text-align: center;
}

</style>    

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
                                    <h2>판매 내역</h2>
                                </div>
                                <div class="table-responsive">
                                <form action="updateOrder" method="post">
									<table class="table" id="sale">
										<tr class="table-success">
											<th>주문번호-상세</th>
											<th>판매제품</th>
											<th>수량</th>
											<th>결제금액</th>
											<th>결제수단</th>
											<th>판매자</th>
											<th>주문상태/송장번호</th>
											<th>송장번호등록</th>											
										</tr>								
									</table>
								</form>
                                </div>
                                <!-- [ Contextual-table ] end -->
                            </div>
                        </div>
                        <!-- [ vertically-modal ] end -->
                    </div>


                </div>



            </div>
        </div>
        
        
        
        <!-- 송장번호시작 모달 -->
			<div class="modal fade bd-example-modal-lg" id="invoiceUp"
				tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
				aria-hidden="true">
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
		<!-- 모달끝 -->
</div>
</section>
<script type="text/javascript">
function invoiceUp(str) {
	$('#invoiceUp .modal-body').load("updateOrder?orderlist_no=" + str);
	$('#invoiceUp').modal('show');


}

$.ajax({
	url: "ajaxgetSaleList",
	data: "user_id=" + '${user_id}',
	dataType: "json",
	success: function(data){
		for(i=0; i<data.length; i++){
			$("#sale").append(
					"<tr><td>" + data[i].order_no + "-" + data[i].orderlist_no + "</td><td>" 
					+ data[i].pro_name + "</td><td>" 
					+ data[i].cart_count + "</td><td>"
					+ data[i].account + "</td><td>"
					+ data[i].order_payment + "</td><td>"
					+ data[i].seller + "</td><td>"
					+ data[i].order_condition +"<br>"
					+ data[i].orderlist_invoice + "</td><td>"
					+ "<button type='button' class='btn  btn-warning btn-sm' onclick='invoiceUp("+data[i].orderlist_no+")'>" + "송장번호등록"+ "</button>"
					+"</td></tr>"
	
					);
			
		}
		
		
	}
	
	
	
	
	
});
</script>
</body>
</html>