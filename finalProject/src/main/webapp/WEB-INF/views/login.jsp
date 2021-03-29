<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="KO">
<head>
	<title>Login V14</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="resources/login/images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="resources/login/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="resources/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="resources/login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="resources/login/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="resources/login/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="resources/login/vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="resources/login/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="resources/login/vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="resources/login/css/util.css">
	<link rel="stylesheet" type="text/css" href="resources/login/css/main.css">
	
	<script src="resources/login/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="resources/login/vendor/animsition/js/animsition.min.js"></script>
	<script src="resources/login/vendor/bootstrap/js/popper.js"></script>
	<script src="resources/login/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/login/vendor/select2/select2.min.js"></script>
	<script src="resources/login/vendor/daterangepicker/moment.min.js"></script>
	<script src="resources/login/vendor/daterangepicker/daterangepicker.js"></script>
	<script src="resources/login/vendor/countdowntime/countdowntime.js"></script>
	<script src="resources/login/js/main.js"></script>
	
<!-- <script type="text/javascript">
	$(document).ready(function(){
		$("[name=signupButton]").on("click", function(){
			location.href="redirect:signUpForm";
		})
	})
</script> -->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
				<form class="login100-form validate-form flex-sb flex-w">
					<span class="login100-form-title p-b-32">
						청년농장 로그인
					</span>

					<span class="txt1 p-b-11">
						아이디
					</span>
					<div class="wrap-input100 validate-input m-b-36" data-validate = "Username is required">
						<input class="input100" type="text" name="username" >
						<span class="focus-input100"></span>
					</div>
					
					<span class="txt1 p-b-11">
						비밀번호
					</span>
					<div class="wrap-input100 validate-input m-b-12" data-validate = "Password is required">
						<span class="btn-show-pass">
							<i class="fa fa-eye"></i>
						</span>
						<input class="input100" type="password" name="pass" >
						<span class="focus-input100"></span>
					</div>
					
					<div class="flex-sb-m w-full p-b-48">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
							<label class="label-checkbox100" for="ckb1">
								아이디 저장하기
							</label>
						</div>

						<div>
							<a href="#" class="txt3">
								아이디/비밀번호 찾기
							</a>
						</div>
					</div>
					<div class="container-login100-form-btn1">
						<button class="login100-form-btn">로그인</button>
					</div>
				</form>
<!-- 				<div class="container-login100-form-btn1" style="display:inline-flex">
					<button class="login100-form-btn" name="signupForm">회원가입</button>
				</div> -->
			</div>
		</div>
	</div>
	

</body>
</html>