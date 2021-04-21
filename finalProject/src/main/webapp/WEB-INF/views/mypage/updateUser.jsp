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
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 --><script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
    <style>
	body {
		color: #999;
		background: #f3f3f3;
		font-family: 'Roboto', sans-serif;
	}
    .form-control {
		border-color: #eee;
        min-height: 41px;
		box-shadow: none !important;
		padding-left:10px !important;
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
		width:200px !important;
		margin-right:20px;
	}
	.inputControl2{
		width:120px !important;
	}

</style>
<script>
		/*
		 * form 태그 안의 버튼은 type을 정의하지 않으면 submit 으로 간주하여 post로 넘어가기 때문에 button 타입 정의 해주어야함
		 */
		var pwCk=0;

		$(document).ready(function(){
			
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
			
		});//end 

		function pwCheck(){
			var pw = $('[name=user_pwd]').val();
			console.log(pw);
			if(pw != null && pw != ""){
				if(pwCk == 0){
					alert("변경하실 비밀번호를 확인해주세요.");
					return false;
				} else {
					return true;
				}
			} else {
				return true;
			} 
		}
</script>
</head>
<body>
<section class="pcoded-main-container">
	<div class="pcoded-main-container">
		<div class="signup-form">
			 <form onsubmit="return pwCheck();" action="updateUser" method="post" class="form-horizontal" name="form">
				<div class="col-xs-8 col-xs-offset-4">
					<h2>회원 정보 수정</h2>
				</div>	
				<div class="form-group">
					<label class="control-label col-xs-4 divcountrol" >아이디</label>
					<div class="col-xs-8">
						<input type="text" class="form-control" name="user_id" value="${list.user_id }">
						<font id="idCheckNotice" size=2></font>
					</div>		        	
				</div>
				<div class="form-group">
					<label class="control-label col-xs-4 divcountrol" >비밀번호 변경</label>
					<div class="col-xs-8">
						<input type="password" class="form-control" name="user_pwd" >
					</div>        	
				</div>
				<div class="form-group">
					<label class="control-label col-xs-4 divcountrol" >변경 확인</label>
					<div class="col-xs-8">
						<input type="password" class="form-control" name="confirm_pwd">
						<font id="pwCkNotice" size=2></font>
					</div>        	
				</div>
				<div class="form-group">
					<label class="control-label col-xs-4 divcountrol" >이 름</label>
					<div class="col-xs-8">
						<input type="text" class="form-control" name="user_name" value="${list.user_name }">
					</div>        	
				</div>
				<div class="form-group">
					<label class="control-label col-xs-4 divcountrol" >이메일</label>
					<div class="col-xs-8">
						<input type="email" class="form-control" name="user_email" value="${list.user_email }">
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-xs-4 divcountrol" >연락처</label>
					<div class="col-xs-8">
					 <input type="text" class="form-control" name="user_phone" value="${list.user_phone }">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-xs-4 divcountrol" >생년월일</label>
					<div class="col-xs-8">
						<input type="date" class="form-control" name="user_birth" value="${list.user_birth }">
					</div>        	
				</div>
				<div class="form-group">
					<label class="control-label col-xs-4 divcountrol">주 소</label>
					<div class="inputControl">
						<input type="text" class="form-control" name="user_zip" placeholder="우편번호" value="${list.user_zip }" style="float:left;">
					</div>
					<div class="btnControl">
						<button type="button" class="btn btn-primary" id="searchAddr" onclick="goPopup()" style="float:right;">주소 검색</button>
					</div> 
					<br> 
					<label class="control-label col-xs-4 divcountrol"></label>
					<div class="col-xs-8">
						<input type="text" class="form-control" name="user_adr" value="${list.user_adr }">
						<input type="text" class="form-control" name="user_detailadr" value="${list.user_detailadr }" >
					</div>
				</div>         	
			
				<div class="form-group" align="center !important">
					<div class="col-xs-8 col-xs-offset-4" >
						<button type="submit" class="btn btn-primary btn-lg" name="updateBtn" >수정</button>
					</div>  
				</div>			      
			</form>
		</div>
	</div>	
</section>		
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