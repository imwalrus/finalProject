<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../mypage/adminMenu.jsp" />

<!DOCTYPE html>
<html lang="ko">

<head>
    <title>나의 농지 리스트</title>
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
    <div class="pcoded-content">
        <!-- [ breadcrumb ] start -->
        <div class="page-header">
            <div class="page-block">
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <div class="page-header-title">
                            <h5 class="m-b-10">Bootstrap Basic Tables</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#!">Bootstrap Table</a></li>
                            <li class="breadcrumb-item"><a href="#!">Basic Tables</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ breadcrumb ] end -->
        <!-- [ Main Content ] start -->
        <div class="row">
            <!-- [ basic-table ] start -->

            <!-- [ stiped-table ] end -->
            <!-- [ Contextual-table ] start -->
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h2>나의 농지 List</h2>
                    </div>
                    <div class="card-body table-border-style">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>농장이름</th>
                                        <th>주소</th>
                                        <th>면적</th>
 
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${farmlist }" var="fa">
                                    <tr class="table-success" onclick="location.href='getFarm?farm_no=${fa.farm_no }'">
                                        <th>${fa.farm_no }</th>
                                        <th>${fa.farm_name }</th>
                                        <th>${fa.farm_adr }</th>
                                        <th>${fa.farm_area }</th>
                                    </tr>
                                 </c:forEach>  
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ Contextual-table ] end -->

        </div>
        <!-- [ Main Content ] end -->
    </div>
</section>

    <!-- Required Js -->
    <script src="resources/admin/js/vendor-all.min.js"></script>
    <script src="resources/admin/js/plugins/bootstrap.min.js"></script>
    <script src="resources/admin/js/ripple.js"></script>
    <script src="resources/admin/js/pcoded.min.js"></script>


</body>
</html>