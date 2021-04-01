<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../mypage/adminMenu.jsp" />
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
                                        <h2>회원탈퇴</h2>
                                    </div>
                                            <div class="alert alert-warning mb-0" role="alert" align="center">
                                                <p class="mb-0">
                                                    <h5>탈퇴 전 아래 내용을 확인하시기 바랍니다.</h5><br>
                                                    <br>
                                                    <h4>회원 탈퇴는 즉시 개인정보가 모두 삭제 됩니다.
                                                    <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp단, 게시판 등에 공유하신 게시물은 탈퇴 후에도 삭제되지 않습니다.
                                                    </h4>
                                                    <br>
                                                    <form class="was-validated">
                                                        <div class="custom-control custom-checkbox mb-3">
                                                            <input type="checkbox" class="custom-control-input" id="customControlValidation1" required>
                                                            <label class="custom-control-label" for="customControlValidation1">위 내용에 동의시 체크해주세요.</label>
                                                            <div class="invalid-feedback">체크되지 않을 경우 탈퇴가 불가능 합니다.</div>
                                                        </div>
                                                </form>
                                                </p>
                                            </div>
                                            <br>
                                        <div align="center">
                                            <div class="col-md-6">
                                                <form>
                                                    <div class="form-group row">
                                                        <label for="inputEmail3" class="col-sm-4 col-form-label"><h6>ID</h6></label>
                                                        <div class="col-sm-8">
                                                            <input type="text" class="form-control" id="#" value="#" readonly="readonly" >
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="inputEmail3" class="col-sm-4 col-form-label"><h6>이름</h6></label>
                                                        <div class="col-sm-8">
                                                            <input type="email" class="form-control" id="#" value="#" readonly="readonly">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="inputPassword3" class="col-sm-4 col-form-label"><h6>Password</h6></label>
                                                        <div class="col-sm-8">
                                                            <input type="password" class="form-control" id="#" placeholder="Password">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="inputPassword3" class="col-sm-4 col-form-label"><h6>Password확인</h6></label>
                                                        <div class="col-sm-8">
                                                            <input type="password" class="form-control" id="#" placeholder="Password 확인">
                                                        </div>
                                                    </div>


                                                    <div class="form-group row">
                                                        <div class="col-sm-10">
                                                            <button type="submit" class="btn  btn-outline-danger" 
                                                                onclick="deleteAlert('${user_id }')">탈퇴</button>
                                                        </div>
                                                    </div>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- [ static-layout ] end -->
                             </div>
                         </div>
                      </div>
   </section>         


	<!-- Required Js -->
	<script src="resources/admin/js/vendor-all.min.js"></script>
	<script src="resources/admin/js/plugins/bootstrap.min.js"></script>
	<script src="resources/admin/js/ripple.js"></script>
	<script src="resources/admin/js/pcoded.min.js"></script>
	    <script>
        function deleteAlert(str) {
			var yn = confirm("탈퇴시 복구되지 않습니다.그래도 탈퇴하시겠습니까?");
			if (yn) {
				location.href = "deletemember?user_id=" + str;
			} else {
				alert("탈퇴가 완료되지 않았습니다.  ");
			}
		}

    </script>
</body>
</html>