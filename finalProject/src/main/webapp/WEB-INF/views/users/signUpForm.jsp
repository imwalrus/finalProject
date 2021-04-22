<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="resources/main/css/login.bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<style>
	body {
		color: #999;
		background: #f3f3f3;
		font-family: 'InfinitySans-RegularA1','Roboto', sans-serif;
	}
    .form-control {
		border-color: #eee;
        min-height: 41px;
		box-shadow: none !important;
	}
    .form-control:focus {
		border-color: #5cd3b4;
	}
    .form-control, .btn {        
        border-radius: 3px;
    }
	.signup-form {
		width: 500px;
		margin: 0 auto;
		padding: 30px 0;
	}
    .signup-form h2 {
		color: #333;
        margin: 0 0 30px 0;
		display: inline-block;
		padding: 0 30px 10px 0;
		border-bottom: 3px solid #5cd3b4;
    }
    .signup-form form {
		color: #999;
		border-radius: 3px;
    	margin-bottom: 15px;
        background: #fff;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
	.signup-form .form-group {
		margin-bottom: 20px;
	}
	.signup-form label {
		font-weight: normal;
		font-size: 13px;
	}
    .signup-form input[type="checkbox"] {
		margin-top: 2px;
	}
    .signup-form .btn {        
        font-size: 16px;
        font-weight: bold;
		background: #78c2ad !important;
		border: none;
		/* margin-top: 20px; */
		min-width: 140px;
    }
	.signup-form .btn:hover, .signup-form .btn:focus {
		background: rgb(119, 119, 119);
        outline: none !important;
	}
    .signup-form a {
		color: #5cd3b4;
		text-decoration: underline;
	}
	.signup-form a:hover {
		text-decoration: none;
	}
    .signup-form form a {
		color: #5cd3b4;
		text-decoration: none;
	}	
	.signup-form form a:hover {
		text-decoration: underline;
	}
	#idCheck,#searchAddr,#sendEmailJoinCode {
		font-size:13px;
		width:90px !important;
		height:41px;
		background-color:#78c2ad;
	}
	.divcountrol{
		width:120px !important;
	}
	.inputControl{
		width:170px !important;
	}
	.inputControl2{
		width:120px !important;
	}
	#emailCheck{
		font-size:13px;
		width:90px !important;
		height:41px;
	}
	#btnControl{
		float:right;
	}

</style>
<script>
/*
 * form 태그 안의 버튼은 type을 정의하지 않으면 submit 으로 간주하여 post로 넘어가기 때문에 button 타입 정의 해주어야함
 */
var idCk=0;
var pwCk=0;
var emailCk=0;
var emailCodeCk=0;

$(document).ready(function(){
	
//id 중복체크
	$('#idCheck').on('click',function(){
		var id = $('[name=user_id]').val();
		console.log(id);
		$.ajax({
			url:"idCheck",
			data:{"user_id":id},
			dataType: "json",
			success: function(data){
					if(data==0){
						$('#idCheckNotice').html('사용 가능한 아이디!<br>');
						$('#idCheckNotice').attr('color', '#51ad95');
						$('[name=user_password]').focus();
						idCk=1;	
					} else{
						$('#idCheckNotice').html('이미 존재하는 아이디입니다.<br>');
						$('#idCheckNotice').attr('color', '#f82a2aa3');
						$('[name=user_id]').focus();
						$('[name=user_id]').val('');
						idCk=0;
					}
			}
		});
	});
//비밀번호 확인
$(function(){
		$('[name=user_pwd]').keyup(function(){
			$('#pwCkNotice').html('');
		});
		$('[name=confirm_pwd]').keyup(function(){
			if($('[name=user_pwd]').val() != $('[name=confirm_pwd]').val()){
				$('#pwCkNotice').html('비밀번호 일치하지 않음<br>');
				$('#pwCkNotice').attr('color', '#f82a2aa3');
			} else if($('[name=user_pwd]').val() == $('[name=confirm_pwd]').val()){
				pwCk=1;
				$('#pwCkNotice').html('비밀번호 일치함<br>');
				$('#pwCkNotice').attr('color', '#51ad95');
			}
		});
	});
	
//이메일 인증번호 전송
$('#sendEmailJoinCode').on('click',function(){
	var email = $('[name=user_email]').val();
	console.log(email);
	$.ajax({
		url:"emailCheck",
		data:{"user_email":email},
		async:false,
		method:"post",
		dataType: "json",
		success: function(data){
			if(data==0){
				alert('해당 주소로 인증메일이 발송되었습니다. 메일로 전송된 인증번호를 입력칸에 입력해주세요.')
				$('[name=user_email]').css("background-color", "#EBF7FF");
				$('[name=user_emailJoinCode]').focus();
				emailCk=1;
				if(emailCk == 1){
					$.ajax({
						url: "sendEmailJoinCode",
						data: {"user_email":email},
						success:function(response){
							console.log(response);
 							$('#emailJoinCode').keyup(function(){

									if($('#emailJoinCode').val() != response){
										$('#emailJoinCodeNotice').html('인증코드가 일치하지 않습니다. <br>');
										$('#emailJoinCodeNotice').attr('color', '#f82a2aa3');
										emailCodeCk=0;
									} else if($('#emailJoinCode').val() === response){
										$('#emailJoinCodeNotice').html('이메일 인증 성공! <br>');
										$('#emailJoinCodeNotice').attr('color', '#199894b3');
										emailCodeCk=1;
									}
							}); 
						}
					});
				} 
			} else if(data == 1){
				alert("이미 존재하는 이메일 입니다. 다른 이메일을 사용해주세요. ")
				$('[name=signUpBtn]').prop("disabled",false);
				$('[name=user_email]').focus();
				$('[name=user_email]').val('');
				emailCk=0;
		   }
		}
	});
});

});//end 

/*로그인 유효성 체크*/
function insertCheck(){
    
	/*       < 로그인 유효성 체크 해야하는 것 > 
	      1. id 값 입력 확인 - required
	      2. id 중복확인 - idCk == 0 
	      3. 비밀번호, 비밀번호 확인 입력확인 - required
	      4. 비밀번호 일치 확인 - pwCk == 0
	      5. 이름 입력확인 - required
	      6. 이메일 입력확인 - required
	      7. 이메일 인증확인 - emailCodeCk == 0 
	      8. 주소 입력 확인 
	      9. 연락처 입력 확인 - required
	*/
	if(idCk==0){
		alert("아이디 중복체크를 해주세요.");
		form.user_id.focus();
		return false;
	}
	if(pwCk == 0){
		alert('비밀번호를 확인해주세요.');
		return false;
	}
	if(emailCodeCk == 0){
		alert("이메일 인증을 받아주세요.");
		return false;
	}
	
	return true;
}

</script>
</head>
<body>
<div class="signup-form">
     <form onsubmit="return insertCheck();" action="signUp" method="post" class="form-horizontal" name="form">
		<div class="col-xs-8 col-xs-offset-4">
			<h2>회원가입</h2>
		</div>	
        <div class="form-group">
			<label class="control-label col-xs-4 divcountrol" >아이디 *</label>
			<div class="col-xs-8 inputControl">
                <input type="text" class="form-control" name="user_id" id="user_id" required="required">
                <font id="idCheckNotice" size=2></font>
            </div>
            <div>
               	<button type="button" class="btn btn-primary" id="idCheck">ID 중복체크</button>
            </div>
            <div class="check_font" id="id_check"></div>   		        	
        </div>
		<div class="form-group">
			<label class="control-label col-xs-4 divcountrol" >비밀번호 *</label>
			<div class="col-xs-8">
                <input type="password" class="form-control" name="user_pwd" required="required">
            </div>        	
        </div>
		<div class="form-group">
			<label class="control-label col-xs-4 divcountrol" >확 인 *</label>
			<div class="col-xs-8">
                <input type="password" class="form-control" name="confirm_pwd" required="required">
                <font id="pwCkNotice" size=2></font>
            </div>        	
        </div>
        <div class="form-group">
			<label class="control-label col-xs-4 divcountrol" >이 름 *</label>
			<div class="col-xs-8">
                <input type="text" class="form-control" name="user_name" required="required">
            </div>        	
        </div>
        <div class="form-group">
			<label class="control-label col-xs-4 divcountrol" >이메일 *</label>
			<div class="col-xs-8">
                <input type="email" class="form-control" name="user_email" required="required">
        	</div>
        </div>
        
        <div class="form-group">
			<label class="control-label col-xs-4 divcountrol" >인증번호 *</label>
			<div class="col-xs-8 inputControl">
                <input type="text" class="form-control" name="emailJoinCode" id="emailJoinCode" placeholder="인증번호 입력">
                <font id="emailJoinCodeNotice" size=2></font>
            </div>
            <div>
               	<button type="button" class="btn btn-primary" id="sendEmailJoinCode" name="sendEmailJoinCode">이메일 인증</button>
               	<font id="emailJoinCodeNotice" size=2></font>
            </div>
        </div>
        
        <div class="form-group">
			<label class="control-label col-xs-4 divcountrol" >연락처 *</label>
			<div class="col-xs-8">
        	 <input type="text" class="form-control" name="user_phone" placeholder="ex)000-0000-0000" required="required">
        	</div>
        </div>
        <div class="form-group">
			<label class="control-label col-xs-4 divcountrol" >생년월일 *</label>
			<div class="col-xs-8">
                <input type="date" class="form-control" name="user_birth" required="required">
            </div>        	
        </div>
        <div class="form-group">
			<label class="control-label col-xs-4 divcountrol">주 소 *</label>
			<div class="col-xs-8 inputControl">
                <input type="text" class="form-control" name="user_zip" placeholder="우편번호" required="required">
            </div>
            <div>
               	<button type="button" class="btn btn-primary" id="searchAddr" onclick="goPopup()" >주소 검색</button>
            </div> 
            <br> 
			<label class="control-label col-xs-4 divcountrol"></label>
            <div class="col-xs-8">
                <input type="text" class="form-control" name="user_adr" required="required">
                <input type="text" class="form-control" name="user_detailadr" placeholder="상세 주소" >
            </div>
        </div>         	
	
		<div class="form-group">
			<div class="col-xs-8 col-xs-offset-4">
				<button type="submit" class="btn btn-primary btn-lg" name="signUpBtn" >회원가입</button>
			</div>  
		</div>			      
    </form>
	<div class="text-center">이미 계정이 있으신가요?<a href="login">로그인 화면으로 이동</a></div>
</div>

<script type="text/javascript">
/*도로명주소 API*/
	function goPopup(){
		var pop = window.open("jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	
	function jusoCallBack(roadAddrPart1,addrDetail,roadAddrPart2, zipNo){
		 document.form.user_zip.value = zipNo;
		 document.form.user_adr.value = roadAddrPart1;
		 document.form.user_detailadr.value = addrDetail+" "+roadAddrPart2;
	}
</script>

</body>
</html>