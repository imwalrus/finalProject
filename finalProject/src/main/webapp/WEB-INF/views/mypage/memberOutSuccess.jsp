<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
	.main{
	margin-top:100px;
	margin-bottom:50px;
	
	}
	.out{
		border: 2px solid rgba(0, 0, 0, 0);
		width:700px;
		height:250px;
		border-radius:15px;
		text-align:center;
		padding-top:50px;
		margin:0 auto;
		background-color:#FFFAE9;
	}
	
	.outClass{
		list-style:none;
	}
	.outClass .outClassList{
		font-size:30px;
		color:#7C5646;
	}
	#logo{
		width:140px;
		height:50px;
	}
	#moveMain{
		color:black;
		font-size: medium;
	}
	.btn-primary{
		color: #fff !important;
 		background-color: #78c2ad !important;
  		border-color: #78c2ad !important;
	}
</style>
<body>
	<div class="main">
		<div class="out">
		<ul class="outClass">
			<li class="outClassList">회원 탈퇴 처리가 완료되었습니다.</li>
			<li class="outClassList">이용해주셔서 감사합니다.</li>
		</ul>
			<img id="logo" src="resources/images/logo/logo.png" >
		</div>	
	</div>
	<div align="center">
		<a id="moveMain" class="btn btn-primary btn-lg" href="/temp">메인페이지로 이동</a>
	</div>
</body>
</html>