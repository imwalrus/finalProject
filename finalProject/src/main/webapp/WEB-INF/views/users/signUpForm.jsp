<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
<title>회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
		background: #5cd3b4;
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
	#idCheck,#searchAddr {
		font-size:13px;
		width:90px !important;
		height:41px;
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
	$(function(){
		//ID 중복체크
		var idCk=0;
		$('#idCheck').on('click',function(){
			var id = $('[name=user_id]').val();
			$.ajax({
				url:"idCheck?user_id=",
				type:"get",
				data:id,
				success:function(count){
					console.log(count);
				}
			})
		})
		
		//비밀번호 확인
	})
</script>
</head>
<body>
<div class="signup-form">
    <form action="signUp" method="post" class="form-horizontal">
		<div class="col-xs-8 col-xs-offset-4">
			<h2>회원가입</h2>
		</div>	
        <div class="form-group">
			<label class="control-label col-xs-4 divcountrol" >아이디 *</label>
			<div class="col-xs-8 inputControl">
                <input type="text" class="form-control" name="user_id" >
            </div>
            <div>
               	<button type="button" class="btn btn-primary" id="idCheck">ID 중복체크</button>
            </div>
            <div class="check_font" id="id_check"></div>   		        	
        </div>
		<div class="form-group">
			<label class="control-label col-xs-4 divcountrol">비밀번호 *</label>
			<div class="col-xs-8">
                <input type="password" class="form-control" name="user_password" >
            </div>        	
        </div>
		<div class="form-group">
			<label class="control-label col-xs-4 divcountrol">확인</label>
			<div class="col-xs-8">
                <input type="password" class="form-control" name="confirm_password" >
            </div>        	
        </div>
        <div class="form-group">
			<label class="control-label col-xs-4 divcountrol">이 름 *</label>
			<div class="col-xs-8">
                <input type="text" class="form-control" name="user_name" >
            </div>        	
        </div>
        <div class="form-group">
			<label class="control-label col-xs-4 divcountrol">이메일 *</label>
			<div class="col-xs-8">
                <input type="email" class="form-control" name="user_email" >
                <br>
               <div id="btnControl">
               		<button class="btn btn-primary" id="emailCheck">이메일 인증</button>        	
               </div>
        	</div>
        </div>
        <div class="form-group">
			<label class="control-label col-xs-4 divcountrol">연락처 *</label>
			<div class="col-xs-8">
        	 <input type="text" class="form-control" name="user_phone" >
        	</div>
        </div>
        <div class="form-group">
			<label class="control-label col-xs-4 divcountrol">생년월일 *</label>
			<div class="col-xs-8">
                <input type="date" class="form-control" name="user_birth" >
            </div>        	
        </div>
        <div class="form-group">
			<label class="control-label col-xs-4 divcountrol">주 소 *</label>
			<div class="col-xs-8 inputControl">
                <input type="text" class="form-control" name="user_zip" placeholder="우편번호">
            </div>
            <div>
               	<button class="btn btn-primary" id="searchAddr">주소 검색</button>
            </div> 
            <br> 
			<label class="control-label col-xs-4 divcountrol"></label>
            <div class="col-xs-8">
                <input type="text" class="form-control" name="user_adr">
                <input type="text" class="form-control" name="user_detailadr" placeholder="상세 주소">
            </div>
        </div>         	
	
		<div class="form-group">
			<div class="col-xs-8 col-xs-offset-4">
				<button type="submit" class="btn btn-primary btn-lg" >회원가입</button>
			</div>  
		</div>			      
    </form>
	<div class="text-center">이미 계정이 있으신가요?<a href="login">로그인 화면으로 이동</a></div>
</div>
</body>
</html>