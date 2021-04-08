<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 대화창</title>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.min.css'>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">	
  <link rel="stylesheet" href="resources/chat/style.css">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>	
  <script  src="resources/chat/script.js" ></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.2/sockjs.js"></script>
<style>
	body{
		font-family: 'Noto Sans KR', sans-serif;
	}
	.chat-bubble{
		width: 300px !important;
		font-size: small;
	}
	.offset-md-9 {
	   	margin-left: 53% !important;
	}
	.chat-bubble--right{
		text-align:right !important;
	}
	.container{
		height:600px !important; 
	}
	.sendBtn{
		cursor:pointer;
	}
	.col-md-3{
		max-width:100% !important;
	}
	.chatMiddle{
		overflow:auto;
		height:456px;
	}

</style>
</head>
<body>
	<tiles:insertAttribute name="content"/>
</body>
</html>