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
                                    <h2>제목</h2>
                                </div>
                                <div class="table-responsive">
									<table class="table" id="sale">
										<tr>
											<th>주문번호</th>
											<th>판매제품</th>
											<th>수량</th>
											<th>결제금액</th>
											<th>결제수단</th>
											<th>구매자</th>
											<th>송장번호등록</th>
										</tr>
										<tr>
										<td>${sale.order_no }</td>
										<td>${sale.orderlist_pro_name}</td>
										<td>${sale.orderlist_pro_count}</td>
										<td>${sale.account}</td>
										<td>${sale.order_payment}</td>
										<td>${sale.client }</td>
										<td><button type="button" class="btn  btn-outline-danger btn-sm" 
																	onclick="delivery('${order_no }')">송장번호</button>										
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

</body>
</html>