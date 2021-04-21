<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<title>아이디, 비밀번호 찾기</title>
<style>
.form-control {
	font-size: 15px;
}
.form-control, .form-control:focus, .input-group-text {
	border-color: #e1e1e1;
}
.form-control, .btn {        
	border-radius: 3px;
}
.signup-form {
	width: 400px;
	margin: 0 auto;
	padding: 30px 0;
	display:inline-block;
}
.signup-form form {
	color: #999;
	border:2px solid #E6E4E4;
	border-radius: 3px;
	margin-bottom: 15px;
	background: #fff;
	padding: 30px;
}
.signup-form h2 {
	color: #333;
	font-weight: bold;
	margin-top: 0;
}
.signup-form hr {
	margin: 0 -30px 20px;
}
.signup-form .form-group {
	margin-bottom: 20px;
}
.signup-form label {
	font-weight: normal;
	font-size: 15px;
}
.signup-form .form-control {
	min-height: 38px;
	box-shadow: none !important;
}	
.signup-form .input-group-addon {
	max-width: 42px;
	text-align: center;
}	
.signup-form .btn, .signup-form .btn:active {        
	font-size: 14px;
	font-weight: bold;
	background: #78c2ad !important;
	border: none;
	min-width: 140px;
}
.signup-form .btn:hover, .signup-form .btn:focus {
	background: #179b81 !important;
}
.signup-form a {
	color: #fff;	
	text-decoration: underline;
}
.signup-form a:hover {
	text-decoration: none;
}
.signup-form form a {
	color: #19aa8d;
	text-decoration: none;
}	
.signup-form form a:hover {
	text-decoration: underline;
}
.signup-form .fa {
	font-size: 21px;
}
.signup-form .fa-paper-plane {
	font-size: 18px;
}
.signup-form .fa-check {
	color: #fff;
	left: 17px;
	top: 18px;
	font-size: 7px;
	position: absolute;

}
.signupDiv{
	margin-top: 50px;
}
</style>
<script>
$(document).ready(function(){
	$('.modal').hide();
	
	/////////모///달///기///능///////////
	// 2. 모달창 닫기 버튼
	$('[name=close]').on('click', function() {
		$('.modal').hide();
	});
	// 3. 모달창 위도우 클릭 시 닫기
	$(window).on('click', function() {
		if (event.target == $('.modal').get(0)) {
            $('.modal').hide();
         }
	});


	
	
	//아이디찾기(모달로 화면에 띄우기)
	$("[name=idFindBtn]").on('click',function(){
		var name = $('[name=user_name]').val();
		var birth = $('[name=user_birth]').val();
		var email = $('[name=user_email]').val();
		$.ajax({
			url:"idFind",
			data:{"user_name":name,"user_birth":birth,"user_email":email},
			method:"POST",
			success:function(response){
				console.log(response.user_id);
				if(response == 0){
					$('.modal').show();
					$('.modal-body').find('p').html("일치하는 정보가 없습니다. <br> 입력하신 정보를 다시 확인해주세요.")
				} else{
					$('.modal').show();
					$('.modal-body').find('p').html("회원님의 아이디는 <h3>"+response.user_id+"</h3> 입니다.");
				}
			}
		})
	});
	
	//비밀번호 찾기(메일로 임시비밀번호 보내기)
	//비밀번호 찾기를 해서 정보가 있으면 메일 전송 , 없으면 alert
	$("[name=pwFindBtn]").on('click',function(){
		var id = $('#id').val();
		var birth = $('#birth').val();
		var email = $('#email').val();
		$.ajax({
			url:"pwFind",
			data:{"user_id":id,"user_birth":birth,"user_email":email},
			type:"POST",
			async:false,
			dataType:"json",
			success:function(response){
				console.log(response);
				if(response == 1){
					$.ajax({
						url:"pwFindEmail",
						data:{"user_id":id,"user_email":email},
						success:function(response){
							if(response==1){
								alert('입력하신 메일로 임시비밀번호가 발급되었습니다.');
							}else{
								alert('메일 전송 오류');
							}
						}
					});
				} else {
					alert('일치하는 정보가 없습니다. 입력하신 정보를 확인해주세요');
				}
			}
		});
	});
	
});

</script>
</head>
<body>
<div class="signupDiv" align="center">

	<!-- id찾기 form -->
	<div class="signup-form">
	    <form name="idFindFrm" method="post">
			<h3>아이디 찾기</h3>
			<hr>
	        <div class="form-group">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							이 름
						</span>                    
					</div>
					<input type="text" class="form-control" name="user_name" placeholder="Username" required="required">
				</div>
	        </div>
	        <div class="form-group">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							생년월일
						</span>                    
					</div>
					<input type="date" class="form-control" name="user_birth" required="required">
				</div>
	        </div>
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							이메일
						</span>                    
					</div>
					<input type="email" class="form-control" name="user_email" placeholder="Email Address" required="required">
				</div>
	        </div>
			<div class="form-group" align="center">
	            <button type="button" class="btn btn-primary" name="idFindBtn">아이디 찾기</button>
	        </div>
	    </form>
	</div>
	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
    <!-- 비밀번호 찾기 form -->
    <div class="signup-form">
    <form name="pwFindFrm" method="post">
		<h3>비밀번호 찾기</h3>
		<hr>
        <div class="form-group">
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">
						아이디
					</span>                    
				</div>
				<input type="text" class="form-control" name="user_id" id="id" placeholder="Confirm Password" required="required">
			</div>
        </div>
        <div class="form-group">
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">
						생년월일
					</span>                    
				</div>
				<input type="date" class="form-control" name="user_birth" id="birth" required="required">
			</div>
        </div>
		<div class="form-group">
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">
						이메일
					</span>                    
				</div>
				<input type="email" class="form-control" name="user_email" id="email" placeholder="email Address" required="required">
			</div>
        </div>
		<div class="form-group" align="center">
            <button type="button" class="btn btn-primary" name="pwFindBtn">비밀번호 찾기</button>
        </div>
    </form>
   </div>
</div> 

   <!-- 모달화면 -->

<div class="modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"> 회원님의 아이디는? </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p></p>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-secondary" data-dismiss="modal" name="close">Close</button>
      </div>
    </div>
  </div>
</div>	
	
</body>
</html>