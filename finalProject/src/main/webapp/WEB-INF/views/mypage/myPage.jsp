<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="resources/main/css/style.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Baloo+Paaji">
<style>
body .pcoded-main-container{
	background-image: url("resources/images/mypage/myPageImage.png");
	background-size: cover;
	margin-left: 0px !important;
	overflow-x:hidden;
} 
@keyframes ani {
  from {
    transform: scale(0);
  }
  to {
    transform: scale(1);
  }
}
body {
  background: black;
}
.circle {
  position: relative;
  top: 200px;
  right: 1000px;
  bottom: 50px;
  left: 400px;
  z-index: 1;
  margin: 0;
  width: 500px;
  height: 500px;
  border-radius: 50%;
  background: #c3e6cb;
  animation: ani 3s alternate infinite;
}
.text {
  mix-blend-mode: difference;	
  position: relative;
  right: 1500px;
  bottom: 180px;
  left: 200px;
  z-index: 2;
  margin: 0;
  height: 30px;
  font-size: 50px;
  font-weight: bold;
  color: #ffffff;
}
</style>
<section class="pcoded-main-container">
<div class="pcoded-main-container">
<div class="circle"></div>
<div class="text">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;환영합니다<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${user_id }&nbsp;&nbsp;&nbsp;&nbsp;님의<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;마이페이지 입니다.
</div>
</div>
</section>