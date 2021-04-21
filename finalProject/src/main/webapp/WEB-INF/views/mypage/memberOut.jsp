<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>회원 탈퇴</title>
    <meta charset="utf-8">
</head>
<script>
$(document).ready(function(){
	outForm.checkButton.disabled=true;
	
	$('[name=user_pwd]').keyup(function(){
		$('#pwCheckNotice').html('');
		var pwd = $('[name=user_pwd]').val();
		$.ajax({
			url:"pwCheck",
			data:{"user_pwd":pwd , "user_id":"${user_id}"},
			dataType:"JSON",
			success:function(response){
				console.log(response);
				if(response != 1){
					$('#pwCheckNotice').html('비밀번호 일치하지 않음<br>');
					$('#pwCheckNotice').attr('color', '#ff5252');
				} else if(response == 1){
					outForm.checkButton.disabled=false;
					$('#pwCheckNotice').html('비밀번호 일치함<br>');
					$('#pwCheckNotice').attr('color', '#51ad95');
				}
			}
		})
	});
	
	$('[name=checkButton]').on('click', function(){
		var yn = confirm("탈퇴 하시겠습니까?");
		if(yn){
			$('[name=outForm]').submit();
		} else{
			return;
		}
	});	
})
<<<<<<< HEAD


=======
>>>>>>> refs/heads/김현정1
</script>
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
                                                    <form action="memberOut" method="post" class="was-validated" name="outForm">
                                                        <div class="custom-control custom-checkbox mb-3">
                                                            <input type="checkbox" class="custom-control-input" id="customControlValidation1" required>
                                                            <label class="custom-control-label" for="customControlValidation1">위 내용에 동의시 체크해주세요.</label>
                                                            <div class="invalid-feedback">체크되지 않을 경우 탈퇴가 불가능 합니다.</div>
                                                        </div>
                                          		 	<div class="col-md-6">
	                                                    <div class="form-group row">
	                                                        <label class="col-sm-4 col-form-label"><h6>ID</h6></label>
	                                                        <div class="col-sm-5">
	                                                            <input type="text" class="form-control" name="user_id" value="${user_id }" readonly="readonly" >

	                                                        </div>
	                                                    </div>
	                                                    <div class="form-group row">
	                                                        <label class="col-sm-4 col-form-label"><h6>이름</h6></label>
	                                                        <div class="col-sm-5">
	                                                            <input type="email" class="form-control" name="user_name" value="${out.user_name }" readonly="readonly">
	                                                        </div>
	                                                    </div>
	                                                    <div class="form-group row">
	                                                        <label class="col-sm-4 col-form-label"><h6>Password</h6></label>
	                                                        <div class="col-sm-7">
	                                                            <input type="password" class="form-control" name="user_pwd" placeholder="Password">
																<font id="pwCheckNotice" size=2>비밀번호를 입력해주세요.</font>
	                                                        </div>
	                                                    </div>
	                                                    <div class="form-group row">
	                                                        <div class="col-sm-10">
	                                                            <button type="button" class="btn  btn-outline-danger" name="checkButton" onclick="" disabled>탈퇴</button>
	                                                        </div>
	                                                    </div>
                                           		 	</div>
                                                </form>
                                              </p>
                                            </div>
                                            <br>
                                   		 </div>
                                   </div>
                                </div>
                           </div>
                    </div>
               </div>
           </div>
</section>         
</body>
</html>